Selenium Grid
=============
[NOTE] - http://docs.seleniumhq.org/docs/07_selenium_grid.jsp is a good starting point as most of the basic ideas are discussed here. We need to find out the original author so we can give proper credit.

Selenium Grid is a server that allows tests to use web browser instances running on remote machines. With Selenium Grid, one server acts as the hub. Tests contact the hub to obtain access to browser instances. The hub has a list of servers that provide access to browser instances (WebDriver nodes), and lets tests use these instances. Selenium Grid allows to run tests in parallel on multiple machines, and to manage different browser versions and browser configurations centrally (instead of in each individual test).

Why Grid?
---------

* Vision of Grid

* Pros of Using Grid

* Cons of Using Grid

* Alternatives to Selenium Grid
 - http://saucelabs.com

<!-- Parallelization and Multiple Environments -->

What is a Hub and Node?
-----------------------

* Hub
	* Hub is a central point from where your tests will be kicked off.
	* There will be only one Hub in a grid and it is launched from a system.

* Node
	* Nodes are the different selenium instances that will execute your tests in a distributed manner.
	* There can be many nodes in a grid.
	* The machines which are nodes need not to be the same platform as that of hub.


Setting Up Your Own
-------------------

* Operating Systems
      * Mac OSX
      * Linux
      * Windows

* Execution Using Shell Scripts

* Running in a Continuous Integration Environment
      * Bamboo
      * Jenkins


Configuration
-------------


Maintaining
-----------
