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
<!-- Location using fluent selenium -->
One of the most fundamental things to learn when using WebDriver is finding elements. An alternative way to find elements in java is to use the [FluentWebElement](https://github.com/SeleniumHQ/fluent-selenium "SeleniumHQ/fluent-selenium") and [By](http://selenium.googlecode.com/git/docs/api/java/org/openqa/selenium/By.html "By.java")...
```java
public class Example  {
   	private final By searchInputId = id("gbqfq");
   	private final By searchButtonId = id("gbqfba");
   	public static void main(String[] args) {
		FluentWebDriver driver = new FluentWebDriver(new ChromeDriver());

       	// And now use this to visit Google
       	driver.get("http://www.google.com");

       	// Find the text input element by its id 
       	FluentWebElement searchInput = driver.input(searchInputId);

       	// Enter something to search for
       	searchInput.sendKeys("SeConf");

       	// Now click the Google Search Button
       	driver.button(searchButtonId).click();
   	}
}
```


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

Using Click API to handle click events in WebDriver:
```java
driver.findElement(By.Id("some id")).click();
```
Using SendKeys API to handle a type in WebDriver:
```java
String name = "selenium";
driver.findElement(By.name("locatorByName")).sendKeys(name);
```
Using JavaScript in WebDriver:
```java
WebElement element = (WebElement) ((JavascriptExecutor)driver).executeScript("return $('.cheese')[0]");
```
Using Actions Class in WebDriver:
	* handling drag and drop in WebDriver:
	```java
	WebElement sourceElement = driver.findElement(By.name("sourceElement"));
	WebElement targetElement = driver.findElement(By.name("target"));

	(new Actions(driver)).dragAndDrop(sourceElement, targetElement).perform();
	```
	* handling mouse hover in WebDriver:
	```java
	Actions builder = new Actions(driver);
	WebElement tagElement = driver.findElement(By.id("some id"));
	builder.moveToElement(tagElement).build().perform();
	```
	
Using Select API to select a value from a drop down:
```java
Select select = new Select(driver.findElement(By.tagName("select")));
select.deselectAll();
select.selectByVisibleText("text");
select.selectByIndex(index);
select.selectByValue("value");
```
Using Alert API for handling Alerts in WebDriver:
```java
Alert alert = driver.switchTo().alert();
alert.accept();
alert.dismiss();
alert.getText();
```
Using get and Navigate API for handling opening and navigation of applications in WebDriver:
```java
//both the API are used to open the specified url in the String
driver.navigate().to("http://www.seleniumhq.org");
driver.get("http://www.seleniumhq.org");
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
