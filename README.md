tg's Gentoo Overlay
===================

About
-----
This is my personal gentoo overlay, containing new ebuilds written by me and modified ebuilds from other sources with bugfixes or similar.

How to use it
-------------
Using this overlay is easy.

Make sure you have layman installed, using the *git* USE-flag, and set up, e.g. as [described here](http://www.gentoo.org/proj/en/overlays/userguide.xml).

After that you just have to add this overlay using:

```layman -o "http://raw.github.com/tg--/gentoo-tg/master/overlay.xml" -f -a tg```

That's it!
