---
title: "Page object models"
weight: 1
---

{{% notice info %}}
<i class="fas fa-language"></i> 页面需要从英语翻译为简体中文。
您熟悉英语与简体中文吗？帮助我们翻译它，通过 pull requests 给我们！
如果您对 GitHub 不熟悉，亦可将翻译内容通过邮箱 <liushilive@outlook.com> 传递给我来提交，感谢您的参与！
{{% /notice %}}

Page Object is a Design Pattern which has become popular in test
automation for enhancing test maintenance and reducing code
duplication. A page object is an object-oriented class that serves as
an interface to a page of your AUT. The tests then use the methods of
this page object class whenever they need to interact with that page
of the UI. The benefit is that if the UI changes for the page, the
tests themselves don’t need to change; only the code within the page
object needs to change. Subsequently, all changes to support that new
UI are located in one place.

The Page Object Design Pattern provides the following advantage:
there is clean separation between test code and page specific code
such as locators (or their use if you’re using a UI map) and layout.


## Page object methods should return a value

* If you submit a page and are redirected,
  it should return the new page object.
* If you click submit on login
  and you want to check to see if a user is logged in,
  it should return True or False in a method.