---
layout: post
title: Forktools
subtitle: cli utilities
date: 2021-11-21
header-img: img/headers/murder_of_crows_smoky_day.jpg
comments: true
published: true
---

As a quick follow-up to my addition last month of [Chia fork support]({{ site.url }}/2021/10/13/chia_forks/) in Machinaris, I learned of a set of command-line utilities named [Forktools](https://github.com/Qwinn1/forktools).  Seems some farmers are using these tools to monitor multiple blockchains running side-by-side on the same system.  

I've incorporated these utilities into the startup of each Machinaris container to apply patches for resource usage and logging.  We'll see if additional use-cases present as the Machinaris community tries them out.

### More in this series...
* [Chia on Unraid]({{site.url}}/2021/04/30/unraid-chia-plotting-farming/) - Chia CLI on Unraid with Docker
* [Machinaris]({{site.url}}/2021/05/21/unraid-chia-machinaris/) - a new WebUI for Chia on Unraid
* [Distributed Farming]({{site.url}}/2021/06/29/machinaris-distributed/) - Machinaris on many worker systems
* [Chia Tools]({{site.url}}/2021/09/04/chia-tools/) - open-source Chia projects
* [Chia Forks]({{site.url}}/2021/10/13/chia-forks/) - running forks of Chia with Machinaris
* [MMX Blockchain]({{site.url}}/2021/12/31/mmx-blockchain/) - MMX blockchain on Machinaris
* [MMX on GPUs]({{site.url}}/2022/02/09/mmx-gpu/) - Enabling GPU support for MMX in Machinaris