Selenium Grid
=============
[NOTE] - http://docs.seleniumhq.org/docs/07_selenium_grid.jsp is a good starting point as most of the basic ideas are discussed here. We need to find out the original author so we can give proper credit.

Selenium Grid is a server that allows tests to use web browser instances running on remote machines. With Selenium Grid, one server acts as the hub. Tests contact the hub to obtain access to browser instances. The hub has a list of servers that provide access to browser instances (WebDriver nodes), and lets tests use these instances. Selenium Grid allows to run tests in parallel on multiple machines, and to manage different browser versions and browser configurations centrally (instead of in each individual test).

Why Grid?
---------

* Vision of Grid

* Pros of Using Grid
  * scale by distributing tests on several machines ( parallel execution )
  * manage multiple environments from a central point, making it easy to run the tests against a vast combination of browsers / OS.
  * minimize the maintenance time for the grid by allowing you to implement custom hooks to leverage virtual infrastructure for instance.

* Cons of Using Grid




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

#### Quick Start

This example will show you how to start the Selenium 2 Hub, and register both a WebDriver node and a Selenium 1 RC legacy node. We’ll also show you how to call the grid from Java. The hub and nodes are shown here running on the same machine, but of course you can copy the selenium-server-standalone to multiple machines.

``` Note: The selenium-server-standalone package includes the Hub, WebDriver, and legacy RC needed to run the grid. Ant is not required anymore. You can download the selenium-server-standalone-*.jar from http://code.google.com/p/selenium/downloads/list. This walk-through assumes you already have Java installed. ```

#### Step 1: Start the hub

The Hub is the central point that will receive all the test request and distribute them the the right nodes.

Open a command prompt and navigate to the directory where you copied the selenium-server-standalone file. Type the following command:

```java
java -jar selenium-server-standalone-2.14.0.jar -role hub
```

The hub will automatically start-up using port 4444 by default. To change the default port, you can add the optional parameter -port when you run the command. You can view the status of the hub by opening a browser window and navigating to: http://localhost:4444/grid/console

#### Step 2: Start the nodes

Regardless on whether you want to run a grid with new WebDriver functionality, or a grid with Selenium 1 RC functionality, or both at the same time, you use the same selenium-server-standalone jar file to start the nodes.

```java
java -jar selenium-server-standalone-2.14.0.jar -role node  -hub http://localhost:4444/grid/register
```
```
Note: The port defaults to 5555 if not specified whenever the "-role" option is provided and is not hub.
```
For backwards compatibility "wd" and "rc" roles are still a valid subset of the "node" role. But those roles limit the types of remote connections to their corresponding API, while "node" allows both RC and WebDriver remote connections.


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
