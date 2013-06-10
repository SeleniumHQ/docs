Best Practices
==============

Page Object Models
------------------
Page Object is a Design Pattern which has become popular in test automation for enhancing test maintenance and reducing code duplication. A page object is an object-oriented class that serves as an interface to a page of your AUT. The tests then use the methods of this page object class whenever they need to interact with that page of the UI. The benefit is that if the UI changes for the page, the tests themselves don’t need to change, only the code within the page object needs to change. Subsequently all changes to support that new UI are located in one place.

The Page Object Design Pattern provides the following advantages.

1. There is clean separation between test code and page specific code such as locators (or their use if you’re using a UI map) and layout.

Rule of Thumb:
 1. Page objects should return a value
   - Examples: If you submit a page and are redirected, it should return the new page object
   - If you click submit on login and you want to check to see if a user is logged in it should return True or False in a method


Generating Application State
----------------------------

Mock External Services
----------------------

Improved Reporting
------------------

Avoid Sharing State
-------------------

### Fresh browser per test
Start each test from a clean known state.  Ideally spin up a new virtual machine for each test.  If spinning up a new virtual machine is not practical, at least start a new WebDriver for each test.  For Firefox, start a WebDriver with your
known profile.

Java example
```java
FirefoxProfile profile = new FirefoxProfile(new File("pathToFirefoxProfile"));
WebDriver driver = new FirefoxDriver(profile);
```

### Unique test accounts
