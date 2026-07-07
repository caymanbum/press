# Attack Area

The easiest analogy of this is to imagine a house with two doors versus one with a 1000.  The more doors exist for your house the harder it is to keep it secure, whether it be from children or family members having mental health issues getting out or malicious actors getting in.

This is the easiest way for a non technical person to understand the same concept in software.  My house in Cayman feels unsafe sometimes because there are too many doors and the locks suck in terms of only locking on the inside.

**The attack area** (or "attack surface") of software is the sum of all points—interfaces, endpoints, or dependencies—where an external user could potentially interact with or compromise a system's code. Every line of code increases this surface, meaning that larger, more complex codebases (often common in languages like Java and JavaScript) inherently offer more opportunities for attackers to find and exploit vulnerabilities.

**Minimizing code and dependencies is key to reducing the attack area.** Fewer lines make code easier to audit, maintain, and secure, while excessive use of third-party frameworks or libraries multiplies possible vulnerabilities. For example, a simple Java microservice often requires hundreds of lines of code, considerable configuration (XML, servlets, etc.), and pulls in large frameworks like Spring—each a potential target. Similarly, JavaScript projects (especially those using Node.js) frequently install hundreds or even thousands of packages via npm, significantly broadening the attack area.

**In contrast, minimalist languages like Lua excel at security through simplicity.** Lua’s small standard library, minimal external dependencies, and easy auditability enable developers to build secure applications with only essential code and very little overhead. Unlike JavaScript, which typically relies on many npm modules, or Java, with numerous Maven dependencies, a default Lua script usually just requires the Lua runtime. This dramatic reduction in code and complexity translates to a much smaller attack area—fewer entry points for attackers.

**In summary:**  
Reducing the attack area is fundamental to good security. Java and JavaScript, popular as they are, can result in expansive attack surfaces due to their reliance on large runtimes and numerous dependencies. Languages like Lua, with their focus on minimalism and auditability, allow for smaller and safer attack areas—making it easier to prevent, detect, and address vulnerabilities. The fundamental principle holds: *less code and fewer dependencies means fewer places for attackers to strike.*

Guess what - [Mirth Connect](attack/mirth/javascript.md) - the most popular open source HL7 engine is written in Java and uses Javascript. It's a dream for ransomware attackers come true.
