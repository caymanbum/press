# Getting Your License Codes

We are in the process of upgrading our licensing system. In the meantime, please follow the instructions below to quickly retrieve your license codes.

This is rapidly improving on a day by day basis.  I am using the theory of constraints to practically rebuild the infrastructure of my company, almost from scratch.

I think this will make a very interesting case study one day.

---

## How It Works

1. **Locate Your Iguana ID:**  
   You will need your unique Iguana ID to get your license code.  
   (You can find your Iguana ID in your Iguana instance license page.)

2. **Then go to the license generation page**
   [https://license.interfaceware.com/](https://license.interfaceware.com/)


- For **Chameleon**
     Install Iguana 6.1.5 or 6.2 for windows and use the same license key generator as for Iguana classic above.
     Iguana came with Chameleon embedded in it.  It's unlikely we will optimize this anymore than this.  [Chameleon
     is long overdue for retirement](chameleon.md).  But I am open to discussing this.

---

## To get permanent license keys you will need a company ID.

If you need a company ID please contact us at [license@interfaceware.com](mailto:license@interfaceware.com) this
has not been automated yet.

---

**Tip:**  
We know this system is rough looking, and we appreciate your patience as we work on a better licensing solution!

It's pretty cool.  The system logs the license keys in a git repo.  It's a really nice way that Architect an application without all of the unnecessary complexity that comes with having a traditional database.

In the back end, I'm using markdown.

It looks like a three-year-old system together today.  But over the coming few days I'll make something that's gonna be quite impressive.

You'll wish that all your vendors did this.

## Implementation Details

It’s pretty fun actually applying the Theory of Constraints in real time to the new form of my company. The idea is simple: find the biggest constraint in the system, remove it, and then see what becomes the next constraint. Right now, the next constraint is licensing.

My customers needed a simple way to get permanent license codes without emailing me, waiting for me to find the message, and then depending on me to manually generate something for them. So I built this: a simple form to enter a customer ID that I give you, along with the information needed to generate their license.

The fun part how I built it. The form is implemented using Lua running directly in the browser. Yes, Lua in the browser. It uses a rather neat technology called Fengari, which is a Lua interpreter written in JavaScript. It allows Lua code to run directly inside a web browser — an environment that would normally only understand JavaScript.

That means I can use ordinary HTML for structure, CSS for appearance, and Lua for the application logic. Fengari provides the bridge between Lua and the browser, allowing Lua code to interact with forms, respond to button clicks, access the DOM, and make HTTP requests. What makes it especially interesting is that it isn’t simply translating Lua into JavaScript. It is essentially a Lua virtual machine implemented in JavaScript and running inside the browser.

That means I can use the same small, elegant language throughout more and more of the system rather than constantly switching between different programming environments. The form itself is simple. The interesting part is what it represents.

I’m gradually replacing a company that depended on people, emails, spreadsheets, institutional memory and manual processes with a system where customers can simply solve their own problems. Find the constraint. Remove it. See what breaks next. Then repeat.

It’s a great way to build a company - a little messy in the beginning but order comes to the system quickly.

See the [Lua source](license.lua).
