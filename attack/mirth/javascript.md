# What JavaScript engine does Mirth Connect use?

**Mirth Connect** relies on Java's scripting capabilities for its JavaScript support. Specifically, in various versions:

- **Mirth Connect 3.x and below:** Uses the [Rhino JavaScript engine](https://mozilla.github.io/rhino/), which is a JavaScript engine implemented entirely in Java and maintained by Mozilla.
- **Mirth Connect 4.x onward:** Transitioned to [Nashorn](https://docs.oracle.com/javase/8/docs/technotes/guides/scripting/nashorn/) with Java 8 and above, as part of Java’s standard library.

**Key points:**
- **Rhino** is used for compatibility on Java 6/7.
- **Nashorn** is used on Java 8+ (but note: Nashorn is deprecated and removed in later versions of Java).
- With Java 15 and later, **Nashorn is removed**, meaning future versions of Mirth may return to Rhino or another JavaScript engine unless explicitly upgraded.

## Security Concerns

**Embedding general-purpose JavaScript engines** in a healthcare integration platform raises significant security concerns, especially since:
- Users can write arbitrary scripts that are executed in a privileged context.
- Historical vulnerabilities in both Nashorn and Rhino can allow sandbox escapes, arbitrary Java class loading, or even system command execution if not strictly sandboxed.
- Mirth by default does not implement strict sandboxing of JavaScript.

## Alternatives

If security is paramount, my approach of building a tightly-constrained, minimal system and using limited-purpose, tightly-sandboxed scripting is more secure using Lua.

### References

- [Mirth Connect — Script Types](https://github.com/nextgenhealthcare/connect/wiki/Script-Types)
- [Mozilla Rhino JavaScript Engine](https://mozilla.github.io/rhino/)
- [Java Nashorn Scripting Engine](https://www.baeldung.com/java-nashorn)
- [Nashorn Deprecation Notice](https://openjdk.java.net/jeps/335)

---

**Summary:**  
Mirth Connect uses the **Rhino** or **Nashorn** JavaScript engine, depending on the Java version. Both introduce security concerns due to the power and reach of the underlying JVM, especially when exposed to user-provided code. Security is fundamentally difficult when offering general scripting on a platform like Mirth.

[Lua is a much better choice when it comes to security.  This is why I picked Lua for Iguana](../lua/secure.md).
