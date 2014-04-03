Selenium Grid
========================================================================

Selenium Grid is a smart proxy server that allows Selenium tests to 
route commands to remote web browser instances. With Selenium Grid, one 
server acts as the hub that routes JSON formatted test commands to one 
or more registered Grid nodes. Tests contact the hub to obtain access to 
remote browser instances. The hub has a list of registered servers that 
it provides access to, and allows us to control these instances. Selenium
Grid allows us to run tests in parallel on multiple machines, and to 
manage different browser versions and browser configurations centrally 
(instead of in each individual test).

+---------------------+------------------------------------------------+ 
| Pros of using Grid  | Description                                    | 
+=====================+================================================+ 
| Scale               | Scale by distributing tests on several         | 
|                     | machines using parallel execution.             | 
+---------------------+------------------------------------------------+ 
| Central             | Manage multiple environments from a central    |
|                     | point, making it easy to run the tests against |
|                     | a large combination of browsers and operating  |
|                     | systems.                                       | 
+---------------------+------------------------------------------------+ 
| Minimize            | Minimize the maintenance time for the grid by  |
|                     | allowing you to implement custom hooks to      |
|                     | leverage a virtual infrastructure of           |
|                     | registered nodes.                              |
+---------------------+------------------------------------------------| 
| Cross Platform      | If your tests are running on one particular    |
|                     | platform, by using a node on another platform  |
|                     | you effectively have cross platform testing.   | 
+---------------------+------------------------------------------------+
| Smart               | Grid can route commands to a certain version   |
|                     | of a browser if you have 2 or more nodes       | 
|                     | registered, each pointing to a different       | 
|                     | version of the browser binary.                 | 
+---------------------+------------------------------------------------+

  
Cons of using Grid
------------------------------------------------------------------------

* You have no capabilities for user input if your tests want to prompt for input whereas 
    you would if your tests ran locally.
    
* You also need to maintain the health of other computer systems which run your nodes.

* Third party libraries, like Sikuli, will not work through a Grid because the WebDriver 
    JSON protocol is not able to transport those commands.


What is a Hub and Node?
=======================

* Hub

  * Hub is a central point from where your tests will be kicked off.
  * There will be only one Hub in a grid and it is launched from one
    system.

* Node

  * Nodes are the different selenium instances that will execute your tests in a distributed manner.
  * There can be many nodes in a grid.
  * The machines which are nodes need not to be the same platform as that of hub.

Setting Up Your Own
===================

You could use an online service, such as "Sauce Labs" or "Testing Bot" to run your Grid Nodes, but if you
would rather run your own on your own hardware then see below.

Quick Start
-----------

This example will show you how to start the Selenium 2 Hub, and
register both a WebDriver node and a Selenium 1 RC legacy node. We’ll
also show you how to call the grid from Java. The hub and nodes are
shown here running on the same machine, but of course you can copy the
selenium-server-standalone to multiple machines.

    The selenium-server-standalone package includes the Hub,
    WebDriver, and legacy RC needed to run the grid. Ant is not
    required anymore. You can download the
    selenium-server-standalone-.jar from
    http://code.google.com/p/selenium/downloads/list. This
    walk-through assumes you already have Java installed.

Step 1: Start the Hub
~~~~~~~~~~~~~~~~~~~~~

The Hub is the central point that will receive all the test request and distribute them the the right nodes.

Open a command prompt and navigate to the directory where you copied the selenium-server-standalone
file. Type the following command:

    java -jar selenium-server-standalone-2.14.0.jar -role hub

The hub will automatically start-up using port 4444 by default, among its other defaults. You can view the
status of the hub by opening a browser window and navigating to: http://localhost:4444/grid/console

###### Configuration of Hub with options

To change the default port, you can add the optional parameter -port when you run the command. Also, any
of the other options you see in the JSON config file (below) are possible.

###### Configuration of Hub with JSON

You certainly can get by with only the simple command show above, but if you need more advanced
configuration, then you can specify a JSON format config file to configure the Grid Hub when you
start it.  You can do it like so:

    java -jar %JAR% -role hub -hubConfig hubConfig.json -debug

And here is an example of a hubConfig.json file:

.. code-block:: json

   {"_comment" : "Configuration for Hub - hubConfig.json",
    "host": ip,
    "maxSessions": 5,
    "port": 4444,
    "cleanupCycle": 5000,
    "timeout": 300000,
    "newSessionWaitTimeout": -1,
    "servlets": [],
    "prioritizer": null,
    "capabilityMatcher": "org.openqa.grid.internal.utils.DefaultCapabilityMatcher",
    "throwOnCapabilityNotPresent": true,
    "nodePolling": 180000,
    "platform": "WINDOWS"}

#### Step 2: Start the nodes

Regardless on whether you want to run a grid with new WebDriver functionality, or a grid with
Selenium 1 RC functionality, or both at the same time, you use the same selenium-server-standalone
jar file to start the nodes.

    java -jar selenium-server-standalone-2.14.0.jar -role node -hub http://localhost:4444/grid/register

The port defaults to 5555 if not specified whenever the "-role" option is provided and is not hub.  You
can run multiple Nodes on one machine but if you do so, you need to be aware of your systems memory
resources and problems with screenshots if your tests take them.

###### Configuration of Node with options

For backwards compatibility "wd" and "rc" roles are still a valid subset of the "node" role. But
those roles limit the types of remote connections to their corresponding API, while "node" allows
both RC and WebDriver remote connections.

You can pass JVM "-D" properties to the Java process on the command line as well:
```text
-Dwebdriver.chrome.driver=chromedriver.exe
```

###### Configuration of Node with JSON

You can also start Grid Nodes that are configured with a JSON configuration file.

    java.exe -jar %JAR% -role node -nodeConfig node1Config.json -Dwebdriver.chrome.driver=%CHROMEDRIVER%

And here is an example of a node1Config.json file:

.. code-block:: json

   {"capabilities": [{"browserName": "firefox",
                      "acceptSslCerts": true,
                      "javascriptEnabled": true,
                      "takesScreenshot": false,
                      "firefox_profile": "",
                      "browser-version": "27",
                      "platform": "WINDOWS",
                      "maxInstances": 5,
                      "firefox_binary": "",
                      "cleanSession": true },
                     {"browserName": "chrome",
                      "maxInstances": 5,
                      "platform": "WINDOWS",
                      "webdriver.chrome.driver": "C:/Program Files (x86)/Google/Chrome/Application/chrome.exe" },
                     {"browserName": "internet explorer",
                      "maxInstances": 1,
                      "platform": "WINDOWS",
                      "webdriver.ie.driver": "C:/Program Files (x86)/Internet Explorer/iexplore.exe" }],
    "configuration": {"_comment" : "Configuration for Node",
                      "cleanUpCycle": 2000,
                      "timeout": 30000,
                      "proxy": "org.openqa.grid.selenium.proxy.WebDriverRemoteProxy",
                      "port": 5555,
                      "host": ip,
                      "register": true,
                      "hubPort": 4444,
                      "maxSessions": 5}}

### Support

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



[info added from Grid2 wiki page](https://code.google.com/p/selenium/wiki/Grid2)
