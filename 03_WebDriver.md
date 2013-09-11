WebDriver
=========

The biggest change in Selenium recently has been the inclusion of the
WebDriver API.  Driving a browser natively as a user would either
locally or on a remote machine using the Selenium server it marks a
leap forward in terms of browser automation.

Selenium WebDriver fits in the same role as RC did, and has
incorporated the original 1.x bindings.  It refers to both the
language bindings and the implementations of the individual browser
controlling code.  This is commonly referred to as just _WebDriver_ or
sometimes as _Selenium 2_.

Selenium 1.0 + WebDriver = Selenium 2.0

* WebDriver is designed in a simpler and more concise programming interface along with addressing some limitations in the Selenium-RC API.
* WebDriver is a compact Object Oriented API when compared to Selenium1.0
* It drives the browser much more effectively and over comes the limitations of Selenium 1.x which affected our functional test coverage, like the file upload or download, pop-ups and dialogs barrier
* WebDriver overcomes the limitation of Selenium Rc's Single Host origin policy

Driver Requirements
-------------------

Through WebDriver, Selenium supports all major browsers on the market
such as Chrom(ium), Firefox, Internet Explorer, Opera, and Safari.
Where possible WebDriver drives the browser using the browser's
built-in support for automation, although not all browsers have
official support for remote control.

WebDriver's aim is to emulate a real user's interaction with the
browser as closely as possible.  This is possible at varying levels in
different browsers.  For more detalis on the different driver
idiosyncracies, please see [Driver
Idiosyncracies](09_Driver_Idiosyncracies.md).

Even though all the drivers share a single user-facing interface for
contolling the browser, they have slightly different ways of setting
up browser sessions.  Since many of the driver implementations are
provided by third parties, they are not included in the standard
Selenium distribution.

Driver instantiation, profile management, and various browser specific
settings are examples of parameters that have different requirements
depending on the browser.  This section explains the basic
requirements for getting you started with the different browsers.

### Chromium/Chrome

