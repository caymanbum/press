# Package  

Enterprise software has accumulated unnecessary complexity, with each application reinventing its own installer, configuration format, logging system, credential store, backup mechanism, and deployment process. We believe there is a simpler approach.

## Introduction to the Unified Archive Architecture

Instead of treating an archive as something that is unpacked during installation it would be like Iguana X did - just one file
that is not unpacked.  It just loads the dependencies from with the file itself.

### The Unified Archive Model

In this model:

*   An application is distributed as one signed archive containing its executables, configuration, documentation, and resources.
*   The runtime accesses everything directly from the archive, without extracting or copying data to the filesystem.
*   The archive serves as:
    *   Distribution package
    *   Deployed application
    *   Backup
    *   Migration artifact
    *   Rollback image

### Benefits of the Unified Archive Model

The unified archive model offers several benefits:

*   **Simplified deployment**: No need to install or configure separate packages.
*   **Reduced complexity**: A single, well-defined archive format replaces multiple disparate systems.
*   **Improved security**: The archive serves as a self-contained security boundary, with encrypted data and cryptographically signed executables.

### Zero-Trust by Design

The unified archive model also enables zero-trust architecture:

*   Every archive is cryptographically signed before execution.
*   Sensitive data is encrypted using modern authenticated encryption, with keys protected by public-key cryptography and hardware-backed private keys.
*   The archive can be stored anywhere without trusting the storage provider.

### One Library, Many Applications

The unified archive format can support a wide range of applications:

*   Secure credential storage
*   Durable append-only message queues
*   Tamper-evident transaction logs
*   Backups and disaster recovery
*   Secure replication
*   Application deployment

By building upon well-tested primitives, these systems share a common foundation without requiring separate implementations.

### Open by Design

Our goal is not to build another installer but to eliminate installation altogether. The underlying technology is intentionally general, with problems shared across the software industry:

*   We believe that this approach can benefit the entire industry, rather than being specific to our own products.
*   Our objective is to provide a unified solution that streamlines enterprise software development and deployment.

By adopting the unified archive architecture, you can simplify your application lifecycle, improve security, and reduce complexity. Join us in embracing a more streamlined and efficient approach to enterprise software development.
