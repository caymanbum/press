# Cosmopolitan - Universal Binaries 

It sounds impossible and yet this tool makes binaries which will work on Mac, Linux and Windows

The **Cosmopolitan project**, also referred to as **Cosmopolitan Libc** or **Cosmo**, is an ambitious open source initiative that enables developers to build single binary executables that run natively on a broad spectrum of operating systems, notably including Windows, Linux, and macOS. The primary goal of Cosmopolitan is to provide a unified development environment where a single build process can target multiple major platforms without requiring per-platform porting, emulation, or platform-dependent compilation.

At its core, Cosmopolitan Libc functions as a highly portable C standard library (libc) implementation, offering APIs that closely match those of musl, BSD, and GNU libc, while also covering the nuances required by Windows. The magic behind Cosmopolitan lies in its toolchain, linker tricks, and clever binary format creation: Cosmopolitan can generate “universal” binaries, commonly ELF files, which contain tailored headers, stubs, and compatibility layers so that the same file is interpreted correctly by the loaders on Linux, Windows (PE/COFF), and sometimes even macOS (via Mach-O support). This approach enables a developer to simply distribute a single `.com` or `.exe` file that just works cross-platform, dramatically simplifying deployment.

Cosmopolitan is particularly attractive for building CLI tools, small utilities, and applications where minimal dependencies and maximum portability are desirable. Its “one binary for all systems” model is inspired by the classic MS-DOS .com and .exe formats in their simplicity, but extended to modern, complex operating systems. The Cosmopolitan project also includes “APE” (Automatic Platform Emulator), which helps interpret system calls correctly across platforms, and ships with a suite of developer tools to assist in cross-platform builds and debugging.

In summary, the Cosmopolitan project is a groundbreaking solution for cross-platform native binary creation. It liberates developers from the hassles of per-OS compilation and dependency management, offering a practical way to “write once, run anywhere” at the native code level—something that was previously possible only with interpreted languages or via heavyweight frameworks. Its growing popularity among systems programmers and tooling authors is a testament to the elegance and power of this “portable libc” philosophy.

It was written by [Justine Tunny](author.md) a brilliant ex Google engineer.  A colourful lovable character just like me.

