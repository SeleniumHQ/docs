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

More details about drivers can be found in the (drivers
section)[Different Drivers and Requirements].

### Consumer browsers

The Selenium framework officially supports the following browsers:

| Browser           | Maintainer | Versions Supported |
|-------------------|------------|--------------------|
| Chrome/Chromium   | Chromium   | All versions       |
| Firefox           | Selenium   | 4 and newer        |
| Internet Explorer | Selenium   | 6 and newer        |
| Opera             | Opera      | 10.5 and newer     |
| Safari            | Selenium   | 5.1 and newer      |

### Specialized browsers

There are also a set of specialized browsers out there typically used
in development environments.  We can make use of some of these
browsers for automation purposes also, and Selenium ties in support
for the following specialized drivers:

| Driver Name     | Purpose                                        | Maintainer                                                  |
|-----------------|------------------------------------------------|-------------------------------------------------------------|
| PhantomJSDriver | Headless PhantomJS browser backed by QtWebKit. | [GhostDriver project](https://github.com/detro/ghostdriver) |
| HtmlUnitDriver  | Headless browser emulator backed by Rhino.     | Selenium                                                    |

Locating Elements
-----------------

### Loating one element

One of the most fundamental things to learn when using WebDriver is
finding elements on the page.  It offers a number of built-in selector
types, amongst them finding an element by its ID attribute:

```java
WebElement cheese = driver.findElement(By.id("cheese"));
```

As seen in the example, locating elements in WebDriver is done on the
`WebDriver` instance object.  The `findElement(By)` method returns
another fundamental object type in WebDriver, called a `WebElement`.
The types `WebDriver`'s and `WebElement`'s represent the browser
instance and a DOM node respectively.

Once you have have a reference to a web element you've located, you
can narrow down your search by using the same call on that object
instance:

```java
WebElement cheese = driver.findElement(By.id("cheese"));
WebElement cheddar = cheese.findElement(By.id("cheddar"));
```

You can do this because both the `WebDriver` and `WebElement` types
implement the
[`SearchContext`](http://selenium.googlecode.com/git/docs/api/java/org/openqa/selenium/SearchContext.html)
interface.  In WebDriver this is known as a _role-based interface_.
Role-based interfaces allow you to determine whether a particular
driver implementation supports a given feature.  These interfaces are
clearly defined and try to adhere to having only a single role of
responsibility.  You can read more about WebDriver's design and what
roles are supported in which drivers in the [Some Other Section Which
Must Be Named](#).

Consequently, the `By` interface you saw used above also supports a
number of additional locator strategies.  A nested lookup might not be
the most effective cheese location strategy since it requires two
separate commands to be issued to the browser; first searching the DOM
for an element with ID “cheese”, then a search for “cheddar” in a
narrowed context.

To improve the performance slightly we should try to use a more
specific locator.  Thankfully WebDriver supports looking up elements
by CSS locators and so we can contract the two previous locators into
one search:

```java
driver.findElement(By.cssSelector("#cheese #cheddar"));
```

### Locating multiple elements

Incidentally the document we are introspecting may turn out to have an
ordered list of the cheese we like the best:

```html
<ol id="cheese">
  <li id="cheddar">…</li>
  <li id="brie">…</li>
  <li id="rochefort">…</li>
  <li id="camembert">…</li>
</ul>
```

Since more cheese is undisputably always better, and it would be
cumbersome to have to retrieve each of the items individually, a far
superior technique for retrieving cheese is to make use of the
pluralized version `findElements(By)`.  The return type of this method
is a collection of web elements.  If only one element is found, the
collection size will equal 1.  If no elements match the selection, an
empty list will be returned.

```java
List<WebElement> muchoCheese = driver.findElements(By.cssSelector("#cheese li"));
```

### Element selection strategies

There are eight different built-in element location strategies in WebDriver:

| Locator           | Description |
|-------------------|-------------|
| class name        | Locates elements whose class name contains the search value; compound class names are not permitted.
| css selector      | Locates elements matching a CSS selector.
| id                | Locates elements whose ID attribute matches the search value.
| name              | Locates elements whose NAME attribute matches the search value.
| link text         | Locates anchor elements whose visible text matches the search value.
| partial link text | Locates anchor elements whose visible text partially matches the search value.
| tag name          | Locates elements whose tag name matches the search value.
| xpath             | Locates elements matching an XPath expression.

### Tips on using selectors

In general, if HTML IDs are available, unique, and consistently predictable, they are the preferred method for locating an element on a page. They tend to work very quickly, and forego much processing that comes with complicated DOM traversals

If unique IDs are unavailable, a well-written CSS Selector is the preferred method of locating an element. XPath works as well as CSS Selectors, but the syntax is complicated and frequently difficult to debug

LinkText and PartialLinkText have drawbacks in that they only work on link elements

TagName can be a dangerous way to locate elements--there are frequently multiple elements of the same tag present on the page at once. This is mostly useful when calling the findElements() method--which returns a list of elements rather than just one

Here is a simple example, for sending text to the search input at google.com:

```java
        WebDriver driver = new ChromeDriver();
        driver.get("http://www.google.com/");

        WebElement searchField = driver.findElement( By.id( "gbqfq" ) );
        searchField.sendKeys( "Where the Wild Things Are" );
```

Sometimes locating elements is just that simple, but frequently it requires more steps: one technique frequently used in locating elements is to "chain" multiple locations together: Use an ID or some other easy identifier to locate an element at the top of a tree, then use another locator to find the particular "child" element you're interested in.

In this example, we will go to the Yahoo home page, and grab the second headline in the "Trending Now" box on the top right:

```java
        WebDriver driver = new FirefoxDriver();
        driver.get("http://www.yahoo.com/");

        System.out.println("Second story on the Yahoo home page: " + driver.findElement(By.className("type_trendingnow")).findElements(By.tagName("li")).get(1).getText());
``` 

This example uses the CSS Class Name to locate the "parent" element of the story we're interested in (the Trending Now box), then uses the Tag Name locator to locate a list of all the article links underneath--this returns a List<WebElement>, from which we then pull the second element. Then we get the text displayed in the link, and send it to the console. We could conceivably then click on the link, compare the full headline against the sample here, or take any variety of actions to complete the test

The recommended Best Practice is to keep your locators as compact and readable as possible, and to "anchor" on a parent element when possible. Asking WebDriver to traverse the DOM structure is an expensive operation, and the more you can narrow the scope of your search, the better

Acting on the AUT
-----------------
<!-- Setting elements text, clicking, drag&drop, running javascript, etc. -->

You can set an element's text using the sendKeys method as follows:
```java
String name = "Charles";
driver.findElement(By.name("name")).sendKeys(name);
```

Some web application use javascript libraries to add drag-and-drop functionality. The following is a basic example of 
dragging one element onto another element:

```java
WebElement source = driver.findElement(By.id("source"));
WebElement target = driver.findElement(By.id("target"));
new Actions(driver).dragAndDrop(source, target).build().perform();
```

Clicking on an element

You can click on an element using the click method:
```java
driver.findElement(By.cssSelector("input[type=\"submit\"]")).click();
```

Reading Page State
------------------
<!-- Getting element text and attributes, running javascript, etc. -->

Grabbing Screenshots
--------------------
<!-- #codeExamples -->

#### Java
```java
import java.io.File;
import java.net.URL;

import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.remote.Augmenter;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;

public class Testing {
    
    public void myTest() throws Exception {
        WebDriver driver = new RemoteWebDriver(
                                new URL("http://localhost:4444/wd/hub"), 
                                DesiredCapabilities.firefox());
        
        driver.get("http://www.seleniumhq.org");
        
        // RemoteWebDriver does not implement the TakesScreenshot class
        // if the driver does have the Capabilities to take a screenshot
        // then Augmenter will add the TakesScreenshot methods to the instance
        WebDriver augmentedDriver = new Augmenter().augment(driver);
        File screenshot = ((TakesScreenshot)augmentedDriver).
                            getScreenshotAs(OutputType.FILE);
    }
````
A nice feature of the remote webdriver is that exceptions often have an attached screen shot, encoded as a Base64 PNG. 
In order to get this screenshot, 

#### Java

```java
public String extractScreenShot(WebDriverException e) {
  Throwable cause = e.getCause();
  if (cause instanceof ScreenshotException) {
    return ((ScreenshotException) cause).getBase64EncodedScreenshot();
  }
  return null;
}
```
The Rest of the API
-------------------
