Remote WebDriver
================

You can use Remote webdriver the same way you would use webdriver locally. The primary difference is that
remote webdriver needs to be configured so that it can run your tests on a seperate machine.


Getting Started

First we need to connect to remote webdriver. We do this by pointing the url to the address of the 
server running our tests. In order to customize our configuration, we set desired capabilities.
Below is an example of instantiating a remote webdriver object pointing to our remote web server, 
www.example.com, running our tests on Firefox.


```ruby
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :remote, :url => "http://www.example.com", :desired_capabilities => :firefox
driver.get "http://www.google.com"
driver.close
```

To further customize our test configuration we can add additional desired capabilities.


Desired Capabilities
--------------------


Local File Detector
-------------------
<!-- #codeExamples -->
