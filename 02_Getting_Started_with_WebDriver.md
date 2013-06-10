Getting Started with WebDriver
==============================

Supported Browsers
------------------

Selenium supports automation of all the major browsers in the market
through the use of _WebDriver_.  WebDriver is an API and protocol that
defines a language-neutral interface for controlling the behaviour of
web browsers.

Each browser is backed by a specific WebDriver implementation, called
a _driver_.  The driver is the component responsible for delegating
down to the browser, and handles all communication to and from
Selenium and the browser.

This separation is part of a conscious effort to have browser vendors
take responsibility for the implementation for their browser.
Selenium makes use of these third party drivers where possible, but
also provides its own drivers maintained by the project for the cases
where this is not a reality.

The Selenium framework ties all of these pieces together through a
user-facing interface that enables the different browser backends to
be used transparently, enabling cross-browser and cross-platform
automation.

More details about drivers can be found in the (drivers
section)[Different Drivers and Requirements].

### Consumer browsers

The Selenium framework officially supports the following browsers:

| Browser           | Maintainer | Versions Supported |
|-------------------|------------|--------------------|
| Firefox           | Selenium   | 4 and newer        |
| Chrome/Chromium   | Chromium   | All versions       |
| Opera             | Opera      | 10.5 and newer     |
| Safari            | Selenium   | 5.1 and newer      |
| Internet Explorer | Selenium   | 6 and newer        |

### Specialized browsers

There are also a set of specialized browsers out there typically used
in development environments.  We can make use of some of these
browsers for automation purposes also, and Selenium ties in support
for the following specialized drivers:

| Driver Name    | Purpose                                    | Maintainer          |
|----------------|--------------------------------------------|---------------------|
| GhostDriver    | Headless PhantomJS browser backed by V8.   | GhostDriver project |
| HtmlUnitDriver | Headless browser emulator backed by Rhino. | Selenium            |

Locating Elements
-----------------
<!-- #codeExamples -->
There are eight and only eight types of element locator supported by WebDriver recently.

| Locator | Description |
| ------- | ----------- |
| class name| Locates elements whose class name contains the search value; compound class names are not permitted.
| css selector | Locates elements matching a CSS selector.
| id | Locates elements whose ID attribute matches the search value.
| name| Locates elements whose NAME attribute matches the search value.
| link text| Locates anchor elements whose visible text matches the search value.
| partial link text| Locates anchor elements whose visible text partially matches the search value.
| tag name| Locates elements whose tag name matches the search value.
| xpath | Locates elements matching an XPath expression.


Acting on the AUT
-----------------
<!-- Setting elements text, clicking, drag&drop, running javascript, etc. -->

Reading Page State
------------------
<!-- Getting element text and attributes, running javascript, etc. -->

Grabbing Screenshots
--------------------
<!-- #codeExamples -->

The Rest of the API
-------------------
