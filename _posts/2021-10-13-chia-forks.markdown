---
layout: post
title: Chia Forks
subtitle: farming many blockchains
date: 2021-10-13
header-img: img/headers/chester_lake_valley1.jpg
comments: true
published: true
---

After successfully enhancing my Machinaris web application to support distributed workers on multiple machines, I realized that adoption would be dependant upon growing the eco-system of crypto use-cases supported.  This meant supporting the farming of more than just the Chia blockchain, but other forks of the Chia blockchain as well.

As an open-source project, the Chia blockchain has been forked by [numerous other groups](https://alltheblocks.net/) since its launch.  This has provided a number of alternative proof-of-space-and-time (PoST) blockchains for Chia farmers to farm their Chia plot files.

As each blockchain runs isolated in its own container, each is available as in the Unraid Community Apps, and also via the [Machinaris launch wizard](https://www.machinaris.app).

![Forks]({{ site.url }}/img/posts/chia_forks_machinaris_unraid.png)

So, now the Workers page lists each container, running on each system for each blockchain.

![Workers]({{ site.url }}/img/posts/chia_forks_machinaris_workers.png)

Support for additional blockchains is being added regularly, as voted on by the Machinaris community.

### More in this series...
* [Chia on Unraid]({{site.url}}/2021/04/30/unraid-chia-plotting-farming/) - Chia CLI on Unraid with Docker
* [Machinaris]({{site.url}}/2021/05/21/unraid-chia-machinaris/) - a new WebUI for Chia on Unraid
* [Distributed Farming]({{site.url}}/2021/06/29/machinaris-distributed/) - Machinaris on many worker systems
* [Chia Tools]({{site.url}}/2021/09/04/chia-tools/) - open-source Chia projects
* [MMX Blockchain]({{site.url}}/2021/12/31/mmx-blockchain/) - MMX blockchain on Machinaris
* [MMX on GPUs]({{site.url}}/2022/02/09/mmx-gpu/) - Enabling GPU support for MMX in Machinaris