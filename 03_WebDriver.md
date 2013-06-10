WebDriver
=========

Different Drivers and Requirements
----------------------------------
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
<!-- #codeExamples -->

Support Classes
---------------
<!-- #codeExamples -->

HTTP Proxies
------------
<!-- #codeExamples -->
