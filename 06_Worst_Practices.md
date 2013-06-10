Worst Practices
===============

Captchas
--------
CAPTCHA - "Completely Automated Public Turing test to tell Computers and Humans Apart"

CAPTCHAs are explicitly designed to prevent automations, so don't try! There are 2 primary strategies to get around them:
* disable CAPTCHAs on your test environments 
* get the developers to add a hook to allow you bypass the CAPTCHA 

File Download Support
---------------------

HTTP Response Codes
-------------------
For some browser configurations in Selenium RC, Selenium acted as a proxy between the 
browser and the site being automated. This meant that all browser traffic passed through
Selenium, and could be captured or manipulated. The captureNetworkTraffic() method purported
to capture all of the network traffic between the browser and the site being automated,
including HTTP response codes.

Selenium WebDriver is a completely different approach to browser automation, preferring to 
act more like a user. This solves some of the fundamental problems inherent in the Selenium
RC approach. However, since much of the actual driving of the browser is now done externally
to the browser itself, creating a method similar to captureNetworkTraffic() is difficult at
best, and impossible at worst, particularly without a proxy in between the browser and the
site being automated.

The solution to capturing HTTP status codes is to replicate the behavior of Selenium RC by
actually using a proxy. The WebDriver API provides the ability to set a proxy for the browser,
and there are a number of proxies that programmatically allow you to manipulate the contents
of requests sent to and received from the web server. Using a proxy lets you decide how you
want to respond to redirection response codes. Additionally, not every browser makes the 
response codes available to WebDriver, so opting to use a proxy allows you to have a solution
that works for every browser.

Gmail, email and Facebook Logins
-------------------------
For multiple reasons logging into sites like Gmail and Facebook using WebDriver is not recommended. Aside from being against the usage terms for these sites (where you risk having the account shut down), it is slow and unreliable. Not what we want where test stability is important.

The ideal practice is to use the APIs that email providers offer, or in the case of facebook the developer tools service which exposes an API for creating test accounts, friends and so forth. Although using an API might seem like a bit extra hard work you will be paid back in speed, reliabilty and stability. The API is also unlikely to change whereas webpages and HTML locators change often and require you to update your test framework.

Logging in to 3rd-party sites using WebDriver at any point of your test increases the risk of your test failing because it makes your test longer. A general rule of thumb is that longer tests are more fragile and unreliable.

Performance Testing
-------------------
Performance testing using Selenium and WebDriver is generally not advised. Not because it is incapable but because it is not optimised for the job and this you are unlikely to get good results.

It may seem ideal to performance test in the context of the user but a suite of WebDriver tests are subjected to lots of points of external fragility which is beyond your control; for example Browser startup speed, speed of HTTP servers, response of 3rd party servers that host Javascript or CSS. Variation at these points will cause variation in your results. It is very difficult to separate the difference between the performance of your website and the performance of external resources. As WebDriver is only an API you will need to develop this reporting yourself.

The other potential attraction is 'saving time' - performing functional and performance tests at the same time. However functional and performance tests have opposing objectives. To test functionality a test may need to be patient and wait for loading but this will cloud the performance testing results and vice versa.

To improve the performance of your website you will need to be able to analyse overall performance independent of environment differences, identify poor code practices, breakdown of performance of individual resources (ie css or javascript) in order to know what to improve. There are performance testing tools available that can do this job, provide reporting and analysis and even make improvement suggestions.

Example (open source) packages to use are: 
Jmeter 
?
