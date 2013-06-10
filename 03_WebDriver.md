WebDriver
=========

Different Drivers and Requirements
----------------------------------
Selenium WebDriver works with a variety of browsers, such as Firefox, Chrome, Internet Explorer, Safari, and Opera. WebDriver drives the browser directly using the browser’s built in support for automation.

### Firefox

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

Browser Launching and Manipulation
----------------------------------
<!-- #codeExamples -->
<!-- Remember to cover profile and extensions here -->

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



Support Classes
---------------
<!-- #codeExamples -->

HTTP Proxies
------------
<!-- #codeExamples -->