To drive Chrome or Chromium, you have to download
[chromedriver](https://code.google.com/p/chromedriver/downloads/list)
and put it in a folder that is on your system's path.

On Linux or Mac OS X this means modifying the `PATH` environmental
variable.  You can see what directories, separated by a colon, that
makes up your system's path by executing the following command:

```sh
$ echo $PATH
# => /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
```

To include chromedriver on the path if it isn't already, make sure you
include the chromedriver binary's parent directory.  The following
line will set the _$PATH_ environmental variable its current content,
plus an additional path added after the colon:

```sh
$ export PATH="$PATH:/path/to/chromedriver"
```

When chromedriver is available on your path, you should be able to
execute the _chromedriver_ executable from any directory.

To instantiate a Chrome/Chromium session, you can do the following:

```java
WebDriver driver = new ChromeDriver();
```

Remember that you have to set the path to the chromedriver executable.
This is possible using the following line:

```java
System.setProperty("webdriver.chrome.driver", "/path/to/chromedriver");
```

```ruby
require "selenium-webdriver"
driver = Selenium::WebDriver.for :chrome
```

The chromedriver is implemented as a WebDriver remote server that by
exposing Chrome's internal automation proxy interface instructs the
browser what to do.

### Firefox

The driver for Firefox is maintained by the Selenium project and works
by installing a browser add-on in Firefox' profile before starting the
browser.  The WebDriver client then communicates with that add-on to
instruct the browser what to do.

The approach for instantiating a WebDriver session to Firefox is
pretty much the same as for Chrome and Chromium, but doesn't require
any additional dependencies:

```java
WebDriver driver = new FirefoxDriver();
```
```ruby
require "selenium-webdriver"
driver = Selenium::WebDriver.for :firefox
```

### Internet Explorer

### Opera (Presto-based)

Setting up support for Opera is fairly similar to the Chrome approach
in that they are both supported by third parties.  Consequently you
need to set up a dependency to the `com.opera:operadriver` artifact
(if using Maven) or [download a prebuilt standalone server
JAR](https://code.google.com/p/selenium/downloads/list).  As long as
the JAR is available on your classpath, you should be good to go.

If you use Python or Ruby as your language of choice you must set the
_SELENIUM_SERVER_JAR_ environmental variable to point to the location
of the binary JAR.

On Linux and Mac OS X you can do it for your current shell session by
doing this:

```sh
$ export SELENIUM_SERVER_JAR=/path/to/operadriver.jar
```

It's possible to set this in your shell's profile (e.g. _~/.bashrc_)
to have the variable set every time you launch a new shell session.
Alternatively you can set the variable programmatically in your test
runner.  In Python you'd do something along the lines of

```python
import os
os.environ["SELENIUM_SERVER_JAR"] = "/path/to/selenium-server-standalone.jar"
```

The equivalent in Ruby:

```ruby
ENV["SELENIUM_SERVER_JAR"] = "/path/to/selenium-server-standalone.jar"
```

Instantiating a driver session is similar to Firefox and Chromium:

```java
WebDriver driver = new OperaDriver();
```
```ruby
require "selenium-webdriver"
driver = Selenium::WebDriver.for :opera
```

### Safari

### Specialized browsers

#### HtmlUnit

#### PhantomJS

Browser Launching and Manipulation
----------------------------------
<!-- #codeExamples -->
<!-- Remember to cover profile and extensions here -->

### Ruby

Ruby is not installed by default on Windows. Download the latest [version](http://rubyinstaller.org/downloads) and run the installer. You can leave all settings at default values, except at the *Installation Destination and Optional Tasks* screen check *Add Ruby executables to your PATH* checkbox. To drive any browser you have to install selenium-webdriver Ruby gem. To install it, open command prompt and type this:

```bat
gem install selenium-webdriver
```

### Internet Explorer

Internet Explorer is installed by default on Windows, so no installation is needed. To drive Internet Explorer on Windows you have to download the latest [Internet Explorer Driver](https://code.google.com/p/selenium/downloads/list) and put the file into a folder that is in PATH. To find out which directories are in PATH type `echo %PATH%` in command prompt.

```bat
echo %PATH%
# => C:\Ruby200\bin;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem
```

`C:\Ruby200\bin` looks like a good place. Unzip `IEDriverServer` file and move `IEDriverServer.exe` there.

This should open a new Internet Explorer window:

```ruby
require "selenium-webdriver"
driver = Selenium::WebDriver.for :internet_explorer
```

Waits (implicit & explicit)
---------------------------
Waiting is having the automated task execution elapse a certain amount of time before continuing with the next step.

### Implicit Wait
An implicit wait is to tell WebDriver to poll the DOM for a certain amount of time when trying to find an element or elements if they are not immediately available. The default setting is 0. Once set, the implicit wait is set for the life of the WebDriver object instance.

### Explicit Wait
An explicit waits is code you define to wait for a certain condition to occur before proceeding further in the code.

#### Expected Conditions
There are some common conditions that are frequently come across when automating web browsers. 

```ruby
# ruby
require "selenium-webdriver"
driver = Selenium::WebDriver.for :firefox

# element is clickable
wait = Selenium::WebDriver::Wait.new(:timeout => 10)
wait.until { driver.find_element(:id => "your_element").click }
```

### Fluent Wait

The implicit wait in Selenium 2 might not work for Ajax elements. It is recommend that you use any one of the following workaround to handle Ajax elements.

One approach is to use FluentWait and a Predicate available with Selenium2. The advantage of this approach is that element polling mechanism is configurable. The code example below waits for 1 second and polls for a textarea every 100 milliseconds.

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

``` java

    FluentWait<By> fluentWait = new FluentWait<By>(By.tagName("TEXTAREA"));
        fluentWait.pollingEvery(100, TimeUnit.MILLISECONDS);
        fluentWait.withTimeout(1000, TimeUnit.MILLISECONDS);
        fluentWait.until(new Predicate<By>() {
            public boolean apply(By by) {
                try {
                    return browser.findElement(by).isDisplayed();
                } catch (NoSuchElementException ex) {
                    return false;
                }
            }
        });
        browser.findElement(By.tagName("TEXTAREA")).sendKeys("text to enter");
    
```    


Support Classes
---------------
<!-- #codeExamples -->

HTTP Proxies
------------
<!-- #codeExamples -->
