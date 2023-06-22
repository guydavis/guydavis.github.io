---
layout: post
title: Gigahorse Fees
subtitle: unexpected costs
date: 2023-06-22
background: /img/headers/two_jack_lake_paddlers.jpg
comments: true
published: true
---

So back at the [start of the year](/2023/02/20/gigahorse/), I added support for the [Gigahorse](https://github.com/madMAx43v3r/chia-gigahorse/tree/master) closed-source GPU farmer of the [Chia blockchain](https://github.com/Chia-Network/chia-blockchain).  While GPU-supported plotting and farming was an interesting enhancement to the Chia ecosystem, I was less than enthused by the Gigahorse offering.  Therefore, I generated a grand total of 2 Gigahorse-proprietary plots, simply for testing the new support in Machinaris.

<img src="/img/posts/gigahorse-fees-machinaris.png" class="img-fluid" />

My biggest concerns with Gigahorse included:
1. The closed source binaries approach.  While understandable due to the developer fee, I always prefer open source software where I can get it.
1. The single Gigahorse developer.  Despite Madmax coding circles around the entire "Chia Network Inc" (CNI) development group, it was clear that he was [single point of failure](https://en.wikipedia.org/wiki/Bus_factor) for Gigahorse.

# Dev Fees

After apparently negotiating with CNI for months, eventually the Gigahorse developer chose to implement a set of dev fees to get paid for his work.  Fair enough, as his work was at least 6 months in ahead of what CNI was able to do themselves.  As shown in the screenshot of his Github README, the dev fee should be capped at just over 3%.

<img src="/img/posts/gigahorse-fees.png" class="img-fluid" />

However, a keyword above is "**on average**" as the fee is collected by grabbing entire block rewards occassionally, averging out to the percentages above.  One user on Reddit [reported hitting a stretch](https://www.reddit.com/r/chia/comments/14b4fuf/gigahorse_gpu_farming_fees_currently_17/) where they encountered a much higher fee rate, closer to 17%. 

<img src="/img/posts/gigahorse-fees-thread.png" class="img-fluid" />

Basically, the fee is being collected probabilistically, which no doubt does average out to the ~3% quoted by the developer, across all users over time.  However, one can understand the frustration of a particular user experiencing higher than average fee collections.

# Conclusion

So, clearly one needs to be mindful of the *average* keyword in the statement about fees.  As someone who dabbles in crypto tech, not a business-oriented farmer, I was not interested in buying GPUs solely for this project.  I am quite glad to have kept my setup simpler, despite forgoing the possibility of earning a few extra dollars from my hobby farm.

### More in this series...
* [Chia on Unraid](/2021/04/30/unraid-chia-plotting-farming/) - Chia CLI on Unraid with Docker
* [Machinaris](/2021/05/21/unraid-chia-machinaris/) - a new WebUI for Chia on Unraid
* [Distributed Farming](/2021/06/29/machinaris-distributed/) - Machinaris on many worker systems
* [Chia Tools](/2021/09/04/chia-tools/) - open-source Chia projects
* [Chia Forks](/2021/10/13/chia-forks/) - running forks of Chia with Machinaris
* [MMX Blockchain](/2021/12/31/mmx-blockchain/) - MMX blockchain on Machinaris
* [MMX on GPUs](/2022/02/09/mmx-gpu/) - Farming MMX with a GPU
* [Gigahorse](/2023/02/20/gigahorse/) - Farming Chia with a GPU
