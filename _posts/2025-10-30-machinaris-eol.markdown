---
layout: post
title: Machinaris
subtitle: closing down my project
date: 2025-10-30
background: /img/headers/grinell_glacier_hike1.jpg
comments: true
published: true
---

# A History of a Green Cryptocurrency

Almost four years ago, the [original devloper of BitTorrent](https://en.wikipedia.org/wiki/Bram_Cohen) released a new cryptocurrency named [Chia](https://en.wikipedia.org/wiki/Chia_Network). Unlike the two large cryptocoins at the time (Bitcoin and Ethereum), Chia didn't use the expensive [proof-of-work](https://en.wikipedia.org/wiki/Proof_of_work) approach which needed both in GPU hardware and lots of electricity. Intead Chia used a [proof-of-space](https://en.wikipedia.org/wiki/Proof_of_space) consensus using mostly hard-drive storage.  

Eventually a talented developer in Germany released a [GPU-based enhancement in early 2023](/2023/02/20/gigahorse/), that was simply more competitive than the original design, providing a strong-incentive to start buying new GPU hardware for an improved plot format.  At the time, I was discouraged that the "Green" vision of Chia had been lost.  The CNI group responded by hinting at a new plot format that would return Chia to its original roots one day.  

# My Machinaris Project

As a user of Unraid, when trying to adopt Chia in early 2021, I found there was really no good option.  My [Machinaris project](https://github.com/guydavis/machinaris) was essentially a bundling of various tools and forks that sprouted up around Chia when it first appeared years ago. 

<img src="https://raw.githubusercontent.com/guydavis/machinaris-unraid/master/docs/img/machinaris_home.png" class="img-fluid" /> 

However, with the loss of interest in Chia over the past few years, all those related tools have been dropped by their authors. As well, my own interest in the Chia ecosystem has waned considerably, so as of now, I simply don't want to invest a lot of upcoming time in trying to patch all the various old tools (plotman, chiadog, madmax, gigahorse, bladebit, etc...) that will inevitably break/change when CNI's new plot format finally drops.

## Conclusion

I think this means the end of my [Machinaris](https://github.com/guydavis/machinaris) project. For those that want to continue running Machinaris against the current format plots, using Chia 2.5.X, that should be possible until CNI releases an urgent security fix or some other backwards-incompatible change. Thanks everyone for the support over the years, it's been fun.

### More in this series...
* [Chia on Unraid](/2021/04/30/unraid-chia-plotting-farming/) - Chia CLI on Unraid with Docker
* [Machinaris](/2021/05/21/unraid-chia-machinaris/) - a new WebUI for Chia on Unraid
* [Distributed Farming](/2021/06/29/machinaris-distributed/) - Machinaris on many worker systems
* [Chia Tools](/2021/09/04/chia-tools/) - open-source Chia projects
* [Chia Forks](/2021/10/13/chia-forks/) - running forks of Chia with Machinaris
* [MMX Blockchain](/2021/12/31/mmx-blockchain/) - MMX blockchain on Machinaris
* [MMX on GPUs](/2022/02/09/mmx-gpu/) - Farming MMX with a GPU
* [Gigahorse](/2023/02/20/gigahorse/) - Farming Chia with a GPU
* [Gigahorse Fees](/2023/06/22/gigahorse-fees/) - Pay to play for Chia
* [Chia Layoffs](/2023/10/02/chia_layoffs/) - Chia Network Inc. lays off many developers
