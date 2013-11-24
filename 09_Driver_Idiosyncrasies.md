# Driver Idiosyncrasies

## Shared capabilities

## Driver specific capabilities

### Chromium

Using Capabilities
-------------------
Capabilities are options that you can use to customize and configure a ChromeDriver session.

There are currently two supported ways to pass these capabilities to ChromeDriver:
1. Use the ChromeOptions class (preferred, if available in your language):
You can create an instance of ChromeOptions, which has convenient methods for setting ChromeDriver-specific capabilities. 
You can pass the ChromeOptions object directly into the ChromeDriver constructor:
```java
ChromeOptions options = new ChromeOptions();
options.addExtensions(new File("/path/to/extension.crx"));
ChromeDriver driver = new ChromeDriver(options);
```
Alternatively, you can add the options to an already existing DesiredCapabilities object, which is useful when need to specify other WebDriver capabilities not specific to ChromeDriver.
```java
DesiredCapabilities capabilities = DesiredCapabilities.chrome();
// Add the WebDriver proxy capability.
Proxy proxy = new Proxy();
proxy.setHttpProxy("myhttpproxy:3337");
capabilities.setCapability("proxy", proxy);

// Add ChromeDriver-specific capabilities through ChromeOptions.
ChromeOptions options = new ChromeOptions();
options.addExtensions(new File("/path/to/extension.crx"));
capabilities.setCapability(ChromeOptions.CAPABILITY, options);

ChromeDriver driver = new ChromeDriver(capabilities);
```

2. Use DesiredCapabilities directly:
The ChromeOptions class uses DesiredCapabilities underneath. To use DesiredCapabilities directly, you need to know the name of the capability and the type of value it takes. See the full list further below.

```java
DesiredCapabilities capabilities = DesiredCapabilities.chrome();
capabilities.setCapability("chrome.binary", "/usr/lib/chromium-browser/chromium-browser");
WebDriver driver = new ChromeDriver(capabilities);
```
* Common use cases:
	* Use custom profile
	By default chrome driver will run in a new temporary anonymous profile, there will be cases when you would want to run tests chrome driver using specific browser setting. 
	In those cases we can tell chrome driver to execute tests using a custom user profile.  If the latter, you can use the 'user-data-dir' Chrome command-line switch to tell Chrome which profile to use:
	```java
	ChromeOptions options = new ChromeOptions();
	options.addArguments("user-data-dir=/path/to/your/custom/profile");
	```
	* Start chrome Maximized
	```java
	ChromeOptions options = new ChromeOptions();
	options.addArguments("start-maximized");
	```
	* Using a Chrome executable in a non-standard location
	If the chrome browser is not installed in the default path, then you could specify the custom path where your chrome is installed and it shall be give as ,
	```java
	ChromeOptions options = new ChromeOptions();
	options.setBinary("/path/to/other/chrome/binary");
	```
<b>List of recognized capabilities</b>
	* [proxy](http://code.google.com/p/selenium/wiki/DesiredCapabilities#Proxy_JSON_Object)
	* [loggingPrefs](http://code.google.com/p/selenium/wiki/DesiredCapabilities#JSON_object)
This is a list of all the Chrome-specific desired capabilities, which all are under the chromeOptions dictionary. They should be used via the ChromeOptions class.

| Name 		 | Type			  | Default 	| Description |
| -------------- | ---------------------- | ----------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| args		 | list of strings 	  | 		| List of command-line arguments to use when starting Chrome. Arguments with an associated value should be separated by a '=' sign (e.g., ['start-maximized', 'user-data-dir=/tmp/temp_profile']). [See here](http://peter.sh/experiments/chromium-command-line-switches/) for a list of Chrome arguments. 			    |
| binary	 | string		  |		| Path to the Chrome executable to use (on Mac OS X, this should be the actual binary, not just the app. e.g., '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome')																			    |
| extensions 	 | list of strings 	  |		| A list of Chrome extensions to install on startup. Each item in the list should be a base-64 encoded packed Chrome extension (.crx)																								    |
| localState 	 | dictionary	  	  |		| A dictionary with each entry consisting of the name of the preference and its value. These preferences are applied to the Local State file in the user data folder.																				    |
| prefs		 | dictionary	  	  | 		| A dictionary with each entry consisting of the name of the preference and its value. These preferences are only applied to the user profile in use. See the 'Preferences' file in Chrome's user data directory for examples.													    |
| detach	 | boolean		  | false	| If false, Chrome will be quit when ChromeDriver is killed, regardless of whether the session is quit. If true, Chrome will only be quit if the session is quit (or closed). Note, if true, and the session is not quit, ChromeDriver cannot clean up the temporary user data directory that the running Chrome instance is using. |

 Chrome-specific returned capabilities (i.e., what ChromeDriver returns when you create a new session)
 
| Name				| Type		| Description			|
| ----------------------------- | ------------- | ----------------------------- |
| chrome.chromedriverVersion	| String	| version of ChromeDriver 	|

<b>ChromeDriver server command line arguments</b>

These options can be passed when starting the ChromeDriver server process.
	
| Name 			| Default 			| Description 																	|
| --------------------- | ----------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------- |
| http-threads		| 4				| The number of threads to use for handling HTTP requests.											|
| log-path	 	| <no log file, use stderr>	| The path to use for the ChromeDriver server log. Use NUL (windows) or /dev/null (mac/linux) to disable logging.				|
| port			| 9515				| The port that ChromeDriver listens on.													|
| silent		| false				| If true, ChromeDriver will not print starting message to stdio.										|
| verbose		| false				| If true, ChromeDriver will log lots of stuff to stdout/stderr.										|
| url-base		| 				| The URL path prefix to use for all incoming WebDriver REST requests. A prefix and postfix '/' will automatically be appended if not present. 	|


### Firefox

### Internet Explorer

### Opera

### Safari
