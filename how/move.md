# Moving Markdown Files Without Breaking Links

I need a simple command-line tool that allows me to move a Markdown file from one location to another.

The problem is that moving Markdown files changes the relative paths between documents, which breaks links. Whenever a file is moved, the tool needs to scan every Markdown file in the directory tree and update any links that point to the old location.

It is probably best to start with a deliberately simple implementation rather than trying to handle every possible Markdown edge case from the beginning.

The functionality can be separated into a few small routines:

1. List every Markdown file in the directory structure.
2. Read a Markdown file and extract its links.
3. Resolve each relative link to its actual target.
4. Determine whether the link points to the file being moved.
5. Calculate the new relative path from the linking document to the file’s new location.
6. Rewrite the link.
7. Move the file.

Separating these concerns into small functions makes sense because the logic can then be translated into whichever language or environment is most appropriate.

Lua would be my language of choice for this kind of tool. The difficulty is that standard Lua does not come with many filesystem primitives.

One option would be to write the initial implementation inside Iguana 🦎, since it already provides the basic primitives needed to traverse directories and read and write files.

Once the logic is working, it should be straightforward to port it into a standalone command-line tool. I already have a Cosmopolitan `flowlua` binary, which would make it possible to package the Lua implementation as a portable executable.

That is one of the open repos on my personal github site.

One could get creative about implementing the same API for iterating files using ls and popen.  

Damn it - I wish my life wasn't in such chaos and that my fingers were all working well. I would do it myself.

The first version only needs to support ordinary relative Markdown links.  More complicated stuff like make it really fast can be done later if and when needed.

