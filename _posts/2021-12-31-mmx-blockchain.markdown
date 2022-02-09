---
layout: post
title: MMX
subtitle: a new blockchain
date: 2021-12-31
header-img: img/headers/glenmore_reservoir_pano.jpg
comments: true
published: true
---

<img src="{{ site.url }}/img/posts/mmx_madmax_road.jpg" class="img-responsive" style="margin-left:10px; float:right"/>

Following up my earlier article on the blossoming of many [Chia forks]({{site.url}}/2021/10/04/chia-forks/), a new proof-of-space-and-time (PoST) blockchain was announced this month.  [MMX](https://github.com/madMAx43v3r/mmx-node) is from the [developer](https://github.com/madMAx43v3r) of the popular Madmax [Chia Plotter](https://github.com/madMAx43v3r/chia-plotter) which revolutionized plotting last summer.

# Why MMX?

So given that Chia is the predominant PoST blockchain currently, one might wonder why a brand-new blockchain is interesting? Well, as I am a developer who has worked with the Chia blockchain services inside Docker containers for many months now, supporting all the various issues that users encounter, trying to tune resource usage down, I can attest that the Chia blockchain (particularly the API/CLI services I use) has room for improvement.

As just one data point, running a Chia node routinely consumes between 3 to 6 GB of memory.  MMX on the other had rarely breaks 1 GB in my experience.  While I understand that the Chia developers are targetting larger farmers with newer powerful hardware, this is a wide discrepancy.  

As well, though I understand that a blockchain is very complicated beast on multiple platforms, I have been stunned at the diversity of issues faced by users.  The worst of which is the repeated blockchain corruption that often required a full database re-sync taking days for many users.

# MMX Summary

From Github, the main features of MMX are as follows:

* High performance (1000 transactions per second or more)
* Variable supply (block reward scales with netspace, but also is capped by TX fees)
* Consistent block times (every 10 seconds a block is created)
* Native token support (swaps are possible with standard transactions)
* Energy saving Proof of Space (same as Chia)
* Standard ECDSA signatures for seamless integration (same as Bitcoin)

# Conclusion

While I am still a big booster of Chia, particularly as compared to proof-of-work cryptos such as Bitcoin and Ethereum, I am happy to see truly new development of other PoST blockchains.  The true measure of any software project is its community however.  Applies to Chia, to Machinaris, and will apply to MMX as well.  We'll see how much uptake it has and how well it innovates with improvements users want.

### More in this series...
* [Chia on Unraid]({{site.url}}/2021/04/30/unraid-chia-plotting-farming/) - Chia CLI on Unraid with Docker
* [Machinaris]({{site.url}}/2021/05/21/unraid-chia-machinaris/) - a new WebUI for Chia on Unraid
* [Distributed Farming]({{site.url}}/2021/06/29/machinaris-distributed/) - Machinaris on many worker systems
* [Chia Tools]({{site.url}}/2021/09/04/chia-tools/) - open-source Chia projects
* [Chia Forks]({{site.url}}/2021/10/13/chia-forks/) - running forks of Chia with Machinaris
* [MMX on GPUs]({{site.url}}/2022/02/09/mmx-gpu/) - Enabling GPU support for MMX in Machinaris