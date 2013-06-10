Getting Started with WebDriver
==============================

Supported Browsers
------------------
WebDriver supports automation of the all main browsers in the market.
Automation bits for each browser are called __Drivers__. Some drivers are built
inside the browser, others are built and maintained by the Selenium developers.
More details about Drivers can be found in the Drivers (section[Different Drivers and Requirements]).

| Browser | Implementation | Versions Supported
| ------- | -------------- | ------------------
| Firefox | Selenium project. Firefox Plugin | 4 and newer
| Google Chrome | Chromium Devs. Built-in | All versions
| Opera | Opera. Built-in | 9 and newer
| Safari | Selenium project. Safari Plugin | 5.1 and newer
| Internet Explorer | Selenium project. COM | 6 and newer

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
