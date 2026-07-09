# Licensing System Architecture

It uses a refreshingly straightforward foundation: it uses Git for version control, and Markdown for readable data storage.

To create 'customer ids' I simply have to create a new directory.

## Plain Text for Clarity and Transparency

Instead of complex, opaque databases, each customer record is simply a Markdown file. That means all licensing information is stored in plain text—easy for a human to read, review, and understand. You don’t need specialized tools to decipher how a record changed or who made the changes; you can open it in any text editor.

## Git: Robust Versioning and Distribution

By storing this Markdown data in Git, every single change to a customer’s license gets automatically tracked. You have a full, auditable history of what changed, when it changed, who changed it, and—if you use good commit messages—why it changed. This isn’t just handy for troubleshooting; it’s invaluable for compliance and transparency.

And because Git is inherently distributed, the entire dataset can be replicated across multiple servers or locations. Every node has its own complete copy, so if one server goes offline or is compromised, the others can seamlessly continue operating and synchronize later. Data isn’t trapped in a single fragile database instance.

## Human-Readable and Resilient

Markdown ensures the records stay accessible and human-friendly. Even complicated licensing details can be viewed (and understood) directly by a person. Git provides mature, battle-tested technology for resilience, synchronization, and history tracking.

## Simplicity is a Strength

It may seem 'boring' to some—a far cry from convoluted bespoke database solutions with hidden states and proprietary formats. But for a system as mission-critical as software licensing, this kind of 'boring’ is a real virtue: it’s reliable, transparent, and easy to audit or recover from failure.

**In short: The system uses easy-to-read Markdown text for data, and Git for handling changes and distribution. It avoids complexity, so you have a licensing portal that’s robust, understandable, and trustworthy. And in the often chaotic world of licensing systems, that’s actually pretty cool.**

