# Why Lua 5.0?

Lua is fantastically small and I have used it to great effect in Iguana making it the
worlds fastest, easiest to use and most stable middleware engine.

I used Lua 5.1 then.  But now I am choosing differently.

I went with the smallest version I could find, 5.0, weighing in at a svelte 30,000 lines of code. Sure, Lua 5.1 comes with a few shiny features, but it also balloons up to 100,000 lines. Do we really need three times the code for nearly the same result? I don’t think so. If we absolutely need a couple of those Lua 5.1 bells and whistles, we’ll just backport them. No need to drag the whole kitchen sink along for the ride.

One feature in Lua 5.1 that I don’t consider much of a winner—at least for an interface engine—is incremental garbage collection. It sounds sophisticated, but it’s really just a recipe for surprise garbage clean-ups at the worst possible moments. In the world of interface engines, “unexpected” is not a feature; it’s a bug waiting to bite.

Boring is beautiful for interface engines: we want predictability, stability, and the kind of excitement you get from watching paint dry. When it comes to state, less is more. Ideally, Lua scripts running in the engine should have **zero** state, unless someone has actually put some thought into the design—instead of letting it sneak in thanks to sloppy programming.

That’s why I prefer a design that often resets Lua states—making scripts run without state by default. It’s a fantastic way to discourage fancy tricks. And, for interface code, “fancy” is the very last thing you want; nobody wants an engine that thinks it’s David Copperfield.

