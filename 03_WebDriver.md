WebDriver
=========

Different Drivers and Requirements
----------------------------------

Selenium WebDriver works with a variety of browsers, such as Firefox, Chrome, Internet Explorer, Safari, and Opera. WebDriver drives the browser directly using the browser’s built in support for automation.
You can use any languages that are supported by the selenium team to write your code. You can use any testing frameworks like junit / testng to write your tests.

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

Support Classes
---------------
<!-- #codeExamples -->

HTTP Proxies
------------
<!-- #codeExamples -->


*********code for scrolling down the page*************

        //import required
        import org.openqa.selenium.JavascriptExecutor;

       JavascriptExecutor jse2 = (JavascriptExecutor)driver;
        jse2.executeScript("window.scrollBy(0,24500)", "");

*********Autocompleting a text field *********************

driver.findElement(By.cssSelector("div.reference-autocomplete")).click();
