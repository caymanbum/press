# Flow Shell in Lua: Project Breakdown

Imagine having FlowShell implemented as a tiny compact cosmopolitan binary that has all of it's lua code embedded in it.  Just a single cross platform binary that can run on any operating system.

So much could be achieved with this - it becomes an enabler of the entire affiliate network - it could even allow communication chat between affiliates and iNTERFACEWARE customers over secure channels.

## 1. **File Enumeration API**

**Requirements:**
- Expose directory listing to Lua using Cosmopolitan APIs.
- API Example:
    ```lua
    local fs = require("fs")

    for name in fs.dir(".") do
        if name ~= "." and name ~= ".." then
            print(name)
        end
    end
    ```
**Tasks:**
- [ ] Identify Cosmopolitan’s C functions for directory enumeration (e.g. `readdir`, `opendir`).
- [ ] Write Lua C bindings, exposing (`fs.dir`) as an iterator/generator.
- [ ] Handle common edge-cases: non-ASCII characters, symbolic links, etc.
- [ ] Unit test with nested directories.
Probably use stat to get the file information- directory or file etc.

---

## 2. **Process Spawn Implementation**

**Requirements:**
- Spawn sub-processes, get their stdout, stderr, and exit status.
- API Example:
    ```lua
    local p = process.spawn{
        command = "git",
        args = {"status"},
    }

    local out = p.stdout:read("*a")
    local err = p.stderr:read("*a")
    local rc  = p:wait()
    ```
**Tasks:**
- [ ] Use Cosmopolitan’s facilities to spawn processes (`fork`, `exec`, `posix_spawn`, or similar).
- [ ] Expose as `process.spawn` in Lua, returning a table with `stdout`, `stderr` file handles and a `wait` method.
- [ ] Support process environment overrides, working directory, etc.
- [ ] Error handling: failed spawns, bad command, crash, etc.
- [ ] Example scripts and tests.

---

## 3. **JSON Parser**

**Requirements:**
- Parse JSON efficiently into Lua tables.
- Streaming preferred: avoid full-buffer-to-C-struct copying.
- Consider reusing IguanaX parser OR writing a streaming one directly.
**Tasks:**
- [ ] Evaluate: extract JSON C code from IguanaX, or write new streaming parser.
- [ ] Bind to Lua so that `json.decode(string | file)` returns native Lua tables.
- [ ] Ensure correctness and security (DoS, broken input, etc).
- [ ] Add fuzz tests, large-object tests.
- [ ] Optionally: support JSON streaming (parse incrementally).

---

## 4. **Hierarchical Command Shell in Lua**

**Requirements:**
- Interactive shell: 
    - Reads commands from user.
    - Commands are defined by a directory structure of Lua files.
    - E.g.:
        ```
        +git+publish/push.lua
        +md+read/edit.lua
        ```
- Should support command autocomplete, history, etc., if possible.
**Tasks:**
- [ ] Define a convention for commands on disk: directory tree => command tree.
- [ ] Implement command lookup in Lua:
    - Parse user input, resolve into file path, e.g. `git publish push` → `git/publish/push.lua`
- [ ] Load (require/do) Lua files as functions to run.
- [ ] Implement basic readline (or simple equivalent).
- [ ] Implement command help, listing, and argument passing.
- [ ] Write sample commands to test (mock: git status, md read).
- [ ] Test nested/hierarchical commands.

---

## 5. **Cross-Platform Packaging**

**Steps:**
- [ ] Ensure Lua interpreter+custom modules build as Cosmopolitan "amalgamated" binary.
- [ ] CI: test on Windows, Linux, Mac (via binaries).
- [ ] Provide a zero-dependency installer.

Probably could embed the source in the binary - using zip - apparently cosmopolitan already has zipos so it's probably a good starting point.
---

## 6. **Integration and Tests**

**What:**
- [ ] Scripted regression/unit tests for filesystem, process, parser, shell command loading.
- [ ] Integration test covering "end-to-end": invoke command → run subprocess → parse JSON → print results.

---

# **Summary Table**

| Feature               | Status      | Notes                |
|-----------------------|-------------|----------------------|
| Dir Enumeration       | [ ]         | C bindings           |
| Process Spawner       | [ ]         | C bindings           |
| JSON Parser           | [ ]         | From Iguana or new   |
| Shell Infra (Lua)     | [ ]         | Command file mapping |
| Packaging (binary)    | [ ]         | Cosmopolitan build   |
| Tests and Examples    | [ ]         | For every layer      |

---

## **Next Steps**

1. **Prototype** the barebones C bindings (dir/process) and load from Lua.
2. **Decide** on JSON parser method (reuse or write).
3. **Write** simple shell loader in Lua that traces command->Lua file mapping.
4. **Set up** a monorepo tree for everything (`src/c`, `src/lua`, `cmd/`, etc).

---


