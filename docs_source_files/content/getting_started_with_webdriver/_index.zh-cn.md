---
title: "Getting started with WebDriver"
chapter: true
weight: 4
---

{{% notice info %}}
<i class="fas fa-language"></i> 页面需要从英语翻译为简体中文。
您熟悉英语与简体中文吗？帮助我们翻译它，通过 pull requests 给我们！
如果您对 GitHub 不熟悉，亦可将翻译内容通过邮箱 <liushilive@outlook.com> 传递给我来提交，感谢您的参与！
{{% /notice %}}

# Getting started with WebDriver

Selenium supports automation of all the major browsers in the market
through the use of _WebDriver_.
WebDriver is an API and protocol that defines a language-neutral interface
for controlling the behaviour of web browsers.
Each browser is backed by a specific WebDriver implementation, called a *driver*.
The driver is the component responsible for delegating down to the browser,
and handles communication to and from Selenium and the browser.

This separation is part of a conscious effort to have browser vendors
take responsibility for the implementation for their browsers.
Selenium makes use of these third party drivers where possible,
but also provides its own drivers maintained by the project
for the cases when this is not a reality.

The Selenium framework ties all of these pieces together
through a user-facing interface that enables the different browser backends
to be used transparently,
enabling cross-browser and cross-platform automation.

More details about drivers can be found in
[Driver Idiosyncrasies]({{< ref "/driver_idiosyncrasies/_index.md" >}}).