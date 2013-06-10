Worst Practices
===============

Captchas
--------

File Download Support
---------------------

HTTP Response Codes
-------------------

GMAIL and Facebook Logins
-------------------------

Performance Testing
-------------------
Performance testing using Selenium and WebDriver is generally not advised. Not because it is incapable but because it is not optimised for the job and this you are unlikely to get good results.

It may seem ideal to performance test in the context of the user but a suite of WebDriver tests are subjected to lots of points of external fragility which is beyond your control; for example Browser startup speed, speed of HTTP servers, response of 3rd party servers that host Javascript or CSS. Variation at these points will cause variation in your results. It is very difficult to separate the difference between the performance of your website and the performance of external resources. As WebDriver is only an API you will need to develop this reporting yourself.

The other potential attraction is 'saving time' - performing functional and performance tests at the same time. However functional and performance tests have opposing objectives. To test functionality a test may need to be patient and wait for loading but this will cloud the performance testing results and vice versa.

To improve the performance of your website you will need to be able to analyse overall performance independent of environment differences, identify poor code practices, breakdown of performance of individual resources (ie css or javascript) in order to know what to improve. There are performance testing tools available that can do this job, provide reporting and analysis and even make improvement suggestions.

Example (open source) packages to use are: 
Jmeter 
?
