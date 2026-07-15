# Protect configurations 

We can use our new capabilities with the zip format to have our legacy apps operate within
a sandbox. They have a safe place to write their configurations which cannot be tampered with by
hacker even if they have access to the host operating system.

This also makes migration easier - vendors can get access to the configuration of each instance.

This is really important for vendors that need to modernize their systems - they need to regression
test and [this makes it possible]. 
