# Lua instead of Javascript in the browser

My new licensing system is part of my overall technical direction. 

The form is implemented using Lua running directly in the browser. Yes, Lua in the browser. It uses a rather neat technology called Fengari, which is a Lua interpreter written in JavaScript. It allows Lua code to run directly inside a web browser — an environment that would normally only understand JavaScript.

That means I can use ordinary HTML for structure, CSS for appearance, and Lua for the application logic. Fengari provides the bridge between Lua and the browser, allowing Lua code to interact with forms, respond to button clicks, access the DOM, and make HTTP requests. What makes it especially interesting is that it isn’t simply translating Lua into JavaScript. It is essentially a Lua virtual machine implemented in JavaScript and running inside the browser.

That means I can use the same small, elegant language throughout more and more of the system rather than constantly switching between different programming environments. The form itself is simple. The interesting part is what it represents.

Lua is the future.  A language for giving power to domain experts.  I care about people who want to solve real problems, not people who only to write code. I like generalists.  Not specialists.

See [Licensing System](../license.md)
