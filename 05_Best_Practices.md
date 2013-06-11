Best Practices
==============

Functional testing is difficult to get right for many reasons.  If not
application state, complexity, and dependencies make testing difficult
enough, dealing with browsers – and especially cross-browser
incompatibilities – makes writing good tests a challenge.

Selenium provides tools to make functional user interaction easier,
but doesn't help you write well-architected test suites.  In this
chapter we offer advice, or best practices if you will, on how to
approach functional web page automation.

This chapter records software design patterns popular amongst many of
the users of Selenium that have proven successful over the years.

Page Object Models
------------------

Page Object is a Design Pattern which has become popular in test
automation for enhancing test maintenance and reducing code
duplication. A page object is an object-oriented class that serves as
an interface to a page of your AUT. The tests then use the methods of
this page object class whenever they need to interact with that page
of the UI. The benefit is that if the UI changes for the page, the
tests themselves don’t need to change, only the code within the page
object needs to change. Subsequently all changes to support that new
UI are located in one place.

The Page Object Design Pattern provides the following advantage:

There is clean separation between test code and page specific code
such as locators (or their use if you’re using a UI map) and layout.

Rule of Thumb:

- Page objects should return a value
- If you submit a page and are redirected, it should return the new
  page object
- If you click submit on login and you want to check to see if a user
  is logged in it should return True or False in a method
Domain Specific Language
-------------------------
DSL	- Domain Specific Language.
In general DSL is a programming language dedicated to a particular problem that is created specifically to solve problems.

With Selenium, DSL are methods that are specifically written to make the API simple and readable which would enable a good rapport between the developer's and the business stake holders.

* Benefits
	* Readable - Business stake holders can also understand as its readable in a user level.
	* Writable - Easy to write. It Shall avoid code duplication.
	* Extensible - Test base will extend with these DSL

Writing your own DSL - By Wrapping WebDriver API's

#### Java

```java
public void findElementAndType(webDriver driver, String elementLocator,String testData){
driver.findElement(By.name(elemenLocator)).clear();
driver.findElement(By.name(elemenLocator)).sendKeys(testData);
}
```

Generating Application State
----------------------------

Selenium should not be used to prepare a test case.  All repetitive
actions, and prepration for a test case should be done through other
methods.  An example, most Web UI have authentication(login form).
Eliminating logging via web browser before every test will improve
both the speed and stability of the test. A method should be created
to gain access to the AUT(i.e.-using an API to login and set cookie in
browser object).  Also, creating methods to pre-load data for testing
should not be done using Selenium.  As mentioned previously, existing
APIs should be leveraged to create data for the AUT.

Mock External Services
----------------------

Eliminating the dependencies on external services will greatly improve
the speed and stability on tests.

Improved Reporting
------------------

Selenium is not designed to report on the status of test cases
run. Taking advantage of the built-in reporting capabilities of unit
test frameworks is a good start.  Most unit test frameworks have
reports that can generate xUnit or HTML formatted reports.  xUnit
reports are popular for importing results to a Continuous
Integration(CI) server like Jenkins, Travis, Bamboo, etc.  Here are
some links for more information regarding report outputs for several
languages

Python:

- nose
  - xUnit: http://nose.readthedocs.org/en/latest/plugins/xunit.html
  - HTML: https://nose.readthedocs.org/en/latest/plugins/cover.html?highlight=html%20reports

Avoid Sharing State
-------------------

Fresh browser per test
----------------------

Start each test from a clean known state.  Ideally spin up a new
virtual machine for each test.  If spinning up a new virtual machine
is not practical, at least start a new WebDriver for each test.  For
Firefox, start a WebDriver with your known profile.

Java example

```java
FirefoxProfile profile = new FirefoxProfile(new File("pathToFirefoxProfile"));
WebDriver driver = new FirefoxDriver(profile);
```

### Unique test accounts
