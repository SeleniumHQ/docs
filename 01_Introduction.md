Introduction
============

The Selenium Project and Tools
------------------------------
### Selenium controls web browsers

Used primarily for testing, it allows users to simulate common activities performed by end-users: entering text into fields, selecting drop-down values and checking boxes, and clicking links. It also provides many other controls (mouse movements, Javascript execution, etc), which will be addressed later in this guide.

Imagine a bank of computers in your server room, data center, or even in the cloud, all firing up browsers at the same time, hitting your site's links, forms, and tables, testing your application 24 hours a day. Through a simple, unified programming interface (supporting many of the most important and frequently-used languages), these tests will run tirelessly in parallel, reporting back to you when errors occurred.

#### That is the promise of Selenium. With no licensing fees

One of the project's guiding principles is to **support a common interface for all (major) browser technologies**. Web Browsers are incredibly complex, highly engineered applications, performing their operations in completely different ways, but which frequently look the same while doing so. Even though the text is rendered in the same fonts, the images are displayed in the same place, and the links take you to the same destination, what is happening underneath is as different as night and day. Selenium "abstracts" these differences, hiding their details and intricacies from the person writing the code. This allows you to write several lines of code to perform a complicated workflow, but these same lines will execute on Firefox, Internet Explorer, Chrome, and all other supported browsers.

#### Selenium is the backbone of test organizations the world over

Many of the most important companies in the world have adopted Selenium for their browser-based testing, often replacing years-long efforts involving other, non-open source tools. As it has grown in popularity, so have its requirements and challenges multiplied.

As the web becomes more complicated and new technologies are added to sites around the world, it is the mission of this project to keep up with them where possible. Being an Open Source project, this support is provided through the generous donation of time from many volunteers, every one of which has a "day job". Another mission of the project is to encourage more volunteers and build a strong community, so that the project can continue to keep up with emerging technologies and remain the dominant platform for test automation.


Functional Test Automation Basics
---------------------------------
### I need to test my application. Now what??!

First, start by asking yourself whether or not you really need to use a browser. Odds are good that, at some point, if you're working on a complex web application, you will need to open a browser and actually test it.

Once you have made the determination that you're in the web browser testing business, and you have your Selenium environment ready to begin writing tests, you will generally perform some combination of 3 steps:

* Set up the data
* Perform a discrete set of actions
* Evaluate the results

You will want to keep these steps as short as possible--one to two operations should be enough much of the time. Browser automation has the reputation of being "flaky", but in reality that is because users frequently demand too much of it.

By keeping your tests short, and by using the web browser only when you have absolutely no
alternative, you can have **many tests, with minimal flake**.

### Let's start with an example:

Larry has written a web site which allows users to order their own custom unicorns.

The general workflow (what we'll call the "happy path") is something like this: 

* Create an account
* Configure their unicorn
* Add her to the shopping cart
* Check out and pay
* Give feedback about their unicorn

It would be tempting to write one grand Selenium script to perform all these operations--many will try. **Resist the temptation!** Doing so will result in a test that a) takes a long time, b) will be subject to some common issues around page rendering timing issues, and c) if it fails, will not give you a concise, "glanceable" method for diagnosing what went wrong.

The preferred strategy for testing this scenario would be to break it down to a series of independent, speedy tests, each of which has one "reason" to exist.

Let's pretend you want to test the second step: configuring your unicorn. It will perform the following actions:

* Create an account
* Configure a unicorn

Note that we're skipping the rest of these steps--we will test the rest of the workflow in other **small, discrete test cases**, after we're done with this one.

To start off, you need to create an account. Here you have some choices to make:

* Do you want to use an existing account?
* Do you want to create a new account?
* Are there any special properties of such a user that need to be taken into account before configuration begins?

Regardless of how you answer this question, the solution is to make it part of the "Set up the data" portion of the test--if Larry has exposed an API which enables you (or anyone) to create and update user accounts, be sure to use that to answer this question--if possible, you want to launch the browser only after you have a user "in hand", whose credentials you can just log in with.

If each test for each workflow begins with the creation of a user account, many seconds will be added to the execution of each test. Calling an API and talking to a database are quick, "headless" operations, that don't require the expensive process of opening a browser, navigating to the right pages, clicking and waiting for the forms to be submitted, etc.

Ideally, you can address this set-up phase in one line of code, which will execute before any browser is launched:

