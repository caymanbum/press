# A fresh implementation of the ZIP format

This is going to be the first step forward for Iguana 6.

I have thought long and hard about it, and Iguana X is just too chaotic, too inconsistent, and—most importantly—doesn’t have a large enough installed base to make it worthwhile to move forward with it. Instead, I am taking all of my design ideas from Iguana X, improving on them, and applying those ideas to Iguana 6—or Iguana Classic, as I call it now.

## Zip Format

Sometimes the most successful standards don’t come from inventing something entirely new. They come from recognizing that an existing technology has become the *de facto* standard, and then carefully defining a clean, well-designed subset of it.

JSON is a classic example. It emerged from the observation that a very small subset of JavaScript could represent structured data extremely well. Its success comes from the fact that it maps directly onto fundamental computer science concepts: simple values, arrays (vectors), and dictionaries (key-value tables). By focusing on a small, elegant subset, JSON became one of the most successful interchange formats ever created.

WebAssembly follows a similar philosophy. Utterly brilliant. It involved finding a subset of JavaScript that could become the foundation of a compact execution format, allowing traditional languages such as C and C++ to compile into secure, high-performance code that runs inside a web browser.

I believe there is another technology with similar untapped potential: the binary container format behind the ZIP specification.

The ZIP file format itself is remarkably well designed. Unfortunately, many existing implementations have accumulated decades of complexity, making them difficult to understand, maintain, and extend. Rather than adding to that complexity, I would like to build a clean, modern implementation from first principles, while remaining compatible with the underlying open specification.

The possibilities are exciting.

One goal is to make it significantly more difficult for attackers to tamper with the configuration of an interface engine.

Another is to package an application such as Iguana \ud83e\udd8e into a single deployable bundle whose executable code, configuration, and supporting resources can all be verified for integrity before execution. Rather than scattering files across a filesystem where they can be modified independently, the entire application becomes a coherent, inspectable package.

This is conceptually similar to how application bundles work on macOS, but built entirely on an open standard that anyone can implement and extend.

I intend to develop this technology as open source.

That means I would genuinely welcome competitors—including NextGen, Qvera, Mirth Connect, Rhapsody, and others—to adopt the same approach. Every integration engine faces essentially the same security challenges, and there is little value in each vendor independently solving identical infrastructure problems.

My goal is not simply to improve Iguana; it is to raise the security standard across the healthcare integration industry.

Using a common, open packaging format would allow interface engines, middleware, and even electronic health record systems to verify both application binaries and configuration data before they are executed. Combined with cryptographic signatures and reproducible builds, it becomes dramatically harder for attackers to silently modify deployed systems.

The resulting bundles would also be practical to work with. Standard command-line tools could inspect the package, list its contents, verify signatures, or extract individual files when appropriate. Developers would gain the convenience of modern application bundles without sacrificing openness or portability.

This work will be implemented as an independent technology that wraps around existing software, rather than requiring products to be rewritten. Iguana will simply be the first production system to use it.

Perhaps the broader industry won’t notice. That’s always a possibility.

But if someone working at another integration vendor or healthcare software company finds these ideas interesting, I would encourage them to take a look. Security is not a competitive advantage when attackers are targeting all of us. If we can build a better foundation together, the entire healthcare ecosystem benefits.

## Four big problems that can be solved

- A new, superior installation format—so Iguana Classic can be like Iguana X, a single binary
- Tighter control of configuration files
- A better format for logging
- A place to store password authentication information

Creativity is so non-linear. These thoughts all came to me at different times. I hate it when people talk about roadmaps. That isn’t how creativity works. That's how you get a terrible product. Just telling you the truth.
