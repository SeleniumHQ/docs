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

### Firefox

#### Java

Requirements: 

```java

    private WebDriver driver;
    
    @BeforeClass
    public void setUp() throws Exception {
        DesiredCapabilities capabillities = DesiredCapabilities.firefox();
        // You can also swap with the driver with chromedriver or IEDriver. For requirements on chromedriver see the chrome requirements section.
        capabillities.setCapability("version", "21");
        //Instantiate the firefox driver
        driver = new FirefoxDriver();
        // Set the wait
        driver.manage().timeouts().implicitlyWait(45, TimeUnit.SECONDS);
    }

    
```

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

Requirements: To drive Opera, you must have Opera installed and a copy
of [Selenium
Server](http://code.google.com/p/selenium/downloads/list). You must
also set the environmental variable 'SELENIUM_SERVER_JAR' to the full
path of the *selenium-server-standalone JAR that you just downloaded.

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
