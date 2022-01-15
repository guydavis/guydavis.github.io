---
layout: post
title: Machinaris
subtitle: a new webui for chia
date: 2021-05-21
header-img: img/headers/blueberry_hill.jpg
comments: true
published: true
---

After discovering a new [cryptocurrency last month]({{site.url}}/04/30/unraid-chia-plotting-farming/), I quickly deployed the command-line only Docker image to my Unraid server.  However, while that functioned, its shortcomings were many:

* Without a GUI, running plotting jobs in parallel relied upon many open Console windows, tmux sessions.
* Keeping up-to-date with status, meant manually trolling through various log files.
* Assessing performance was a challenge given the limited insight into the farming and plotting processes.

Looking around, there were useful tools to improve this, however each required installation and configuration themselves, which took time.  I decided to build my own Docker image with these tools, available to other Unraid users.  

* [Chia™](https://www.chia.net/): the distributed cryptocurrency project.
* [Plotman](https://github.com/ericaltendorf/plotman): a parallel plotting manager.
* [Chiadog](https://github.com/martomi/chiadog): a log monitor with alerting.

Building upon the Flask web-server for Python, I tied all these tools together in an easy-to-use package:

![Machinaris]({{ site.url }}/img/posts/unraid_chia_machinaris.png)

As my day-job is exlusively devops backend, it's fun to dabble in front-end coding again.  Not sure where this project will go, but I've submitted Machinaris to the [Unraid repository](https://forums.unraid.net/topic/108896-support-machinaris-chia-cryptocurrency-farming-plotman-plotting-unraid-webui/). As well, some interest has been generated on the [Github project](https://github.com/guydavis/machinaris).

### More in this series...
* [Chia on Unraid]({{site.url}}/2021/04/30/unraid-chia-plotting-farming/) - Chia CLI on Unraid with Docker
* [Machinaris]({{site.url}}/2021/05/21/unraid-chia-machinaris/) - a new WebUI for Chia on Unraid
* [Distributed Farming]({{site.url}}/2021/06/29/machinaris-distributed/) - Machinaris on many worker systems
* [Chia Tools]({{site.url}}/2021/09/04/chia-tools/) - open-source Chia projects
* [Chia Forks]({{site.url}}/2021/10/13/chia-forks/) - running forks of Chia with Machinaris
* [MMX Blockchain]({{site.url}}/2021/12/31/mmx-blockchain/) - MMX blockchain on Machinaris

