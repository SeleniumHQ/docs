WebDriver
=========

Different Drivers and Requirements
----------------------------------
<!-- #codeExamples -->

Browser Launching and Manipulation
----------------------------------

Firefox Profiles
----------------

You have the ability to define and re-use specialized profiles in Firefox. New profiles can be created for one-time use in a test session, or existing profiles (customized by you outside of WebDriver) can be utilized.

In this example, imagine a small internal tool that requires Basic HTTP authentication. In this case, your company has assigned an untrusted certificate to the server, which will result in a forced authentication when WebDriver tries to log in. Normally, you would not be able to control the acceptance of this certificate in code. This snippet demonstrates how a Firefox profile can circumvent this inconvenience.

```java
        FirefoxProfile profile = new FirefoxProfile();
        profile.setAssumeUntrustedCertificateIssuer(true);  //Accept self-signed certificates by default
        
        WebDriver httpsDriver = new FirefoxDriver(profile);
        httpsDriver.get("https://internal.mytools.com/");
  driver.quit();
```

EventFiringWebDriver
--------------------

The EventFiringWebDriver offers the ability to "intercept" certain events that fire regularly over the course of a test. Clicks, page turns, forward- and back- navigations--all of these are events. If you write your own custom implementation of the EventFiringWebDriver, you can change WebDriver's behavior when any of these events occur. For example, you can add special logging before every click, informing you of the locator being used, etc.

The advantage of this approach is, you avoid cluttering up your test code with all the log statements--by implementing this interface, you get these special hooks and log statements "for free".

To utilize the EventFiringWebDriver, you must first implement your custom hooks in a class which implements WebDriverEventListener. Then, you simply take an existing WebDriver instance (any browser--remember, it's an interface), and send it to a new instance of the EventFiringWebDriver, complete with your implementation:

```java
        WebDriver browserDriver = new FirefoxDriver();
	WebDriverEventListener myEventListener = new MyWebDriverEventListener(); //A class implementing WebDriverEventListener, written elsewhere
 	WebDriver eventFiringDriver = new EventFiringWebDriver( browserDriver ).register( myEventListener );

	// The beforeNavigateTo() method (shown below) will be executed just before the navigation takes place. Once the page has turned, it will invoke afterNavigateTo()
	eventFiringDriver.get("http://www.google.com/");
	eventFiringDriver.quit();
``` 
       
Below is a snippet of our custom implementation. You will have to implement all the methods of the interface, but they have been omitted for brevity: 

```java
public class MyWebDriverEventListener implements WebDriverEventListener {

	<snip>

    @Override
    public void beforeNavigateTo( String url, WebDriver driver ) {
        AutomationLogger.logDebugMessage( "Currently on page [%s], but about to navigate to [%s]", driver.getTitle(), url );
    }

    @Override
    public void afterNavigateTo( String url, WebDriver driver ) {
        AutomationLogger.logInfoMessage( "Completed navigation to [%s]", driver.getTitle(), url );
    }

	<snip>

}
```                    



Waits (implicit & explicit)
---------------------------
<!-- #codeExamples -->

Support Classes
---------------
<!-- #codeExamples -->

HTTP Proxies
------------
<!-- #codeExamples -->
