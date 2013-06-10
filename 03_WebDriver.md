WebDriver
=========

Different Drivers and Requirements
----------------------------------
You can use any languages that are supported by the selenium team to write you code. You can use any testing frameworks like junit / testng to write your tests. This code example uses testng to 
write tests.

To instantiate a driver in java you have to -



<!-- #codeExamples -->



''' java

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.Test;
import java.util.concurrent.TimeUnit;


public class test{

    private WebDriver driver;

    @BeforeClass
    public void setUp() throws Exception {
        DesiredCapabilities capabillities = DesiredCapabilities.firefox();
        capabillities.setCapability("version", "21");
        //Instantiate the firefox driver
        driver = new FirefoxDriver();
        // Set the wait
        driver.manage().timeouts().implicitlyWait(45, TimeUnit.SECONDS);
    }

    // You can also swap with the driver with chromedriver or IEDriver. For requirements on chromedriver see the requirements section.
    @Test
    public void Test() throws Exception
    {
        //Open your site
        driver.get("http://docs.seleniumhq.org/");
        // add more code here
    }

    @AfterClass
    //Quit the driver
    public void tearDown() throws Exception {
        driver.quit();
    }

}


'''
<!-- #codeExamples -->

Browser Launching and Manipulation
----------------------------------
<!-- #codeExamples -->
<!-- Remember to cover profile and extensions here -->

Waits (implicit & explicit)
---------------------------
<!-- #codeExamples -->

Support Classes
---------------
<!-- #codeExamples -->

HTTP Proxies
------------
<!-- #codeExamples -->
