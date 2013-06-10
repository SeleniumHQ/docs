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

GMAIL and Facebook Logins
-------------------------

Performance Testing
-------------------
