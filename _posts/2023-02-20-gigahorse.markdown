---
layout: post
title: Gigahorse
subtitle: chia goes pow
date: 2023-02-20
background: /img/headers/jura_creek.jpg
comments: true
published: true
---

<img src="/img/posts/mmx_madmax_road.jpg" class="img-fluid" style="margin-left:10px; float:right"/>

On my Machinaris cryptocurrency platform, I have added support for [Gigahorse](https://github.com/madMAx43v3r/chia-gigahorse), which is a new GPU-based plotter and farmer for the Chia blockchain.  From the developer that released the Madmax plotter and his own [MMX blockchian](/2022/02/09/mmx-gpu), this new software is a closed-source alternative to the official Chia software that offers more plots per disk, increasing a farmer's chances of finding a block on the network.  

By adding GPU hardware into the mix, an arms race has been created in the Chia ecosystem that will push small farmers out, much like happened for blockchains like Bitcoin and Ethereum before it.

# Chia goes PoW!

Not really proof-of-work of course. However, Chia was originally envisaged as a storage-based blockchain that used free space on hard drives, requiring no additional hardware for farmers to get started.  In particular, outside of tuning for your hardware's electrical efficiency and buying cheap used disks, there was basically an even playing field for small and large farmers.

However, with the introduction of Gigahorse, a hint of the old Bitcoin/Ethereum proof-of-work model requiring GPU acceleration has arrived in the Chia ecosystem.  It is undeniable that those farmers with a spare Nvidia GPU (or two) will benefit from Gigahorse's improved efficiency over the standard Chia model.  By running a supported GPU, Gigahorse farmers can expose more Chia plots to the network, using a smaller amount of disk space.  This advantage translates into a higher probability of block wins and increased pool payouts, as compared to someone farming un-compressed Chia plots.

<img src="/img/posts/gigahorse_compression.png" class="img-fluid" />

As the table above shows, as "compression" of the plot file goes up, more GPU power is required to farm it during each blockchain challenge, however the plot file itself gets smaller and smaller, allowing more plots to be held on a given amount of disk space.

# Is this Madmax's Fault?

Absolutely not.  Given the ability to throw additional hardware at a computing problem in pursuit of profits, the incentive meant this addition of GPU plotting/farming was inevitable for the Chia ecosystem, despite the [original intent of the designers](https://www.reddit.com/r/chia/comments/nqtc9r/good_guy_bram_cohen_tried_to_warn_the_degenerates/). 

In response, [Chia Network Inc.](http://chia.net) will eventually offer GPU-enabled plotting and farming as well. So, no one is to blame for the situation.  However that does mean that a GPU will be the bare minimum hardware required to be competitive in the Chia farming space.

# Conclusion

With a dedicated GPU now being the admission required for plotting and farming chia in a competitive landscape, one really needs to question whether there is any room left for small farmers, as has been the case for the first 2 years of Chia's existence.  Given the history of the Bitcoin blockchain that eventually required custom-built ASIC hardware to mine, this really shouldn't have come as a surprise.  Needless to say, I am disappointed in what this means for the future of the Chia blockchain and it's [so-called "green" advantage](https://chiapower.org/).

### More in this series...
* [Chia on Unraid](/2021/04/30/unraid-chia-plotting-farming/) - Chia CLI on Unraid with Docker
* [Machinaris](/2021/05/21/unraid-chia-machinaris/) - a new WebUI for Chia on Unraid
* [Distributed Farming](/2021/06/29/machinaris-distributed/) - Machinaris on many worker systems
* [Chia Tools](/2021/09/04/chia-tools/) - open-source Chia projects
* [Chia Forks](/2021/10/13/chia-forks/) - running forks of Chia with Machinaris
* [MMX Blockchain](/2021/12/31/mmx-blockchain/) - MMX blockchain on Machinaris
* [MMX on GPUs](/2022/02/09/mmx-gpu/) - Farming MMX with a GPU
