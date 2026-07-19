# Why SQL Should Be End-of-Lifed

Relational databases were really cool, and they keep a lot of developers employed. However, they make data portability quite difficult, and most developers struggle to resist the temptation to write code that allows for SQL injection attacks.

Many IT professionals have built their careers knowing all the obscure details of this technology, but honestly, using directories of data often results in more robust and resilient applications—where you don’t have to get the data model right the first time.

I think, in the end, when most large IT systems like electronic medical records or customer relationship management systems become completely indefensible from a cybersecurity standpoint, these systems will inevitably be put out of commission.

I’m quite relieved that I finally managed to retire our licensing system, which was based on MySQL—a technology that has become much less exciting than it was when Larry Ellison of Oracle bought Sun Microsystems simply to acquire the rights to MySQL.

With distributed systems, SQL simply doesn’t work and it needs to go.

Most of the time, you can just store data in nested directories without needing all the advanced “elastic this” or “dynamo that”—or whatever other junk younger developers are hyping at conferences.
