---
title: "Installing Standalone server"
weight: 3
---

{{% notice info %}}
<i class="fas fa-language"></i> 页面需要从英语翻译为简体中文。
您熟悉英语与简体中文吗？帮助我们翻译它，通过 pull requests 给我们！
如果您对 GitHub 不熟悉，亦可将翻译内容通过邮箱 <liushilive@outlook.com> 传递给我来提交，感谢您的参与！
{{% /notice %}}

If you plan to use [Grid]({{< ref "/grid/_index.md" >}}) then you should download the
[selenium-server-standalone JAR](//www.seleniumhq.org/download/) file.
 The _selenium-server-standalone_ jar is never uploaded, but all the components are available via
 [selenium-server](//repo1.maven.org/maven2/org/seleniumhq/selenium/selenium-server/).
 The standalone JAR contains everything, including the remote Selenium server
 and the client-side bindings.
 This means that if you use the selenium-server-standalone jar
 in your project, then you don't have to add selenium-java
 or a browser specific jar.

 ```xml
<dependency>
  <groupId>org.seleniumhq.selenium</groupId>
  <artifactId>selenium-server</artifactId>
  <version>3.X</version>
</dependency>
```