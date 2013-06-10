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
<!-- Location using fluent selenium -->
One of the most fundamental things to learn when using WebDriver is finding elements. An alternative way to find elements in java is to use the [FluentWebElement](https://github.com/SeleniumHQ/fluent-selenium "SeleniumHQ/fluent-selenium") and [By](http://selenium.googlecode.com/git/docs/api/java/org/openqa/selenium/By.html "By.java")...

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

<!-- #codeExamples -->
<!-- Cover all types of locators -->

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
