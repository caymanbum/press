# Queue Architecture Reimagination

The same library could also provide the binary storage format for a clean reimplementation of the queue architecture originally developed for Iguana X.

## What is a Queue?

A queue is fundamentally an ordered collection of durable records. Each record contains a message, its metadata and enough state to determine whether it has been processed successfully.

### Primitives Needed in ZIP Format

The ZIP format already provides many of the primitives needed to represent this efficiently: named entries, binary payloads, checksums, append-oriented writing and a central directory that acts as an index over the contents of the archive.

## Structured Sequence of Immutable Message Records

Instead of treating a ZIP file as a collection of unrelated documents, the queue implementation could treat it as a structured sequence of immutable message records. Each message would be written as a new entry, perhaps with a name derived from its monotonically increasing sequence number:

```
messages/0000000000000001.data
messages/0000000000000001.meta
messages/0000000000000002.data
messages/0000000000000002.meta
```

The metadata could contain the message timestamp, source channel, destination, processing status, retry count, content type and a cryptographic digest of the payload.

## Append-Only Event History

State changes could instead be represented as additional records:

```
events/0000000000000001/received
events/0000000000000001/attempt-0001
events/0000000000000001/completed
```

This produces an append-only event history. Append-only storage is attractive because it is much easier to reason about than a database file that is constantly being modified in place.

## Natural Audit Trail

The system can reconstruct exactly what happened to a message, when it happened and which process performed the operation.

### Fast Indexing with ZIP Central Directory

The ZIP central directory could provide the fast index needed when opening a completed queue segment. The system would not need to scan every byte of the archive to find a particular message.

## Bounded Archive Segments

The queue could be divided into bounded archive segments rather than allowing one file to grow forever:

```
queue-2026-07-15-000001.zip
queue-2026-07-15-000002.zip
queue-2026-07-15-000003.zip
```

Once a segment reaches a configured size or age, it would be closed and become immutable. A new segment would then be created.

## Easy Recovery

Closed segments could be copied, compressed, replicated, inspected, archived or deleted according to retention policy without interfering with the live queue.

## Security Extensions

The same format could be used for both the live queue and the permanent transaction logs. A message could move through the system without repeatedly being translated into unrelated representations.

Encryption would be a natural extension, but it should come only after the credential-management system is solved properly.

### Encryption of Queue Segments

Once the credential vault exists, every queue segment could be encrypted using a randomly generated symmetric data key. That data key could then be wrapped for the public keys of the authorized machines, administrators or recovery devices.

The private keys would remain protected by local secure hardware and could be unlocked using trusted local authentication.

### Authenticated Encryption

Authenticated encryption would also protect the logs against silent modification. An attacker could not change a message, remove bytes or substitute a different record without detection.

Additional signatures or a hash chain could make deletion, insertion and reordering detectable as well:

```
record_hash =
    HASH(
        previous_record_hash ||
        sequence_number ||
        metadata ||
        encrypted_payload
    )
```

Each record would therefore commit to the record before it. A signed segment manifest could commit to the entire archive.

This would provide strong evidence that the log is complete and has not been rewritten after the fact.

### Compact Library

That combination could replace a large amount of complicated database and logging infrastructure with a compact format that is easy to inspect, recover, replicate and independently implement.

ZIP would provide the open container and indexing model. The queue layer would define the stricter record structure and transactional rules. The cryptographic layer would provide confidentiality, integrity, authorization and tamper evidence.

This compact library could support several related applications:

 * a portable credential vault;
 * a durable Iguana message queue;
 * an append-only transaction log;
 * encrypted operational archives;
 * tamper-evident audit records; and
 * secure replication to untrusted storage.
