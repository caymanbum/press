# Build System Modernization

Eliot will need to transition the Iguana 6 codebase to a new build system—specifically, the same system he previously designed for Iguana X. This change is a critical step in a broader initiative to modernize and streamline the Iguana development workflow. The current build system for Iguana 6 is outdated, cumbersome, and unable to efficiently handle the growing complexity of the project. Eliot can reduce friction in the development process and improve CI/CD integration, cross-platform compatibility, and maintainability.

Transitioning to a new build system will demand a careful migration strategy. Eliot will need to map out all the existing build scripts, dependencies, and custom configurations in the Iguana 6 ecosystem, then translate or refactor them to fit the conventions of the new system. This will involve extensive testing to ensure the new build system is functionally equivalent to the old one.

Ultimately, this transition is about future-proofing the Iguana codebase. Consolidating on a single build approach not only reduces technical debt. While challenging, this effort will pay dividends by making the codebase more agile and maintainable in the long run.

The [testing system also needs a rewrite](testing.md).
