WebDriver
=========
The biggest change in Selenium recently has been the inclusion of the WebDriver API. Driving a browser natively as a user would either locally or on a remote machine using the Selenium Server it marks a leap forward in terms of browser automation.

Selenium WebDriver fits in the same role as RC did, and has incorporated the original 1.x bindings. It refers to both the language bindings and the implementations of the individual browser controlling code. This is commonly referred to as just "WebDriver" or sometimes as Selenium 2.

Selenium 1.0 + WebDriver = Selenium 2.0

* WebDriver is designed in a simpler and more concise programming interface along with addressing some limitations in the Selenium-RC API.
* WebDriver is a compact Object Oriented API when compared to Selenium1.0
* It drives the browser much more effectively and over comes the limitations of Selenium 1.x which affected our functional test coverage, like the file upload or download, pop-ups and dialogs barrier
* WebDriver overcomes the limitation of Selenium Rc's Single Host origin policy

Different Drivers and Requirements
----------------------------------

Selenium WebDriver works with a variety of browsers, such as Firefox, Chrome, Internet Explorer, Safari, and Opera. WebDriver drives the browser directly using the browser’s built in support for automation.

### Firefox

You can use any languages that are supported by the selenium team to write you code. You can use any testing frameworks like junit / testng to write your tests. This code example uses testng to 
write tests.

''' java

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;
import java.util.concurrent.TimeUnit;


public class test{

    private WebDriver driver;

    @BeforeClass
    public void setUp() throws Exception {
        DesiredCapabilities capabillities = DesiredCapabilities.firefox();
        capabillities.setCapability("version", "21");
        //Instantiate the firefox driver
        driver = new FirefoxDriver();
        // Set the wait
        driver.manage().timeouts().implicitlyWait(45, TimeUnit.SECONDS);
    }

    // You can also swap with the driver with chromedriver or IEDriver. For requirements on chromedriver see the requirements section.
    @Test
    public void Test() throws Exception
    {
        //Open your site
        driver.get("http://docs.seleniumhq.org/");
        // add more code here
    }

    @AfterClass
    //Quit the driver
    public void tearDown() throws Exception {
        driver.quit();
    }

}


'''


#### Ruby
Requirements: 

```ruby
# ruby
require "selenium-webdriver"
driver = Selenium::WebDriver.for :firefox
```

### Chrome

#### Ruby / Python
Requirements: To drive Chrome, you have to download [ChromeDriver](https://code.google.com/p/chromedriver/downloads/list) and either put it into a folder that is already in your PATH or add the new folder to your PATH. To find out what folders are currently in your PATH, execute this command in your Mac or Linux Terminal.

```bash
#!/bin/sh
echo $PATH
# => /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

```ruby
# ruby
require "selenium-webdriver"
driver = Selenium::WebDriver.for :chrome
```

### Opera

#### Java
Requirements:
Expose the OperaDriver JAR to the Java CLASSPATH

#### Ruby / Python
Requirements: To drive Opera, you must have Opera installed and a copy of [Selenium Server](http://code.google.com/p/selenium/downloads/list). You must also set the environmental variable 'SELENIUM_SERVER_JAR' to the full path of the *selenium-server-standalone JAR that you just downloaded.

```ruby
# ruby
require "selenium-webdriver"
driver = Selenium::WebDriver.for :opera
```

<!-- #codeExamples -->

Browser Launching and Manipulation
----------------------------------
<!-- #codeExamples -->
<!-- Remember to cover profile and extensions here -->

Waits (implicit & explicit)
---------------------------
<!-- #codeExamples -->
* Implicit Waits

The ImplicitWait will tell the webDriver to poll the DOM for a certain duration when trying to find the element, this will be useful when certain elements on the webpage will not be available immediately and needs some time to load.
By default it ill take the value to 0, for the life of the WebDriver object instance through out the test script.

#### Java
```java
WebDriver driver = new FirefoxDriver();
driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
driver.get("http://somedomain/url_that_delays_loading");
WebElement myDynamicElement = driver.findElement(By.id("myDynamicElement"));
```

* Explicit Waits
An explicit waits is code you define to wait for a certain condition to occur before proceeding further in the code. Which is more similar to the Thread.sleep().
We can combine the use of Expected Conditions to accomplish wait Without using any hard delay.
 
#### Java
```java
WebDriver driver = new FirefoxDriver();
driver.get("http://somedomain/url_that_delays_loading");
WebElement myDynamicElement = (new WebDriverWait(driver, 10))
  .until(ExpectedConditions.presenceOfElementLocated(By.id("myDynamicElement")));
```

* FluentWait

FluentWait instance defines the maximum amount of time to wait for a condition, as well as the frequency with which to check the condition. 
User may configure the wait to ignore specific types of exceptions whilst waiting, such as NoSuchElementExceptions when searching for an element on the page.

#### Java
```java
// Waiting 30 seconds for an element to be present on the page, checking
   // for its presence once every 5 seconds.
   Wait<WebDriver> wait = new FluentWait<WebDriver>(driver)
       .withTimeout(30, SECONDS)
       .pollingEvery(5, SECONDS)
       .ignoring(NoSuchElementException.class);

   WebElement foo = wait.until(new Function<WebDriver, WebElement>() {
     public WebElement apply(WebDriver driver) {
       return driver.findElement(By.id("foo"));
     }
   });
```

Support Classes
---------------
<!-- #codeExamples -->

HTTP Proxies
------------
<!-- #codeExamples -->
