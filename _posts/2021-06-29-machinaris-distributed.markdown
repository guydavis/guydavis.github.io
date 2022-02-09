---
layout: post
title: Distributed Chia
subtitle: chia farming and plotting
date: 2021-06-29
header-img: img/headers/chester_lake_valley2.jpg
comments: true
published: true
---

Surprisingly, the [simple WebUI I built](https://github.com/guydavis/machinaris) for Chia plotting and farming has become [quite popular](https://forums.unraid.net/topic/108896-support-machinaris-chia-cryptocurrency-farming-plotman-plotting-unraid-webui/).  I think there was a real need for an all-in-one setup with an accessible WebUI.  While Chia is an interesting cryptocurrency, it is notoriously finicky to setup and run well with effective monitoring.

My initial software release last month, offered a standalone install:

![Standalone]({{ site.url }}/img/posts/machinaris_standalone.png)

However, as one started to deploy Chia on more systems on their home LAN, the issue of managability and remote control became more challenging.  

To that end, I enhanced Machinaris with a RESTful API that allowed for multiple worker installs to be controlled from a single WebUI:

![Distributed]({{ site.url }}/img/posts/machinaris_workers.png)

![Workers]({{ site.url }}/img/posts/machinaris_workers_view.png)

With many great contributions from users all over the world, Machinaris has really improved this past month:

![Machinaris]({{ site.url }}/img/posts/machinaris_home.png)

The hype surrounding the Chia cryptocurrency has faded since the spring, but I've learned a lot coding Machinaris.  I'll keep at it as I have lots more good ideas to try out...

### More in this series...
* [Chia on Unraid]({{site.url}}/2021/04/30/unraid-chia-plotting-farming/) - Chia CLI on Unraid with Docker
* [Machinaris]({{site.url}}/2021/05/21/unraid-chia-machinaris/) - a new WebUI for Chia on Unraid
* [Chia Tools]({{site.url}}/2021/09/04/chia-tools/) - open-source Chia projects
* [Chia Forks]({{site.url}}/2021/10/13/chia-forks/) - running forks of Chia with Machinaris
* [MMX Blockchain]({{site.url}}/2021/12/31/mmx-blockchain/) - MMX blockchain on Machinaris
* [MMX on GPUs]({{site.url}}/2022/02/09/mmx-gpu/) - Enabling GPU support for MMX in Machinaris