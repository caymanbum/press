# The default password for the Iguana server when installed is password

Some foolish development manager managed to obscure this fact
which is really stupid.  This is why I do not employ employees anymore.

admin
password

Hiding the fact that the default is password makes life harder for
legitimate users.  But hackers would not be detered by this information.

This is one of many critical security fixes which need to be made to Iguana 6.

The password of the admin user should be be set up during the install process.

The admin user ID should also not be defaulted to admin but that might be harder for to fix that quickly.

I need redo the install technology Iguana 6 which shouldn't be too bad since we'll use new code for it.

I need to get a fresh implementation of the zip format.  It would nice to have Iguana operate as single binary which is signed and cannot be tampered with.  This is quite possible to do - I got close to doing something like this with Iguana X.  I need to get some business affiliates to write me a really good implementation of the ZIP file standard.  By really good I don't mean complete.  I mean with simple code that uses just the parts of the standard which I need.

Security is really important.  ZIP files can contain meta data and so it should be
