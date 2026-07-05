# Lua is the Secure Choice for Healthcare

## 1. **Small Ecosystem = Reduced Attack Surface**
- **Fewer libraries & packages** mean there are fewer third-party modules that could be compromised or contain vulnerabilities.
- In a large ecosystem (like npm for JavaScript or PyPI for Python), attackers often inject malicious code into obscure or popular packages. Lua’s minimal set of default modules and much smaller user-contributed ecosystem diminishes this risk.
- It’s easier to **audit** the entire set of components you depend on when there simply aren’t as many.

---

## 2. **Tiny Code Base = Easier Auditing and Understanding**
- Lua’s codebase is **compact, well-documented, and designed for simplicity**. The reference implementation is under 30,000 lines of ANSI C and has a long track record of stability.
- A **smaller codebase** is easier for both users and security experts to audit, review, and understand, leaving less room for subtle, unnoticed bugs.
- Fewer dependencies means each Lua deployment is less likely to drag in untrusted, unmanaged code.

---

## 3. **Embeddability = Fine-grained Sandbox Control**
- Lua is **primarily designed to be embedded** into host applications, giving the parent program full control over what Lua code can and cannot access.
- By default, you can run Lua in a sandbox by **removing or restricting access to dangerous functions** (such as those that access the filesystem or execute OS commands).
- Unlike some scripting languages, Lua does not encourage or require global access to the internet, the filesystem, or the OS for basic functionality, making it easy to limit and audit what scripts can do.
- Many games and apps use Lua specifically for this reason—they can run untrusted user scripts with high confidence they won’t compromise the host.

---

## **Other Security Features:**
- **No native threads, signals, or complex system interfaces** (which are attack vectors in some languages).
- **Consistent, clean design:** Reduces surprising behaviors or ambiguous “gotcha” cases that can be exploited.
- **Long history in embedded and restricted environments:** Lua’s success in gaming, networking appliances, and enterprise contexts hinges on its reliability and security in controlled settings.

---

## **In Summary:**
**Lua’s small ecosystem, tiny code base, and inherent embeddability mean:**
- There are fewer places for vulnerabilities to hide.
- You (or your team) can actually review the parts you’ll run.
- You have very fine control over what scripts can and cannot do.
- It’s uniquely suited for trust-minimized environments like embedded systems and sandboxed plugin architectures.

**That’s why Lua is considered one of the most secure choices for embedding scripting into applications.**

This is one of the many reasons I chose to use Lua rather than more commercially popular choices like [Javascript](../mirth/mirth.md) as used in Mirth, Qvera and Rhapsody.

