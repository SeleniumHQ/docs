---
title: "Clavier"
weight: 10
---

{{% notice info %}}
<i class="fas fa-language"></i> Page being translated from 
English to French. Do you speak French? Help us to translate
it by sending us pull requests!
{{% /notice %}}

Represents a KeyBoard event. KeyBoard actions are performed by using low-level
interface which allows us to provide virtualized device input to the web browser.

## sendKeys

The sendKeys types a key sequence in DOM element even if modifier key sequence is encountered.

{{< code-tab >}}
  {{< code-panel language="java" >}}
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class HelloSelenium {
    public static void main(String[] args) {
        WebDriver driver = new ChromeDriver();
        try {
            // Navigate to Url
            driver.get("https://google.com");

            // Enter text "webDriver" and perform keyboard action "Enter"
            driver.findElement(By.name("q")).sendKeys("q" + Keys.ENTER);
        } finally {
            driver.quit();
        }
    }
}
  {{< / code-panel >}}
  {{< code-panel language="python" >}}
// We don't have a Python code sample yet -  Help us out and raise a PR
  {{< / code-panel >}}
  {{< code-panel language="csharp" >}}
// We don't have a C# code sample yet -  Help us out and raise a PR
  {{< / code-panel >}}
  {{< code-panel language="ruby" >}}
// We don't have a Ruby code sample yet -  Help us out and raise a PR
  {{< / code-panel >}}
  {{< code-panel language="javascript" >}}
const {Builder, By, Key} = require('selenium-webdriver');

(async function example() {
    let driver = await new Builder().forBrowser('chrome').build();

    try {
        // Navigate to Url
        await driver.get('https://www.google.com');

        // Enter text "webdriver" and perform keyboard action "Enter"
        await driver.findElement(By.name('q')).sendKeys('webdriver', Key.ENTER);
    }
    finally {
        await driver.quit();
    }
})();
  {{< / code-panel >}}
{{< / code-tab >}}