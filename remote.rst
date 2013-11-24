Remote WebDriver
================

You can use Remote webdriver the same way you would use webdriver
locally. The primary difference is that remote webdriver needs to be
configured so that it can run your tests on a seperate machine.

The RemoteWebDriver is composed of two pieces: a client and a
server. The client is your WebDriver test and the server is simply a
Java servlet, which can be hosted in any modern JEE app server.

The RemoteWebDriver Server
===========================

The server will always run on the machine with the browser you want to
test. There are two ways to user the server: command line or
configured in code.

Starting the Server from The Command Line
------------------------------------------

Once you have downloaded selenium-server-standalone-{VERSION}.jar
place it on the computer with the browser you want to test. Then from
the directory with the jar run the following

```
java -jar selenium-server-standalone-{VERSION}.jar
```

Considerations when running server
-----------------------------------

The caller is expected to terminate each session properly, calling
either Selenium#stop() or WebDriver#quit.

The selenium-server keeps in-memory logs for each ongoing session,
which are cleared when Selenium#stop() or WebDriver#quit is called. If
you forget to terminate these sessions your server may leak memory. If
you keep extremely long-running sessions you will probably need to
stop/quit every now and then (or increase memory with -Xmx jvm option)

Timeouts (from version 2.21)
----------------------------

The server has two different timeouts, which can be set as follows:

```
java -jar selenium-server-standalone-{VERSION}.jar -timeout=20 -browserTimeout=60
```

  * browserTimeout: Controls how long the browser is allowed to hang
    (value in seconds)
  * timeout: Controls how long the client is is allowed to be gone
    before the session is reclaimed (value in seconds)
  * System property: "selenium.server.session.timeout" is no longer
    supported as of 2.21.

Please note that the "browserTimeout" is intended as a backup timeout
mechanism when the ordinary timeout mechanism fails, which should be
used mostly in grid/server environments to ensure that crashed/lost
processes do not stay around for too long, polluting the runtime
environment.

Configuring the Server in Code
------------------------------

In theory, the process is as simple as mapping the "DriverServlet" to
a URL, but it's also possible to host the page in a lightweight
container, such as Jetty configured entirely in code. Steps to do this
follow.

Download the "selenium-server.zip" and unpack. Put the JARs on the
CLASSPATH Create a new class called "AppServer". Here, I'm using
Jetty, so you'll need to download that as well:

.. code-block:: java

   import org.mortbay.jetty.Connector;
   import org.mortbay.jetty.Server;
   import org.mortbay.jetty.nio.SelectChannelConnector;
   import org.mortbay.jetty.security.SslSocketConnector;
   import org.mortbay.jetty.webapp.WebAppContext;

   import javax.servlet.Servlet;
   import java.io.File;

   import org.openqa.selenium.remote.server.DriverServlet;

   public class AppServer {
     private Server server = new Server();

     public AppServer() throws Exception {
       WebAppContext context = new WebAppContext();
       context.setContextPath("");
       context.setWar(new File("."));
       server.addHandler(context);

       context.addServlet(DriverServlet.class, "/wd/*");

       SelectChannelConnector connector = new SelectChannelConnector();
       connector.setPort(3001);
       server.addConnector(connector);

       server.start();
     }
   }

Running RemoteWebDriver Client
===============================

First we need to connect to remote webdriver. We do this by pointing
the url to the address of the server running our tests. In order to
customize our configuration, we set desired capabilities.  Below is an
example of instantiating a remote webdriver object pointing to our
remote web server, www.example.com, running our tests on Firefox.

.. code-block:: ruby

   require 'selenium-webdriver'

   driver = Selenium::WebDriver.for :remote, :url => "http://www.example.com", :desired_capabilities => :firefox
   driver.get "http://www.google.com"
   driver.close

To further customize our test configuration we can add additional
desired capabilities.

Desired Capabilities
--------------------

Desired capabilities can be expanded further. All RemoteWebdriver
capabilities are sent through JsonWireProtocol. For a list of
configurable capabilities, and more information on JsonWireProtocol,
please visit the documentation here:
https://code.google.com/p/selenium/wiki/DesiredCapabilities

For example, suppose you wanted to run chrome on Windows XP, using
Chrome version 27

.. code-block:: ruby

   caps = Selenium::WebDriver::Remote::Capabilities.chrome
   caps.platform = Windows XP
   caps.version = 27

   driver = Selenium::WebDriver.for :remote, :url => "http://www.example.com", :desired_capabilities => caps

Local File Detector
-------------------

The Local File Detector allows the transfer of files from the client
machine to the remote server.  For example if a test needs to upload a
file to a web application, RemoteWebDriver can automatically transfer
the file from the local machine to the remote web server during
runtime. This allows the file to be uploaded from the remote machine
running the test. It is not enabled by default and can be enabled in
the following way:

.. code-block:: java

   driver.setFileDetector(new LocalFileDetector());

.. code-block:: ruby

   @driver.file_detector = lambda do |args|
     # args => ["/path/to/file"]
     str = args.first.to_s
     str if File.exist?(str)
   end

Once the above code is defined, you can upload a file in your test in
the following way:

.. code-block:: java

   driver.get("http://sso.dev.saucelabs.com/test/guinea-file-upload");
   WebElement upload = driver.findElement(By.id("myfile"));
   upload.sendKeys("/Users/sso/the/local/path/to/darkbulb.jpg");

.. code-block:: ruby

   @driver.navigate.to "http://sso.dev.saucelabs.com/test/guinea-file-upload"
   element = @driver.find_element(:id, 'myfile')
   element.send_keys "/Users/sso/SauceLabs/sauce/hostess/maitred/maitred/public/images/darkbulb.jpg"
