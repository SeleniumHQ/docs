---
title: "WebDriver"
chapter: true
weight: 5
---

{{% notice info %}}
<i class="fas fa-language"></i> 页面需要从英语翻译为简体中文。
您熟悉英语与简体中文吗？帮助我们翻译它，通过 pull requests 给我们！
如果您对 GitHub 不熟悉，亦可将翻译内容通过邮箱 <liushilive@outlook.com> 传递给我来提交，感谢您的参与！
{{% /notice %}}

# WebDriver

The biggest change in Selenium recently
has been the inclusion of the WebDriver API.
Driving a browser natively as a user would either locally
or on a remote machine using the Selenium server,
it marks a leap forward in terms of browser automation.

Selenium WebDriver fits in the same role as RC did,
and has incorporated the original 1.x bindings.
It refers to both the language bindings
and the implementations of the individual browser controlling code.
This is commonly referred to as just _WebDriver_
or sometimes as _Selenium 2_.

Selenium 1.0 + WebDriver = Selenium 2.0

* WebDriver is designed in a simpler
  and more concise programming interface
  along with addressing some limitations in the Selenium-RC API.

* WebDriver is a compact object-oriented API
  when compared to Selenium 1.0.

* It drives the browser much more effectively
  and overcomes the limitations of Selenium 1
  that affected our functional test coverage,
  like the file upload or download, pop-ups, and dialogs barrier.

* WebDriver overcomes the limitation of Selenium RC's
  [single-host origin policy](//en.wikipedia.org/wiki/Same-origin_policy).
