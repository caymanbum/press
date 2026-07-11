# Work Order: Build the Press Markdown Website

Customers if you are looking for all your operational stuff to [business](business.md).

## Objective

Set up a lightweight website that dynamically publishes the contents of this Git repository:

And do it with a few hours.

## Payment 

I pay some money up front to up to 3 people and I will only pay the other half to the one that I use.

You can all negotiate with me at 1 345 325 1240 - Whatsapp/iMessage.

```text
https://github.com/eliotmuirgrid/press
```

The site could be done in a low-cost Linode Linux server using a common webserver and something like PHP
but I don't really care so long as the code is readable and I can manipulate it with AI.  I am
a very smart developer and so long as you don't write utter fucking hideously complicated code like
some of my now terminated employees I will be fine.

I will redo it in Lua when he has time and and probably regression test against
what ever you build but I need something today and I don't have the time to do it himself.

The repository contains Markdown documents organized into a directory tree. The website should reproduce that structure as a browsable navigation tree and dynamically render each Markdown file as HTML.

There should be no database and no static-site compilation process.  That means it all works
on the fly not like some of goddamn awful technology set up which would take hours to compile
our documentation.

## Source Repository

Fork the following repository so your you work with your own resources and if you do a shit
job then you haven't crapped all over my code.  I want to look over what you have done and whether
I feel like I can support it in production or not.

The repository should be the source of truth for the website.

When Markdown files are added, edited, moved, or removed in Git, the website should reflect those changes after the server pulls the latest version.

## Core Convention

Every directory may contain an `i.md` file.

The `i.md` file is the landing page for that directory.

/                         -> i.md
/business/                -> business/i.md
/business/pricing         -> business/pricing.md
/documentation/           -> documentation/i.md
/documentation/markdown   -> documentation/markdown.md
/iguanax/                 -> iguanax/i.md
/iguanax/architecture     -> iguanax/architecture.md
```

The PHP renderer must use `i.md`, not `index.md`, as the directory landing-page convention.

The webserver may still use `index.php` as the application entry point.

## Existing Repository Compatibility

The current repository already contains Markdown documents at both the root and within numerous directories.

The implementation must work with the existing structure without requiring every directory to contain an `i.md` immediately.

Resolution should therefore work as follows:

1. For `/`, try the root `i.md`.
2. For `/some-page`, try `some-page.md`.
3. For `/some-directory`, try `some-directory/i.md`.
4. When a directory exists without an `i.md`, show its navigation listing rather than returning an error.
5. If nothing matches, return a proper 404 page.

Existing HTML and CSS files in the repository should not automatically become website pages unless explicitly configured.  I do have a few which are 'powering' my existing licensing system.  They can be kept on a separate server since it good to make your servers cattle, not pets.

I would be love to see that discipline in your own work.

It shoud be possible to clone your repo and run a script to install everything.  In fact I won't accept anything less that this because it shouldn't require hours of work for me to clean up your shit.

## Server Infrastructure

Give me the recipe to provision one inexpensive Linode server with:

* Ubuntu Linux
* Apache
* PHP
* Git
* HTTPS through Let’s Encrypt
* Apache virtual-host support
* Sufficient structure to host additional Markdown sites later - should be easy to set up a bunch.

Install the required packages:

```bash
sudo apt update

sudo apt install -y \
    apache2 \
    php \
    libapache2-mod-php \
    git \
    certbot \
    python3-certbot-apache
```

Enable Apache rewriting if you did it this way:

```bash
sudo a2enmod rewrite
sudo a2enmod headers
sudo systemctl restart apache2
```

## Recommended Server Structure By Chat GPT (beware - Sam Altman is a slimey idiot - be careful)

```text
/var/www/press/
├── public/
│   ├── index.php
│   └── assets/
├── application/
│   ├── config.php
│   ├── markdown.php
│   ├── navigation.php
│   └── template.php
└── content/
    └── press Git repository
```

The Git repository must be cloned into:

```text
/var/www/press/content
```

Only this directory should be exposed publicly:

```text
/var/www/press/public
```

The repository itself must remain outside the Apache document root.

## PHP Application

Create one PHP front controller:

```text
/var/www/press/public/index.php
```

All non-static requests should be routed through this file.

The PHP application must:

1. Read the requested URL.
2. safely translate it into a path inside the repository;
3. reject directory traversal and invalid paths;
4. resolve the corresponding `.md` or `i.md` file;
5. convert the Markdown into HTML;
6. recursively build a navigation tree;
7. highlight the current document;
8. place the navigation and content into a common HTML layout;
9. return a proper 404 response when needed; and
10. cache generated navigation data if repeated directory scanning becomes inefficient.

## Navigation Tree

The navigation must represent the repository’s directory structure.

Rules:

* Include directories containing Markdown documents.
* Include files ending in `.md`.
* Ignore `.git`.
* Ignore hidden files and directories.
* Ignore `README.md` unless it is deliberately enabled.
* Do not display `i.md` as a separate item.
* Use `i.md` as the clickable page for its directory.
* Use the first `# Heading` in a file as its display title when available.
* Otherwise derive the title from the filename.
* Replace hyphens and underscores with spaces in generated titles.
* Sort navigation entries consistently.
* Highlight the current file or directory.
* Support nested directories.
* Make directory branches expandable and collapsible.

