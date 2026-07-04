# Tools

Effective tooling is essential for the robust development and maintenance of Iguana integrations. Below are three critical types of tools that significantly enhance both development efficiency and code reliability.

## Input/Output Tracing Command Line Tool

One of the most crucial needs for Iguana is a command line tool that can run transformations using sample data and record all resulting outputs. These outputs could range from database changes, API calls, to HL7 message generation. By executing transformations in a controlled environment and logging the results, developers can iteratively refactor and simplify code with confidence—always being able to verify that the integration still produces the correct outcomes.

This tool is particularly valuable during development cycles, enabling automated loops that catch unintended side effects or regressions as code evolves.

## Profiling Tool

Building on the Input/Output tracing concept, a profiling tool allows for complete, end-to-end transformation runs while providing detailed insight into function execution. Developers can selectively trace specific functions within the integration flow, helping them identify bottlenecks and areas that may require optimization. This profiling capability is key to ensuring integrations are not only correct, but also efficient—crucial for high-throughput or latency-sensitive applications.

## Migration Support

These tools are not only vital for developing new integrations under the [affiliate](i.md) model but are also indispensable for clients migrating existing code to newer, more secure versions of Iguana. Comprehensive tracing and profiling ensure code migrations are smooth, robust, and minimize unexpected behavior, ultimately paving the way for a seamless transition to the latest platform features and security enhancements.


