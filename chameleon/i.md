# Chameleon now with Iguana Fries 

Paul Gannon asked me today, "What's the value proposition of Chameleon users switching to Iguana.

I'm not going to mention the customer names because I don't want to publicly shame you. But honestly, if you've been running Chameleon all these years without addressing the elephant in the room, you probably ought to feel a little embarrassed.

For years I've been trying to sell you advanced dashboards and all sorts of shiny new features. Meanwhile, there was a much more fundamental problem that many of you simply ignored:

**You weren't encrypting your TCP/IP traffic.**

Yes. No encryption.

That's not exactly what I'd call good engineering practice.  That puts the funny in [SOC2 compliance](/affiliates/business/soc2.md) and violates HIPAA even though we know that's just a lot of virtue signaling.

So here's your friendly notice: get your act together and start encrypting those legacy Chameleon deployments.

The solution is actually pretty straightforward. Set up a local socket connection from your legacy Chameleon source into Iguana, and let Iguana handle the TLS/SSL encryption. Suddenly your legacy application can communicate securely without having to rewrite the whole thing.

Congratulations—you've just taken a big step toward modern security and compliance.

The people I ultimately care about aren't the organizations running insecure systems—they're the ordinary citizens whose personal information is travelling across those systems. They deserve better than unencrypted channels carrying sensitive data.

So, thanks for listening. Now go set up some encrypted LLP channels.

Looks like I've got some documentation to write.

Migration is very simple.  It's all about [regression testing](../system/regression.md).
