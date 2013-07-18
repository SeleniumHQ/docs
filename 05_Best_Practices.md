Best Practices
==============

Functional testing is difficult to get right for many reasons. As if 
application state, complexity, and dependencies don't make testing 
difficult enough, dealing with browsers – and especially cross-browser
incompatibilities – makes writing good tests a challenge.

Selenium provides tools to make functional user interaction easier,
but doesn't help you write well-architected test suites. In this
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

*There is clean separation between test code and page specific code
such as locators (or their use if you’re using a UI map) and layout.*

Rule of Thumb:

#### Page object methods should return a value
* If you submit a page and are redirected, it should return the new
  page object
* If you click submit on login and you want to check to see if a user
  is logged in it should return True or False in a method

Domain Specific Language
-------------------------

A domain specific language (DSL) is a system which provides the user
an expressive means of solving a problem.  It allows a user to
interact with the system on their terms – not just programmer-speak.

Your users, in general, don't care how your site looks.  They don't
care about the decoration or the animations or the graphics.  They
want to use your system to push their new employees through the
process with minimal difficulty.  They want to book travel to Alaska.
They want to configure and buy unicorns at a discount. Your job as the
tester is to come as close as you can to “capturing” this mind-set.
With that in mind, we set about “modeling” the application you're
working on, such that the test scripts (the user's only pre-release
proxy) “speak” for and represent the user.

With Selenium, DSL is usually represented by methods, written to make
the API simple and readable – they enable a repport between the
developers and the stakeholders (users, product owners, business
intelligence specialists, etc.).

#### Benefits

* *Readable*: Business stake holders can understand it.
* *Writable*: Easy to write – avoids unnecessary duplication.
* *Extensible*: Functionality can (reasonably) be added without
   breaking contracts and existing functionality.
* *Maintainable*: By leaving the implementation details out of test
   cases, you are well-insulated against changes to the AUT.

#### Java

Here is an example of a reasonable DSL method in Java.  For brevity's
sake, it assumes the `driver` object is pre-defined and available to
the method.

```java
/**
 * Takes a username and password, fills out the fields, and clicks "login"
 * @returns An instance of the AccountPage
 */
public AccountPage loginAsUser(String username, String password) {
    driver.findElement(By.id("loginField")).clear();
    driver.findElement(By.id("loginField")).sendKeys(testData);

    //Fill out the password field. The locator we're using is "By.id", and we should have it 
    // defined elsewhere in the class
    driver.findElement(By.id("password")).clear();
    driver.findElement(By.id("password")).sendKeys();

    //Click the login button, which happens to have the id "submit"
    driver.findElement(By.id("submit")).click();

    //Create and return a new instance of the AccountPage (via the built-in Selenium PageFactory)
    return PageFactory.newInstance(AccountPage.class);
}
```

This method completely abstracts the concepts of input fields, buttons, clicking, and even pages
from your test code. Using this approach, all your tester has to do is call this method. This gives
you a maintenance advantage: if the login fields ever changed, you would only ever have to change 
this method--not your tests.

```java
public void loginTest() {
    loginAsUser("cbrown", "cl0wn3");

    //now that we're logged in, do some other stuff--since we used a DSL to support our testers, it's 
    // as easy as choosing from available methods
    do.something();
    do.somethingElse();
    Assert.assertTrue("Something should have been done!", something.wasDone();

    //Note that we still haven't referred to a button or web control anywhere in this script...
}
```

It bears repeating: One of your primary goals should be writing an 
API that allows your tests to address *the problem at hand, and NOT 
the problem of the UI*. The UI is a secondary concern for your 
users--they don't care about the UI, they just want to get their job 
done. Your test scripts should read like a laundry list of things 
the user wants to DO, and the things they want to KNOW. The tests 
should not concern themselves with HOW the UI requires you to go 
about it.  

Generating Application State
----------------------------

Selenium should not be used to prepare a test case.  All repetitive
actions, and prepration for a test case should be done through other
methods.  An example, most Web UIs have authentication (e.g., a login 
form).  Eliminating logging in via web browser before every test will 
improve both the speed and stability of the test. A method should be 
created to gain access to the AUT (e.g. using an API to login and set 
cookie inbrowser object).  Also, creating methods to pre-load data for 
testing should not be done using Selenium.  As mentioned previously, 
existing APIs should be leveraged to create data for the AUT.

Mock External Services
----------------------

Eliminating the dependencies on external services will greatly improve
the speed and stability of your tests.

Improved Reporting
------------------

Selenium is not designed to report on the status of test cases
run. Taking advantage of the built-in reporting capabilities of unit
test frameworks is a good start.  Most unit test frameworks have
reports that can generate xUnit or HTML formatted reports.  xUnit
reports are popular for importing results to a Continuous Integration 
(CI) server like Jenkins, Travis, Bamboo, etc.  Here are some links 
for more information regarding report outputs for several languages.

Python:

- nose
  - xUnit: http://nose.readthedocs.org/en/latest/plugins/xunit.html
  - HTML: https://nose.readthedocs.org/en/latest/plugins/cover.html?highlight=html%20reports

Avoid Sharing State
-------------------

Consider Using a Fluent API
-------------------
Martin Fowler coined the term "Fluent API".  You could search the Google search page using a fluent
API call like so:  
```java
    driver.get( "http://www.google.com/webhp?hl=en&tab=ww" );
    GoogleSearchPage gsp = new GoogleSearchPage();
    gsp.get().withFluent().setSearchString().clickSearchButton();
```

Using a code snippet like so:
```java
public class GoogleSearchPage extends LoadableComponent<GoogleSearchPage> {

    public class GSPFluentInterface {
        
        private GoogleSearchPage gsp;

        public GSPFluentInterface(GoogleSearchPage googleSearchPage) {
            gsp = googleSearchPage;
        }

        public GSPFluentInterface clickSearchButton() {
            gsp.searchButton.click();
            return this;
        }

        public GSPFluentInterface setSearchString( String sstr ) {
            clearAndType( gsp.searchField, sstr );
            return this;
        }
        
    }
    
    private GSPFluentInterface gspfi;
    @FindBy(id = "gbqfq") private WebElement searchField;
    @FindBy(id = "gbqfb") private WebElement searchButton;

    public GoogleSearchPage() {
        System.out.println("GoogleSearchPage constructor...");
        gspfi = new GSPFluentInterface( this );
        this.get(); // if load() fails, calls isLoaded() until page is finished loading
        PageFactory.initElements(driver, this); // initialize WebElements on page 
    }
    
    public GSPFluentInterface withFluent() {
        return gspfi;
    }  
    
    public void clickSearchButton() {
        searchButton.click();
    }
    
    public void setSearchString( String sstr ) {
        clearAndType( searchField, sstr );
    }
    
    @Override
    protected void isLoaded() throws Error {      
    	  System.out.println("GoogleSearchPage.isLoaded()...");
        Assert.assertTrue("Google search page is not yet loaded.", isSearchFieldVisible() );
    }

    @Override
    protected void load() {
        System.out.println("GoogleSearchPage.load()...");
        if ( isSFieldPresent ) {
            Wait<WebDriver> wait = new WebDriverWait( driver, 3 );        
            wait.until( visibilityOfElementLocated( By.id("gbqfq") ) ).click();
        }
    }

}
```

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
