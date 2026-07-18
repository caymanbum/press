# New Iguana Could Be Just 5% of Iguana X’s Code

Yes, you read that right—it’s that wild! By actually using our brains and applying some key simple ideas, we’ve managed to create a structure that works in a bunch of places—without overengineering each and every part into oblivion.

Take Lua, for example. I went with the smallest version I could find, 5.0, weighing in at a svelte 30,000 lines of code. Sure, Lua 5.1 comes with a few shiny features, but it also balloons up to 100,000 lines. Do we really need three times the code for nearly the same result? I don’t think so. If we absolutely need a couple of those Lua 5.1 bells and whistles, we’ll just backport them. No need to drag the whole kitchen sink along for the ride.

One feature in Lua 5.1 that I don’t consider much of a winner—at least for an interface engine—is incremental garbage collection. It sounds sophisticated, but it’s really just a recipe for surprise garbage clean-ups at the worst possible moments. In the world of interface engines, “unexpected” is not a feature; it’s a bug waiting to bite.

Boring is beautiful for interface engines: we want predictability, stability, and the kind of excitement you get from watching paint dry. When it comes to state, less is more. Ideally, Lua scripts running in the engine should have **zero** state, unless someone has actually put some thought into the design—instead of letting it sneak in thanks to sloppy programming.

That’s why I prefer a design that often resets Lua states—making scripts run without state by default. It’s a fantastic way to discourage fancy tricks. And, for interface code, “fancy” is the very last thing you want; nobody wants an engine that thinks it’s David Copperfield.

And let’s not forget: we once worked with a so-called consulting partner—HICG Group—who delivered lots of “fancy” code that wasn’t even remotely reliable. We lost a bunch of clients because we took advice from those geniuses. Thanks, Frank—you were *not* awesome. You were coin-operated, and, since most businesses run on tight margins, you naturally preferred Rhapsody. Their over-complicated engine meant more consulting hours and a fatter paycheck for you, at the expense of our sanity.