```java

	//Create a user who has read-only permissions--they can configure a unicorn, but they do not have payment 
	// information set up, nor do they have administrative privileges.
	// At the time the user is created, its email address and password are randomly generated--you don't even need to know them
	User user = UserFactory.createCommonUser(); //This method is defined elsewhere

	//Log in as this user
	// Logging in on this site takes you to your personal "My Account" page, so the AccountPage object
	// is returned by the loginAs method, allowing you to then perform actions from the AccountPage
    AccountPage accountPage = loginAs(user.getEmail(), user.getPassword());
    
```

As you can imagine, the UserFactory can be extended to provide methods such as "createAdminUser()", and "createUserWithPayment()". The point is, these two lines of code do not distract you from the ultimate purpose of this test: configuring a unicorn. 

The intricacies of the Page Object model will be discussed in later chapters, but we will introduce the concept here:

Your tests should be composed of actions, performed from the user's point of view, within the context of pages in the site. These pages are stored as objects, which will contain specific information about how the web page is composed and how actions are performed--very little of which should concern you as a tester.

What kind of unicorn do you want? You might want pink, but not necessarily. Purple has been quite popular lately. Does she need sunglasses? Star tattoos? These choices, while difficult, are your primary concern as a tester--you need to ensure that your order fulfillment center sends out the right unicorn to the right person, and that starts with these choices.

Notice that nowhere in that paragraph do we talk about buttons, fields, drop-downs, radio buttons, or web forms. __Neither should your tests!__ You want to write your code like the user trying to solve their problem. Here is one way of doing this (continuing from the previous example):

```java
	//The Unicorn is a top-level Object--it has attributes, which are set here. This only stores the values, it does not
	// fill out any web forms or interact with the browser in any way
	Unicorn sparkles = new Unicorn("Sparkles", UnicornColors.PURPLE, UnicornAccessories.SUNGLASSES, UnicornAdornments.STAR_TATTOOS);

	//Since we're already "on" the account page, we have to use it to get to the actual
	// place where you configure unicorns. Calling the "Add Unicorn" method takes us there
	AddUnicornPage addUnicornPage = accountPage.addUnicorn();

	//Now that we're on the AddUnicornPage, we will pass the "sparkles" object to its createUnicorn() method. This method will
	// take Sparkles' attributes, fill out the form, and click submit
	UnicornConfirmationPage unicornConfirmationPage= addUnicornPage.createUnicorn(sparkles);
```

Now that you've configured your unicorn, you need to move on to step 3: making sure it actually worked.

```java
	//The exists() method from UnicornConfirmationPage will take the Sparkles object--a specification of the attributes
	// you want to see, and compare them with the fields on the page
	Assert.assertTrue("Sparkles should have been created, with all attributes intact", unicornConfirmationPage.exists(sparkles);
```

Note that the tester still hasn't done anything but talk about unicorns in this code--no buttons, no locators, no browser controls. This method of "modelling" the application allows you to keep these test-level commands in place and unchanging, even if Larry decides next week that he no longer likes Ruby-on-Rails and decides to re-implement the entire site in the latest Haskell bindings with a Fortran front-end.

Your Page Objects will require some small maintenance in order to conform to the site redesign, but these tests will remain the same. Taking this basic design, you will want to keep going through your workflows with the fewest browser-facing steps possible. Your next workflow will involve adding a unicorn to the shopping cart. You will probably want many iterations of this test in order to make sure the cart is keeping its state properly: are there more than one unicorns in the cart before you start? How many can fit in the shopping cart? If you create more than one with the same name and/or features, will it break? Will it only keep the existing one or will it add another?

Each time you move through the workflow, you want to try to avoid having to create an account, login as the user, and configure the unicorn. Ideally you'll be able to create and account and pre-configure a unicorn via the API or database. Then all you have to do is log in as the user, locate Sparkles, and add her to the cart.

About These Docs
----------------
These docs, like the code itself, are maintained 100% by volunteers within the Selenium
community. Many have been using it since its inception, but many more have only been using
it for a short while, and have given their time to help improve the on-boarding experience
for new users.

If there is an issue with the documentation, we want to know! The best way to communicate an
issue is to visit https://code.google.com/p/selenium/issues/list and search to see whether or
not the issue has been filed already. If not, feel free to open one!

Many members of the community frequent the #selenium irc channel at irc.freenode.net. Feel free
to drop in and ask questions--and if you get help which you think could be of use within these
documents, be sure to add your contribution! We can update these documents, but it's much easier
for everyone when we get contributions from outside the normal committers.
