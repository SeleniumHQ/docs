Getting Started with WebDriver
==============================

Supported Browsers
------------------

Selenium supports automation of all the major browsers in the market
through the use of _WebDriver_.  WebDriver is an API and protocol that
defines a language-neutral interface for controlling the behaviour of
web browsers.  Each browser is backed by a specific WebDriver
implementation, called a _driver_.  The driver is the component
responsible for delegating down to the browser, and handles all
communication to and from Selenium and the browser.

This separation is part of a conscious effort to have browser vendors
take responsibility for the implementation for their browser.
Selenium makes use of these third party drivers where possible, but
also provides its own drivers maintained by the project for the cases
where this is not a reality.

The Selenium framework ties all of these pieces together through a
user-facing interface that enables the different browser backends to
be used transparently, enabling cross-browser and cross-platform
automation.

More details about drivers can be found in the [drivers
section](09_Driver_Idiosyncrasies.md).

### Consumer browsers

The Selenium framework officially supports the following browsers:

+-------------------+------------+--------------------+
| Browser           | Maintainer | Versions Supported |
+-------------------+------------+--------------------+
| Chrome/Chromium   | Chromium   | All versions       |
| Firefox           | Selenium   | 4 and newer        |
| Internet Explorer | Selenium   | 6 and newer        |
| Opera             | Opera      | 10.5 and newer     |
| Safari            | Selenium   | 5.1 and newer      |
+-------------------+------------+--------------------+

### Specialized browsers

There are also a set of specialized browsers out there typically used
in development environments.  We can make use of some of these
browsers for automation purposes also, and Selenium ties in support
for the following specialized drivers:

+-----------------+------------------------------------------------+-------------------------------------------------------------+
| Driver Name     | Purpose                                        | Maintainer                                                  |
+-----------------+------------------------------------------------+-------------------------------------------------------------+
| PhantomJSDriver | Headless PhantomJS browser backed by QtWebKit. | [GhostDriver project](https://github.com/detro/ghostdriver) |
| HtmlUnitDriver  | Headless browser emulator backed by Rhino.     | Selenium                                                    |
+-----------------+------------------------------------------------+-------------------------------------------------------------+

Locating Elements
-----------------

### Locating one element

One of the most fundamental techniques to learn when using WebDriver is
how to find elements on the page. WebDriver offers a number of built-in selector
types, amongst them finding an element by its ID attribute:

.. code-block:: java

   WebElement cheese = driver.findElement(By.id("cheese"));

As seen in the example, locating elements in WebDriver is done on the
`WebDriver` instance object.  The `findElement(By)` method returns
another fundamental object type: the `WebElement`.

* `WebDriver` represents the browser
* `WebElement` represents a particular DOM node (a control, e.g. a
  link or input field, etc)

Once you have have a reference to a web element that's been "found", you
can narrow the scope of your search by using the same call on that object
instance:

.. code-block:: java

   WebElement cheese = driver.findElement(By.id("cheese"));
   WebElement cheddar = cheese.findElement(By.id("cheddar"));

You can do this because both the *WebDriver* and *WebElement* types
implement the `SearchContext
<http://selenium.googlecode.com/git/docs/api/java/org/openqa/selenium/SearchContext.html>`_
interface. In WebDriver this is known as a **role-based interface**.
Role-based interfaces allow you to determine whether a particular
driver implementation supports a given feature. These interfaces are
clearly defined and try to adhere to having only a single role of
responsibility.  You can read more about WebDriver's design and what
roles are supported in which drivers in the [Some Other Section Which
Must Be Named](#).

Consequently, the `By` interface used above also supports a
number of additional locator strategies.  A nested lookup might not be
the most effective cheese location strategy since it requires two
separate commands to be issued to the browser; first searching the DOM
for an element with ID “cheese”, then a search for “cheddar” in a
narrowed context.

To improve the performance slightly we should try to use a more
specific locator: WebDriver supports looking up elements
by CSS locators, allowing us to combine the two previous locators into
one search:

```java
driver.findElement(By.cssSelector("#cheese #cheddar"));
```

### Locating multiple elements

It's possible that the document we are working with may turn have an
ordered list of the cheese we like the best:

.. code-block:: html

   <ol id="cheese">
     <li id="cheddar">…</li>
     <li id="brie">…</li>
     <li id="rochefort">…</li>
     <li id="camembert">…</li>
   </ul>

Since more cheese is undisputably better, and it would be cumbersome
to have to retrieve each of the items individually, a superior
technique for retrieving cheese is to make use of the pluralized
version `findElements(By)`. This method returns a collection of web
elements. If only one element is found, it will still return a
collection (of one element). If no elements match the locator, an
empty list will be returned.

.. code-block:: java

   List<WebElement> muchoCheese = driver.findElements(By.cssSelector("#cheese li"));

### Element selection strategies

There are eight different built-in element location strategies in WebDriver:

+-------------------+------------------------------------------------------------------------------------------------------+
| Locator           | Description                                                                                          |
+-------------------+------------------------------------------------------------------------------------------------------+
| class name        | Locates elements whose class name contains the search value (compound class names are not permitted) |
| css selector      | Locates elements matching a CSS selector                                                             |
| id                | Locates elements whose ID attribute matches the search value                                         |
| name              | Locates elements whose NAME attribute matches the search value                                       |
| link text         | Locates anchor elements whose visible text matches the search value                                  |
| partial link text | Locates anchor elements whose visible text partially matches the search value                        |
| tag name          | Locates elements whose tag name matches the search value                                             |
| xpath             | Locates elements matching an XPath expression                                                        |
+-------------------+------------------------------------------------------------------------------------------------------+

### Tips on using selectors

In general, if HTML ID's are available, unique, and consistently
predictable, they are the preferred method for locating an element on
a page.  They tend to work very quickly, and forego much processing
that comes with complicated DOM traversals.

If unique IDs are unavailable, a well-written CSS selector is the
preferred method of locating an element.  XPath works as well as CSS
selectors, but the syntax is complicated and frequently difficult to
debug.  Though XPath selectors are very flexible, they're typically
not performance tested by browser vendors and tend to be quite slow.

Selection strategies based on link text and partial link text have
drawbacks in that they only work on link elements.  Additionally, they
call down to XPath selectors internally in WebDriver.

Tag name can be a dangerous way to locate elements.  There are
frequently multiple elements of the same tag present on the page.
This is mostly useful when calling the `findElements(By)` method which
returns a collection of elements.

The recommended best practice is to keep your locators as compact and
readable as possible.  Asking WebDriver to traverse the DOM structure
is an expensive operation, and the more you can narrow the scope of
your search, the better.

Performing Actions on the AUT
-----------------------------

You can set an element's text using the sendKeys method as follows:

.. code-block:: java

   String name = "Charles";
   driver.findElement(By.name("name")).sendKeys(name);

Some web application use javascript libraries to add drag-and-drop
functionality. The following is a basic example of dragging one
element onto another element:

.. code-block:: java

   WebElement source = driver.findElement(By.id("source"));
   WebElement target = driver.findElement(By.id("target"));
   new Actions(driver).dragAndDrop(source, target).build().perform();

Clicking on an element

You can click on an element using the click method:

.. code-block:: java

   driver.findElement(By.cssSelector("input[type=\"submit\"]")).click();
