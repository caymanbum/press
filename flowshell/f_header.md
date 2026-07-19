# Minimize Including Header Files

It was pretty funny when I was writing the documentation for one of the most important techniques for making C++ compile quickly.

I use speech-to-text a lot these days because it's much faster than typing. My fingers aren't quite what they used to be, especially after a rather stressful few years.

Unfortunately, every single time I said **"header files"**, the computer decided I meant **"pedophiles."**

After correcting it for the hundredth time, I realized there was actually a useful analogy.

You don't want to expose yourself to too many pedophiles.

Unfortunately there are a lot of them around, and you can't avoid every encounter in life, but you certainly don't want to become part of an enormous network of them.

Header files are much the same.

One header file includes five other header files. Those five each include another five. Before long, a single `#include` has dragged in dozens—or even hundreds—of files that the compiler now has to parse.

The consequences are thankfully limited to compilation time and unnecessary complexity rather than criminal investigations, but the principle is surprisingly similar: unnecessary exposure grows very quickly.

When you're writing simple, secure, high-performance system software, this matters.

One of the biggest mistakes people make is lazily including a header file every time they declare a function that mentions a type.

In many cases, that's completely unnecessary.

C++ lets you **forward declare** many types. If your function only takes a pointer or reference to a type, the compiler doesn't need to know the size or layout of that type. It only needs to know that the type exists.

That means you can write something like:

```cpp
class BASstring;

void APPprocess(const BASstring& Value);
```

without including `BASstring.h` at all.

The full definition only needs to be included in the `.cpp` file where the compiler actually needs to understand the object.

This small habit has a huge cumulative effect.

Instead of one header pulling in five others, which each pull in five more, you've stopped the dependency graph from exploding. The compiler reads dramatically less code, incremental builds become much faster, and the project remains easier to understand.

I don't like long compilation cycles.

One thing I was always proud of was that Iguana X, despite being a fairly substantial codebase, still compiled in around 20 seconds.

Compare that with something like Chromium, where a full build on a powerful machine can easily take hours.

Fast compilation isn't just a convenience.

Every extra minute you spend waiting is a minute you're not thinking about the problem you're trying to solve. Short compile times keep you in the flow, encourage experimentation, and ultimately make you a more productive developer.

So yes, the article is about header files.

Not pedophiles.

Although, thanks to speech recognition, I apparently spent an entire morning trying to optimize a network of those instead.

