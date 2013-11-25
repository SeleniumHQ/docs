.. _index:

=======================================
The Selenium Browser Automation Project
=======================================

Selenium is an umbrella project for various tools and libraries that
enable automation of web browsers.  Amongst other things it provides
the support infrastructure for the `W3C WebDriver specification`_,
that lets you write interchangable code for all major web browsers.

The project is made possible by volunteer contributors who have put in
thousands of hours of their own time, and made the source code freely
available under the :ref:`Apache 2.0 license <license>`.

Here is one of the simplest Selenium programs you can make:

.. code-block:: python

   from selenium import webdriver

   driver = webdriver.Firefox()
   driver.get("http://google.com/?hl=en")
   search_box = driver.find_element_by_id("q")
   search_box.send_keys("cheese")
   search_box.submit()

After you've installed Selenium and run this program you will see the
browser navigate to the search engine and “cheese” before submitting
the form.

See :doc:`quick_tour` for a full explanation of what goes on behind
the scenes when you run this code.  You should continue on to the
:ref:`narrative_documentation` to understand how you can use Selenium
as a test automation tool and to scale simple tests like this run in
large, distributed environments on multiple browsers, under several
different operating systems.

Getting Started
===============

If you are new to Selenium, we have a few resources that can help you
get up to speed right away.

.. toctree::
   :hidden:

   quick_tour

.. _narrative_documentation:

Narrative Documentation
=======================

Narrative documentation in chapter form explaining how to use
Selenium.

.. toctree::
   :maxdepth: 2

   introduction
   install
   start
   webdriver
   remote
   best
   worst
   grid
   ide
   drivers
   java_support

Front Matter
============

.. toctree::
   :maxdepth: 1

   legal
   conventions

.. _W3C WebDriver specification: https://dvcs.w3.org/hg/webdriver/raw-file/tip/webdriver-spec.html
.. _Apache 2.0 license: license
