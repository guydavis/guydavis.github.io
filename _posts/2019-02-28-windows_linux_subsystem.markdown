---
layout: post
title: Ubuntu on Windows
subtitle: windows subsytem for linux
date: 2019-02-28
header-img: img/headers/aspen_beach.jpg
comments: true
published: true
---

After using Ubuntu 16.04 on my old laptop for years, I attempted an upgrade to 18.04 which was nearly unusable on my old hardware.  Having recently setup Windows 10 on a [budget gaming PC]({{ site.url }}/2018/11/09/budget_pc_gaming), I instead installed Win 10 Pro onto my old Acer laptop.

However, Windows has not historically been a good platform for developing on, particularly using open-source toolkits.  Luckily, even Microsoft figured this out and announced the [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10) (aka WSL) a couple of years back.

The WSL allows for a reasonably powerful command-line, built upon your preferred Linux.  This allows Windows users to follow along with development trends in machine learning, such as [Fast.ai](https://course.fast.ai/)

## WSL Install

Following these [directions](https://course.fast.ai/terminal_tutorial.html#windows-10) at Fast.ai for WSL setup, I enabled the WSL feature under the Apps and Features control panel, and rebooted.  

![WSL Feature]({{ site.url }}/img/posts/wsl_feature_enable.png)

A few minutes later, I choose Ubuntu from the [Windows Store](https://docs.microsoft.com/en-us/windows/wsl/install-win10) app.  Other distros such as Suse, Kali, and Debian are also available.  After install, a Ubuntu terminal app appeared in my Start menu:

![Ubuntu Start]({{ site.url }}/img/posts/wsl_start_ubuntu.png)

## WSL Usage

After creating a Linux user, I was all set:

![WSL Terminal]({{ site.url }}/img/posts/wsl_terminal.png)

Even trusty old `vim` was installed.  However, by default, useful shortcuts for copy/paste such as the middle mouse button do not work.  Bit dissapointed with that one.

However, it seems a very nice upgrade from [Cygwin](https://www.cygwin.com/) which I used all last decade on Windows.  As well, being a full Ubuntu distro it should be more compatible than other tools like [Git Bash](https://gitforwindows.org/).

## More Resources

* [LifeHacker Tutorial](https://lifehacker.com/how-to-get-started-with-the-windows-subsystem-for-linux-1828952698)
* [WSL Tips and Tricks](https://www.hanselman.com/blog/TheYearOfLinuxOnTheWindowsDesktopWSLTipsAndTricks.aspx)


