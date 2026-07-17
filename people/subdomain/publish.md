# Website Setup

To simplify deployment for my affiliates, the [publishing system I built](/why/hubspot.md) must allow them to easily set up their own websites. For example, each affiliate could have their own subdomain such as:

- `gannon.interfaceware.com`
- `muir.interfaceware.com`

## Objectives

- **Easy Deployment:** Affiliates must have simple options for creating and hosting their websites.
- **Scripted Setup:** Provide a script affiliates can run to automatically provision a server, configure their website, and deploy the standard platform.
- **Standardized Approach:** Servers should be treated as **cattle, not pets**—that is, easily replaceable and not unique or irreplaceable.

---

**Summary Workflow:**
1. **Affiliate runs setup script**
2. **Server is provisioned with a standardized stack**
3. **Personalized subdomain is configured (e.g., `affiliate.interfaceware.com`)**
4. **Website is live and ready for use**

---

> #### Principle
> **Servers should be cattle, not pets.**  
> In other words: automate everything and avoid one-off, hand-maintained servers.

---
