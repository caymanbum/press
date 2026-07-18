# Minimal ZIP File Format Specification

**Goal:**  
Produce a valid ZIP archive containing a single file (e.g., `"hello.txt"`), with no compression ("Stored" method), using only the strict minimum of required features and fields, so that the archive is:  
- **Extractable by all ZIP tools**
- **Conforms with the ZIP spec**

---

## 1. Structures Required

A valid ZIP file with one file requires the following, in this order:

| Offset (relative to start of file) | Structure                        | Description                   |
|-------------------------------------|----------------------------------|-------------------------------|
| 0                                   | Local file header                | Header preceding file data     |
| +                                   | File data                        | Raw file contents             |
| +                                   | Central directory header         | Summary of one archive entry  |
| +                                   | End of central directory record  | Points to the directory start |

---

## 2. Structure Details

Below is each structure, **with only required fields** and offsets, as required by the [PKWARE specification](https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT).

#### A. Local File Header (per-file)

| Size   | Field Offset | Field Name         | Value                            |
|--------|-------------|--------------------|----------------------------------|
| 4      | 0           | Signature          | `0x04034b50` ("PK\\x03\\x04")      |
| 2      | 4           | Version to extract | `20 00` (2.0)                    |
| 2      | 6           | Bit flags          | `00 00` (no encryption, etc.)    |
| 2      | 8           | Compression method | `00 00` (Store/no compression)   |
| 2      | 10          | mod time           | Usually `00 00`                  |
| 2      | 12          | mod date           | Usually `00 00`                  |
| 4      | 14          | CRC32              | CRC-32 of file data              |
| 4      | 18          | Compressed size    | Size of file                     |
| 4      | 22          | Uncompressed size  | Size of file                     |
| 2      | 26          | Filename length    | Length (N) of filename           |
| 2      | 28          | Extra length       | `00 00` (none)                   |
| N      | 30          | Filename           | e.g., `hello.txt`                |
| M      | ...         | Extra              | omitted (length=0)               |

Directly **after** comes **file data**: ('Store' method: bytes are simply dumped in-place).

#### B. File Data

| Size | Offset | Description      |
|------|--------|------------------|
| M    | --     | File bytes       |
| ---  | --     | (next structure) |

#### C. Central Directory File Header

| Size   | Field Off | Field Name         | Value                             |
|--------|----------|--------------------|-----------------------------------|
| 4      | 0        | Signature          | `0x02014b50` ("PK\\x01\\x02")       |
| 2      | 4        | Version made by    | `20 00` (2.0)                     |
| 2      | 6        | Version to extract | `20 00` (2.0)                     |
| 2      | 8        | Bit flags          | `00 00`                           |
| 2      | 10       | Compression method | `00 00`                           |
| 2      | 12       | Mod time           | `00 00`                           |
| 2      | 14       | Mod date           | `00 00`                           |
| 4      | 16       | CRC32              | CRC-32                            |
| 4      | 20       | Compressed size    | Size of file                      |
| 4      | 24       | Uncompressed size  | Size of file                      |
| 2      | 28       | Filename length    | Length (N) of filename            |
| 2      | 30       | Extra length       | `00 00`                           |
| 2      | 32       | File comment length| `00 00`                           |
| 2      | 34       | Disk # start       | `00 00`                           |
| 2      | 36       | Int file attrs     | `00 00`                           |
| 4      | 38       | Ext file attrs     | `00 00 00 00`                     |
| 4      | 42       | Local hdr offset   | Offset to local file header start |
| N      | 46       | Filename           | e.g., `hello.txt`                 |
| M      | ...      | Extra              | (none: 0)                         |
| L      | ...      | File comment       | (none: 0)                         |

#### D. End of Central Directory Record

