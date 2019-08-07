---
title: "File downloads"
weight: 2
---

{{% notice info %}}
<i class="fas fa-language"></i> 页面需要从英语翻译为简体中文。
您熟悉英语与简体中文吗？帮助我们翻译它，通过 pull requests 给我们！
如果您对 GitHub 不熟悉，亦可将翻译内容通过邮箱 <liushilive@outlook.com> 传递给我来提交，感谢您的参与！
{{% /notice %}}

Whilst it is possible to start a download
by clicking a link with a browser under Selenium's control,
the API does not expose download progress,
making it less than ideal for testing downloaded files.
This is because downloading files is not considered an important aspect
of emulating user interaction with the web platform.
Instead, find the link using Selenium
(and any required cookies)
and pass it to a HTTP request library like
[libcurl](//curl.haxx.se/libcurl/).