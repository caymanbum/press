# Updating Iguana to Use Safer System Calls

Many C functions like `sprintf` are used to format and store data in memory buffers, but older versions such as `sprintf` don’t limit how much data they write. This can cause buffer overflows—an attacker could exploit this to crash the program or run malicious code. To fix this, modern code uses safer functions like `snprintf`, where you specify the maximum buffer size. This prevents overflowing by truncating the output if it’s too long, rather than writing past the end of memory.

In the Iguana 6 update, insecure system calls like `sprintf` are systematically replaced with their secure counterparts like `snprintf`, always specifying buffer sizes. This simple switch makes the program much safer by eliminating a classic vulnerability, guarding against both attacks and accidental crashes.

The process for this improvement is straightforward: first, identify risky functions like `sprintf` or `strcpy`; next, replace them with secure alternatives such as `snprintf` and specify buffer limits; finally, thoroughly test the code to confirm all changes handle memory safely.

Overall, using safer system calls in Iguana 6 significantly improves security and reliability by following modern secure coding practices and reducing the risk of memory-related bugs.

Another significant issue is resolving what to do with [Chameleon given it's Delphi 4 dependencies](chameleon.md).
