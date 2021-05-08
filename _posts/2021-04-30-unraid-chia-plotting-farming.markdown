---
layout: post
title: Chia on Unraid
subtitle: plotting and farming
date: 2021-04-30
header-img: img/headers/maligne_lake7.jpg
comments: true
published: true
---

A new cryptocurrency appeared this month.  Unlike Bitcoin and Ethereum which operate on [Proof of Work](https://en.wikipedia.org/wiki/Proof_of_work#:~:text=Proof%20of%20work%20(PoW)%20is,minimal%20effort%20on%20their%20part.), the [Chia](https://www.chia.net/) blockchain operates on [Proof of Space and Time](https://en.wikipedia.org/wiki/Proof_of_space#:~:text=A%20proof%20of%20space%2Dtime,which%20that%20capacity%20is%20used.).  

Instead of ongoing GPU/ASIC-mining using quite a bit of [electricity](https://www.forbes.com/sites/lawrencewintermeyer/2021/03/10/bitcoins-energy-consumption-is-a-highly-charged-debate--whos-right/?sh=3b9fe6047e78), Chia relies upon unused hard disk space.  Having recently built an [Unraid]({{ site.url }}/2021/01/30/unraid-server-setup) server, I had about 14 TB free to try Chia by following this [useful guide](https://www.reddit.com/r/chia/comments/mupslc/docker_setup_and_working_on_unraid_guide/).

Like other cryptocurrencies, Chia coins ([XCH](https://www.coinbase.com/price/chia-network)) are minted on a decentralized [blockchain](https://en.wikipedia.org/wiki/Blockchain).  Coins are distributed to participants of the netspace (worldwide Chia storage) in proportion to the number of plots they each contribute on their disks.  Basically, each plot is a reusable worldwide lottery ticket to *possibly* win a pair of coins as a farming reward from the 64 chia minted worldwide every 10 minutes.

# Plotting

A plot is a collection of hashes held on your disks.  Each plot is about 100 GB in size and takes about 12 hours generate in a CPU & disk intensive manner.  

![Plots]({{ site.url }}/img/posts/unraid_chia_greenplots.png)

The generation of the plot performs about 1.6 TB writes to your disk, which makes a fast temporary drive a key component of a plotting machine.

## Plotting Slowly

Initially, I tried plotting on my Unraid system with lots of memory and slowish CPUs cores, using my old hard-drives as temporary space.  As Unraid, excluding cache, does not prioritize writes I knew it would be slow, but I wanted to find how bad.  

This first plot took 29 hours.  Thus I learned my first lesson of Chia, to plot fast you must use SSD for temporary plotting space and use your hard drives for farming the finished plots.

I considered using the Unraid cache pool I use for application such as Plex metadata.  

![Cache]({{ site.url }}/img/posts/unraid_chia_cachedrive.png)

However, I rejected that for two reasons:
1. My little cache pool offers only 240 GB, enough for apps like Plex, but not enough to hold the ~270 GB of temp files used in creating each plot.
2. The ~1.6 TB of writes for each plot to a consumer SSD device will [burn through its usable lifetime](https://github.com/Chia-Network/chia-blockchain/wiki/SSD-Endurance), much faster than I wanted for my Chia side project.



## Plotting Faster

While there are many fast consumer NVME M.2 SSD drives, they often don't handle sustained writes (hours) or very high data amounts (TBW).  Built to speed gaming sessions at home, a consummer SSD just isn't well suited to plotting Chia. Instead, enterprise and data-centre SSDs which offer much more in terms of sustained writes and lifetime endurance are the way to go for Chia temporary plotting drives.  

My goal was to use my existing hardware, not incurring much new cost, for this Chia experiment.  So, I searched my [local computer stores](https://www.memoryexpress.com/) and picked up the last cheap "enterprise" SSD drive in the city. 

![SSD]({{ site.url }}/img/posts/unraid_chia_nytro_ssd.jpg)

Not particularly fast, the Seagate Nytro offers pretty good lifetime endurance of [3,580 TBW](https://www.seagate.com/files/www-content/datasheets/pdfs/nytro-1351-1551-sata-ssdDS1992-4-1907US-en_CA.pdf).  I got the 480 GB size which is enough to allow for two plots in parallel with time-staggering.

After adding the drive, I left it as an unassigned device to be used directly, not tied to either the main array or cache pool:

![Unassigned]({{ site.url }}/img/posts/unraid_chia_unassigned_drives.png)

A quick test plot using the Nytro SSD as temporary storage showed I could now generate 2 plots every 12 hours, so about 4 plots a day.  Much better than my previous attempts, but not a world-record by any means.  However, I could leave this running 24/7 in the background, plotting away quietly in the basement.

## Plotting Fast

Generating a plot in under 6 hours is pretty quick, while a slow system can take more than a day per plot as I demonstrated above.  As well, with more powerful CPUs, lots of memory, and most-importantly TBs of fast enterprise SSD for temporary plotting space, it's possible to get tens, even hundreds, of plots created a day.  In fact, there are rumors of "whales" out there in the netspace, with huge plotting capacities generating many thousands of plots each day, saved to many petabytes of storage.

At this rate, I'll plot my available space in just over a month.  In that time, Chia netspace will go from petabytes to many exabytes, so I suspect my chan

I have no intention of spending much money on more parts, particularly during the current [drive shortage](https://www.extremetech.com/computing/322261-crypto-manipulation-is-causing-a-short-term-storage-shortage).  However, with 2/3 of my Unraid system sitting empty, this seemed an fun experiment. 

# Farming

Once the plots have been generated, the distributed Chia protocol "farms" them to other peers in perpetuity, using [very little electricity](https://chiapower.org/).  Substantially less than used to mine Bitcoin and Ethereum each day.

Many times each day, a challenge is issued to all Chia farmers online.  The Chia software running on my Unraid server, first performs a cursory check of all my plot filenames to see I have any which *might* win that round.  If any pass the first filter, the hard drive retrieves the required parts of the plot file to determine if I win that round of the Chia farming reward, namely two chia coins.  Only one farmer in the world will two coins each round, every 20 seconds or so. 

In the grand scheme of things, my 4 plots a day, which should fill my ~14 TB of free space, makes me a very small fish in the ocean.  Here's a handy guide:
* Petabytes of plots -> you're a "whale".
* Hundreds of terabytes -> you're a farmer.
* Tens of terabytes -> you're gardener.
* Handful of terabytes -> you're urban gardening on your apartment balcony.  

![Gardener]({{ site.url }}/img/posts/unraid_chia_urban_gardener.jpg)

# Conclusion

Honestly, the latter is where I am content to be for now.  Definitely won't get rich quick, but my experiments with Chia are more for fun than profit.  As the [ChiaCalculator](https://chiacalculator.com/) shows, I'll rapidly be left behind if I stop plotting in a month at only 14 TB, however it *likely* won't make sense to keep buying drives for more space unless the price of XCH stays high.

![Calculator]({{ site.url }}/img/posts/unraid_chia_calculator.png)

It will be interesting to see how the Chia platform develops over time, particularly given the history of Bitcoin and Ethereum.  Meanwhile, I'll be quietly farming away...

### More in this series...
* [Unraid Server Setup]({{ site.url }}/2021/01/30/unraid-server-setup) - media and storage
* [Unraid GPU Passthrough]({{ site.url }}/2021/02/unraid-gpu-passthru) - failed attempt
* [Unraid Urbackup]({{ site.url }}/2021/03/15/unraid-urbackup) - household backups