For a directory without an `i.md`, the directory name should still appear and expand to show its child pages.

## Markdown Rendering

Use a maintained PHP Markdown package, preferably League CommonMark.

It should support:

* Headings
* Lists
* Links
* Images
* Tables
* Blockquotes
* Inline code
* Fenced code blocks
* Horizontal rules

Raw HTML inside Markdown should be disabled or sanitized by default.

External links may open in a new tab, but internal `.md` links should be rewritten into clean website URLs.

For example:

```markdown
[Read the plan](../plan.md)
```

should become a website link rather than exposing the Markdown extension.

## Clean URLs

Examples:

```text
/business.md              -> /business
/business/i.md            -> /business
/business/pricing.md      -> /business/pricing
/iguanax/design/i.md      -> /iguanax/design
```

The visitor should never need to include `.md` in the URL.

## Apache Virtual Host

Create an Apache configuration similar to:

```apache
<VirtualHost *:80>
    ServerName press.example.com

    DocumentRoot /var/www/press/public

    <Directory /var/www/press/public>
        AllowOverride All
        Require all granted
        Options -Indexes
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/press-error.log
    CustomLog ${APACHE_LOG_DIR}/press-access.log combined
</VirtualHost>
```

Route application requests to `index.php`:

```apache
RewriteEngine On

RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d

RewriteRule ^ index.php [L,QSA]
```

The final domain can be substituted once it has been chosen and pointed to the Linode IP address.

## HTTPS

Once DNS is configured I will be doing something like this, you won't be because I will never
let another person control MY DNS and put their THEIR phone number for TFA :

```bash
sudo certbot --apache -d press.example.com
```

Confirm that automatic certificate renewal works.

## Repository Updates

Provide a deployment script:

```bash
#!/usr/bin/env bash

set -euo pipefail

REPOSITORY="/var/www/press/content"

cd "$REPOSITORY"

git fetch origin master
git checkout master
git pull --ff-only origin master
```

The site should initially support manual deployment:

```bash
sudo -u www-data /usr/local/bin/update-press
```

I will just being using the command line when I do updates.

## Security Requirements

The implementation must:

* Prevent `../` directory traversal.
* Use `realpath()` or equivalent path validation.
* Confirm that every resolved document remains inside the configured repository root.
* Keep `.git` inaccessible from the web.
* Prevent execution of PHP, shell scripts, or other repository files.
* Render only approved Markdown files.
* Disable directory listings.
* Sanitize unsafe Markdown HTML.
* Escape generated titles and navigation labels.
* Avoid exposing exception details publicly.
* Log application errors privately.
* Use minimal filesystem permissions.
* Avoid running the web server or deployment process as root.

## Presentation

Create a simple, readable documentation-style layout:

* Site title at the top.
* Directory navigation tree on the left.
* Rendered article on the right.
* Collapsible navigation on mobile.
* Clear typography.
* Readable code blocks.
* Styled tables.
* Highlighted current navigation item.
* Optional link to view or edit the source document on GitHub.
* Optional previous-page and next-page navigation.

The first implementation should remain lightweight and should not depend on React, Node.js, a database, or a large frontend framework.

## Deliverables

The person carrying out this work must deliver:

1. A functioning Linode server.
2. Apache, PHP, Git, and HTTPS configuration.
3. A cloned copy of `eliotmuirgrid/press`.
4. A PHP Markdown renderer.
5. A recursively generated navigation tree.
6. Support for `i.md` directory landing pages.
7. Compatibility with directories that do not yet have `i.md`.
8. Clean URLs without `.md`.
9. Correct handling of internal Markdown links.
10. A responsive page template.
11. A deployment script.
12. A styled 404 page.
13. Installation and maintenance documentation.
14. Instructions for adding another Git-based website to the same server.

## Acceptance Test

The work is complete when all of the following are true:

* The server displays the contents of the `press` repository.
* Root Markdown files can be opened through clean URLs.
* Nested directories appear as a navigation tree.
* Markdown files within nested directories render correctly.
* A directory containing `i.md` uses it as the directory landing page.
* A directory without `i.md` displays its available child pages.
* `i.md` does not appear as a navigation item.
* Internal Markdown links work correctly.
* Invalid paths return a 404 response.
* Directory-traversal attempts fail.
* `.git` cannot be accessed publicly.
* Pulling the latest `master` branch updates the website.
* HTTPS works.
* The same PHP application can later host other repositories without being rewritten.

## Final Outcome

The result should be a small, reusable publishing platform in which the directory tree of the Git repository becomes the website.

Eliot should be able to write Markdown, commit it to the `press` repository, push it to GitHub, update the server, and have the content immediately available as a structured website.

