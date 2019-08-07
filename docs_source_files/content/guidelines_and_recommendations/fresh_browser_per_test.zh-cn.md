---
title: "Fresh browser per test"
weight: 9
---

{{% notice info %}}
<i class="fas fa-language"></i> 页面需要从英语翻译为简体中文。
您熟悉英语与简体中文吗？帮助我们翻译它，通过 pull requests 给我们！
如果您对 GitHub 不熟悉，亦可将翻译内容通过邮箱 <liushilive@outlook.com> 传递给我来提交，感谢您的参与！
{{% /notice %}}

Start each test from a clean known state.
Ideally, spin up a new virtual machine for each test.
If spinning up a new virtual machine is not practical,
at least start a new WebDriver for each test.
For Firefox, start a WebDriver with your known profile.

```java
FirefoxProfile profile = new FirefoxProfile(new File("pathToFirefoxProfile"));
WebDriver driver = new FirefoxDriver(profile);
```
