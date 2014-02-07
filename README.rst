=====================
The New Selenium Docs
=====================

We're rewriting the Selenium documentation from scratch!  Help us out
by sending us a patch!

Once this documentation reaches a state of relative stability and
completeness, it will replace the existing Selenium documentation.

Building
========

The documentation is built using `Sphinx <http://sphinx-doc.org>`_ and
formatted using `reStructuredText
<http://docutils.sourceforge.net/docs/user/rst/quickref.html>`_.

First make sure you have the necessary dependencies:

::

    pip install sphinx

To clone the repository:

::

    git clone https://github.com/SeleniumHQ/selenium-docs.git

And finally to build it:

::

    cd selenium-docs
    make

This will ensure all that all the right files are built in the correct
order with all the necessary dependencies.  After building you will
find the formatted documentation in the *_build* directory.  Point
your browser to the *_build/index.html* to get the documentation
index.

If you want to use *virtualenv* when working on the docs, you can do
that too:

::

    virtualenv selenium-docs
    cd selenium-docs
    source bin/activate
    pip install -e git+https://github.com/SeleniumHQ/selenium-docs.git

Formatting
==========

Each line should not exceed 72 characters per line unless they need
special treatment because you need to preformat the text or they're
code.

Patches
=======

We accept patches and pull requests from GitHub.  When opening a pull
request, please indicate that you have filled in the `Contributor
License Agreement
<https://spreadsheets.google.com/spreadsheet/viewform?hl=en_US&formkey=dFFjXzBzM1VwekFlOWFWMjFFRjJMRFE6MQ#gid=0>`_,
which is necessary to contribute to the Selenium project.
