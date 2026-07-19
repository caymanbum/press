# Garbage Collection

Generally speaking, for systems software or critical infrastructure, **never make the foundation of the language dependent on garbage collection**.

Garbage-collected languages sound too good to be true. Programmers don’t need to be meticulous about memory management.

But if something sounds too good to be true, then—as that joke from *The Neverending Story* goes—it probably isn’t.

Just think about it: why the obsession with having someone else manage your garbage?

It’s such a difficult algorithm to get right, and thus **100% of implementations are not going to be right**. It’s one of the reasons why C/C++ always wins as an implementation choice. I wish folks would be more honest about it. I lost a lot of productivity trying to use Mercurial, which was written in Python. It was a piece of literal dog shit compared to Git when it came to stability and performance. I want to go back and punch all the idiots that made the choice ambiguous just because they wanted to be polite. I joke - I am not a man of violence in reality and I would probably get my arse kicked if I tried, but metaphorically I feel the emotion.

So many programmers just get bored. They want to invent or learn a sexy new language. I might do that too, but I wouldn’t start from scratch. I would merely remove a lot of functionality from C++ to discourage people from using features I see as having no value. The best way to improve most systems is to [remove functionality](/system/remove).


:
