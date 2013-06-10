Best Practices
==============
The following are suggested best practices to using Selenium 2.x+

Page Object Models
------------------
Page Object is a Design Pattern which has become popular in test automation for enhancing test maintenance and reducing code duplication. A page object is an object-oriented class that serves as an interface to a page of your AUT. The tests then use the methods of this page object class whenever they need to interact with that page of the UI. The benefit is that if the UI changes for the page, the tests themselves don’t need to change, only the code within the page object needs to change. Subsequently all changes to support that new UI are located in one place.

The Page Object Design Pattern provides the following advantage:

There is clean separation between test code and page specific code such as locators (or their use if you’re using a UI map) and layout.

Rule of Thumb:
 - Page objects should return a value
   - If you submit a page and are redirected, it should return the new page object
   - If you click submit on login and you want to check to see if a user is logged in it should return True or False in a method


Generating Application State
----------------------------
Selenium should not be used to prepare a test case.  All repetitive actions, and prepration for a test case should be done through
other methods.  An example, most Web UI have authentication(login form).  Eliminating logging via web browser before every test will
improve both the speed and stability of the test. A method should be created to gain access to the AUT(i.e.-using an API to login and set cookie in browser object).
Also, creating methods to pre-load data for testing should not be done using Selenium.  As mentioned previously, existing APIs should be leveraged to 
create data for the AUT.

Mock External Services
----------------------
Eliminating the dependencies on external services will greatly improve the speed and stability on tests.  

Improved Reporting
------------------
Selenium is not designed to report on the status of test cases run. Taking advantage of the built-in reporting capabilities of unit test
frameworks is a good start.  Most unit test frameworks have reports that can generate xUnit or HTML formatted reports.  xUnit reports are popular
for importing results to a Continuous Integration(CI) server like Jenkins, Travis, Bamboo, etc.  Here are some links for more information
regarding report outputs for several languages

Python:
 - nose
  - xUnit: http://nose.readthedocs.org/en/latest/plugins/xunit.html
  - HTML: https://nose.readthedocs.org/en/latest/plugins/cover.html?highlight=html%20reports

Avoid Sharing State
-------------------

Fresh browser per test
----------------------
It is strongly suggested to tear down the browser and start up a new browser session before every test. This will ensure that cache, cookies, etc are cleaned up before a new test is run.

### Unique test accounts