| Size | Field Offset | Field Name           | Value                             |
|------|-------------|----------------------|-----------------------------------|
| 4    | 0           | Signature            | `0x06054b50` ("PK\\x05\\x06")       |
| 2    | 4           | Disk #               | `00 00`                           |
| 2    | 6           | Central dir start    | `00 00` (single disk)             |
| 2    | 8           | # entries disk       | `01 00` (1 file)                  |
| 2    | 10          | # entries total      | `01 00` (1 file)                  |
| 4    | 12          | Central dir size     | Size of central directory (bytes) |
| 4    | 16          | Offset to directory  | Offset to central directory       |
| 2    | 20          | Comment length       | `00 00` (no comment)              |
| Q    | ...         | Comment              | (none)                            |

---

## 3. Example File Layout

Suppose we are zipping `"hello.txt"` containing 12 bytes: `Hello world\
`.

Let:

- N = filename length (9)
- M = file size (12)
- Local file header always ends at offset: 30+N

### Layout

| Offset | Content                     |
|--------|-----------------------------|
| 0      | Local file header           |
| 30+N   | File data (12 bytes)        |
| ...    | Central directory header    |
| ...    | End of central directory    |

---

## 4. Fields Calculation

- **CRC32**: Must be computed for the file data.
- **Sizes**: All sizes must be correct and match actual data.
- **All offsets**: Particularly, in the Central Directory header, the offset to the Local File Header (from the start of the file) must be set to 0.

---

## 5. C/C++ Implementation Tips

- **Use fixed values** for all fields except the ones described (filename, file size, CRC, etc).
- **Write structures in order**, respecting little-endian format for all integral fields.
- Avoid all optional fields (extra, comment, etc).
- Use only 1 entry in the archive.
- **No compression**: Compression method = 0 ("store").
- **No encryption, no split, no volume zip, no extended attributes**.

---

## 6. Visual Structure Example

```text
[Local file header][hello.txt][Central directory][EOCD]
```

---

## 7. Smallest Possible ZIP (hex)

For a file with **empty contents** `"empty.txt"` (just for example):

```
50 4B 03 04 14 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 08 00 00 00 65 6D 70 74 79 2E 74 78 74
50 4B 01 02 14 00 14 00 00 00 00 00 00 00 00 00 00 00 00 00 08 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 65 6D 70 74 79 2E 74 78 74
50 4B 05 06 00 00 00 00 01 00 01 00 XX XX XX XX XX XX 00 00
```

(`XX XX` = correct directory data/offset sizes)

---

## 8. References

- [PKWARE ZIP Format Spec](https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT)
- [Info-ZIP appnote.txt](https://infozip.sourceforge.net/doc/appnote-19970311-iz.zip)

---

## 9. FAQ

- **Why not compression?** Removes zlib/dependency and makes the smallest code.
- **Why not DOS file attributes?** Most tools do not require them. Can be left default/zero.

---

## 10. Minimal Implementation Checklist

- [x] Local file header
- [x] File data
- [x] Central directory header
- [x] End of central directory record
- [x] All sizes/offsets calculated and little-endian

---

## 11. Pseudocode / Skeleton

```c
write_local_header();
write_file_data();
store_position_central_dir();
write_central_directory_header();
write_end_of_central_directory_record();
```

---

**This spec provides everything needed to write the minimal possible .zip file compliant with all standard tools.**
# Minimal Zip Implementation

What is the most minimal implementation of C/C++ library to make a zip file that can be unzipped by all zip clients?**

## Explanation

A zip file is [specified in detail by PKWARE](https://pkware.cachefly.net/webdocs/casestudies/APPNOTE.TXT). Even the **simplest valid zip file** is a binary file with **at least the following structures**:

1. **Local file header**
2. **File data**
3. **Central directory header**
4. **End of central directory record**

All byte offsets and meanings are explained in the spec linked above.

## What is the most minimal zip file?

- A zip archive with a single file (such as "hello.txt"), with no compression.
- The file is small (can even be zero-length).
- Uses only "store" method (no actual compression).



