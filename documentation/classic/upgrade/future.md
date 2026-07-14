# The Future of Integration

Most enterprise systems are really closed systems.  They pretend to be open but the reality is when people convert from one EHR to another it's a manual process of copying the data from one to the other.  Yes that is completely crazy.

Epic is a walled garden — except the garden is more like a jungle, with wildly inconsistent experiences depending on how each client has configured it.

My focus for the next generation of Iguana 🦎 is increasingly less about “HL7 vs APIs” and more about interacting with Epic directly.

The real requirement is simple: access the information users are entering and seeing. If we can use screen capture technology, analyze it with a local AI engine, and safely simulate user interaction, then we can potentially work with the actual workflow instead of trying to guess what’s happening through partial HL7 feeds, fragile interfaces, or selectively exposed APIs.

Dealing with HL7, FHIR, and Epic integrations can feel like playing pin the tail on the donkey while blindfolded. The standards sound open, but in practice the important information is often hidden behind local configuration, licensing, workflow choices, and institutional politics.

That is why I think screen-based workflow automation may have better longevity. It is not a trivial engineering problem, but it gets closer to the real source of truth: what the user sees, enters, and needs to act on.

Time is valuable though and this version of iNTERFACEWARE is [more selective in who we do business with](consulting.md).
