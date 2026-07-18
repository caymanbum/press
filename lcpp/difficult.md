# Why is C++ Complicated

One reason why even AI has difficulty writing truly good C++ code is rooted in its history: **the people who contributed the most to C++ were, overwhelmingly, from large companies**. Over the years, armies of programmers at big corporations often found themselves without enough urgent, meaningful production work. To keep busy (and perhaps justify headcount), many developers at these organizations invented elaborate solutions to problems that didn’t truly exist. With no pressing system constraints, they essentially had free rein to experiment, leading to layer upon layer of complexity in both language and library design.

This is a general problem with all standards organizations.  That is why FHIR has become such an abomination.

The result has been a kind of **Idea Pollution**—the proliferation of awkward patterns, esoteric features, and needlessly “clever” solutions. Since these ideas were often released and disseminated by authoritative voices from industry giants (sometimes through standardization committees), they became gospel in the C++ world. Over time, so many questionable conventions and techniques have accumulated that it’s genuinely difficult—even for AI—to distinguish patterns that promote clear, maintainable code from those that are a liability in real-world systems.

This environment of complexity is the butt of a long-running joke at the expense of Bjarne Stroustrup, the creator of C++, as the architect of “the most elaborately convoluted language design” ever inflicted on programmers.

**Yet, for all its excesses, C++ does provide genuinely useful features that C sorely lacks.** For example, something as elementary as a robust string object—an ordinary facility in almost every other modern language—was missing from C, but made (finally) accessible in C++. The ability to simply work with text *safely and conveniently* is a game-changer for many programmers, even if they never use a single other new feature.

**That one enhancement alone makes C++ worth considering—even if you ignore everything else added to the language.**
