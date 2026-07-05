# Iguana X

My plan is to make Iguana X production-worthy by fixing the parts that matter most.

I plan to remove the license system in Iguana X and I would gladly accept a community patch on that target since it's technically not that hard to do.

The first priority is rewriting the queue system. The design was sound, but the implementation made the product more fragile than it needed to be. I want Iguana X to have a queue architecture that is simple, reliable, understandable, and safe under real production loads. It should also be faster than Iguana Classic.

The second priority is removing unnecessary complexity. Iguana X should not depend on Bitbucket, GitHub, or any cloud service to run. It should be capable of operating fully on-premise, with no forced dependency on AWS, Azure, GCP, Oracle Cloud, GitHub, or any other external platform.

The third priority is security. I want to simplify the codebase aggressively, reduce the attack surface, remove unnecessary features, and make the system as inspectable and auditable as possible. I was very dissapointed by how the team approached security - the permission system there currently just makes the product more difficult to use yet does not give true security.  What is there needs to be removed and the problem rethought through from first principles.  Removing what is there is presumably something someone from the community could do.

Rethinking a truly secure model will take some very deep technical design thought. Design isn't a linear process - as a designer I have to consider many ideas before I find the one which works.

That is what I do.

My intention is to release Iguana X for free under the Mozilla Public License 2.0, the same broad style of open-source licensing used by Mirth. MPL 2.0 allows the source code to be open while preserving trademark rights; the license itself does not grant rights to a project’s trademarks.

I will keep the Iguana trademark. No one else will be allowed to use that trademark which is important for the integrity of the Iguana brand.

The commercial model will not be based on charging ongoing license fees for the engine itself. Instead, the business will be built around tools, validation, security review, migration tooling, and an affiliate program.

The affiliate program will give qualified partners the tools to help customers migrate from Iguana 6 (Classic), Mirth, Qvera, Rhapsody, and Cloverleaf to Iguana X, with no ongoing licensing costs for the engine.

That is a very attractive proposition: a free, open, inspectable integration engine with a serious commercial ecosystem around quality, security, migration, and support.

The long-term goal is for Iguana X to become the safest and simplest interface engine in the world: a codebase with a minimal attack surface, visible source code, clear architecture, and engineering quality that customers and affiliates can inspect for themselves.

People will not have to take my word for it. They will be able to compare the code directly against Mirth and the other competing engines.
