---
title: "Guidelines and recommendations"
menuTitle: "Guidelines"
chapter: true
weight: 7
---

{{% notice info %}}
<i class="fas fa-language"></i> 页面需要从英语翻译为简体中文。
您熟悉英语与简体中文吗？帮助我们翻译它，通过 pull requests 给我们！
如果您对 GitHub 不熟悉，亦可将翻译内容通过邮箱 <liushilive@outlook.com> 传递给我来提交，感谢您的参与！
{{% /notice %}}

# Guidelines and recommendations

A note on "Best Practices": We've intentionally avoided the phrase "Best
Practices" in this documentation. No one approach works for all situations.
We prefer the idea of "Guidelines and Recommendations." We encourage
you to read through these and thoughtfully decide what approaches
will work for you in your particular environment.

Functional testing is difficult to get right for many reasons.
As if application state, complexity, and dependencies don't make testing difficult enough,
dealing with browsers (especially with cross-browser incompatibilities)
makes writing good tests a challenge.

Selenium provides tools to make functional user interaction easier,
but doesn't help you write well-architected test suites.
In this chapter we offer advice, guidelines, and recommendations.
on how to approach functional web page automation.

This chapter records software design patterns popular
amongst many of the users of Selenium
that have proven successful over the years.