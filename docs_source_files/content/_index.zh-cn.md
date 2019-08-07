---
title: "Selenium 浏览器自动化项目"
---

{{% notice info %}}
<i class="fas fa-language"></i> 页面需要从英语翻译为简体中文。
您熟悉英语与简体中文吗？帮助我们翻译它，通过 pull requests 给我们！
如果您对 GitHub 不熟悉，亦可将翻译内容通过邮箱 <liushilive@outlook.com> 传递给我来提交，感谢您的参与！
{{% /notice %}}

# The Selenium Browser Automation Project

Selenium is an umbrella project for a range of tools and libraries
that enable and support the automation of web browsers.

It provides extensions to emulate user interaction with browsers,
a distribution server for scaling browser allocation,
and the infrastructure for implementations of the
[W3C WebDriver specification](//www.w3.org/TR/webdriver/)
that lets you write interchangeable code for all major web browsers.

This project is made possible by volunteer contributors
who have put in thousands of hours of their own time,
and made the source code [freely available](attr.md#license)
for anyone to use, enjoy, and improve.

Selenium brings together browser vendors, engineers, and enthusiasts
to further an open discussion around automation of the web platform.
The project organises [an annual conference](//seleniumconf.com/)
to teach and nurture the community.

At the core of Selenium is _[WebDriver]({{< ref "/webdriver/_index.md" >}})_,
an interface to write instruction sets that can be run interchangeably in many
browsers. Here is one of the simplest instructions you can make:

{{< code-tab >}}
  {{< code-panel language="java" >}}
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.WebDriverWait;

import static org.openqa.selenium.support.ui.ExpectedConditions.presenceOfElementLocated;

public class HelloSelenium {

    public static void main(String[] args) {
        WebDriver driver = new FirefoxDriver();
        WebDriverWait wait = new WebDriverWait(driver, 10);
        try {
            driver.get("https://google.com/ncr");
            driver.findElement(By.name("q")).sendKeys("cheese" + Keys.ENTER);
            WebElement firstResult = wait.until(presenceOfElementLocated(By.cssSelector("h3>a")));
            System.out.println(firstResult.getText());
        } finally {
            driver.quit();
        }
    }
}
  {{< / code-panel >}}
  {{< code-panel language="python" >}}
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support.expected_conditions import presence_of_element_located

# This example requires Selenium WebDriver 3.13 or newer

with webdriver.Firefox() as driver:
    wait = WebDriverWait(driver, 10)
    driver.get("https://google.com/ncr")
    driver.find_element_by_name("q").send_keys("cheese" + Keys.RETURN)
    first_result = wait.until(presence_of_element_located((By.CSS_SELECTOR, "h3>a")))
    print(first_result.text)
  {{< / code-panel >}}
  {{< code-panel language="csharp" >}}
using System;
using OpenQA.Selenium;
using OpenQA.Selenium.Firefox;
using OpenQA.Selenium.Support.UI;
using SeleniumExtras.WaitHelpers;

class HelloSelenium
{
    static void Main()
    {
        using (IWebDriver driver = new FirefoxDriver())
        {
            WebDriverWait wait = new WebDriverWait(driver, TimeSpan.FromSeconds(10));
            driver.Navigate().GoToUrl("https://www.google.com/ncr");
            driver.FindElement(By.Name("q")).SendKeys("cheese" + Keys.Enter);
            IWebElement firstResult = wait.Until(ExpectedConditions.ElementExists(By.CssSelector("h3>a")));
            Console.WriteLine(firstResult.Text);
        }
    }
}
  {{< / code-panel >}}
  {{< code-panel language="ruby" >}}
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox
wait = Selenium::WebDriver::Wait.new(timeout: 10)

begin
  driver.get 'https://google.com/ncr'
  driver.find_element(name: 'q').send_keys 'cheese', :return
  first_result = wait.until { driver.find_element(css: 'h3>a') }
  puts first_result.text
ensure
  driver.quit
end
  {{< / code-panel >}}
  {{< code-panel language="javascript" >}}
const {Builder, By, Key, until} = require('selenium-webdriver');

(async function example() {
    let driver = await new Builder().forBrowser('firefox').build();
    try {
        await driver.get('https://www.google.com/ncr');
        await driver.findElement(By.name('q')).sendKeys('cheese', Key.RETURN);
        let firstResult = await driver.wait(until.elementLocated(By.css('h3>a')),10000);
        console.log(await firstResult.getText());
    } finally {
        await driver.quit();
    }
})();
  {{< / code-panel >}}
{{< / code-tab >}}

See the _[Quick Tour]({{< ref "/getting_started/quick.zh-cn.md" >}})_ for a full explanation
of what goes on behind the scenes when you run this code.
You should continue on to the [narrative documentation]({{< ref "/introduction/_index.md" >}})
to understand how you can [install]({{< ref "/selenium_installation/_index.md" >}}) and
successfully use Selenium as a test automation tool,
and scaling simple tests like this to run
in large, distributed environments on multiple browsers,
on several different operating systems.

## Getting started

If you are new to Selenium,
we have a few resources that can help you
get up to speed right away.

* [Quick tour]({{< ref "/getting_started/quick.zh-cn.md" >}})
  * [WebDriver]({{< ref "/getting_started/quick.zh-cn.md#webdriver" >}})
  * [Remote Control]({{< ref "/getting_started/quick.zh-cn.md#remote-control" >}})
  * [IDE]({{< ref "/getting_started/quick.zh-cn.md#ide" >}})
  * [Grid]({{< ref "/getting_started/quick.zh-cn.md#grid" >}})
  * [HTML Runner]({{< ref "/getting_started/quick.zh-cn.md#html-runner" >}})
