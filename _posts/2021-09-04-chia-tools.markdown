---
layout: post
title: Chia Tools
subtitle: open source projects
date: 2021-09-04
background: /img/headers/chester_lake.jpg
comments: true
published: true
---

My original goal with [Machinaris](/2021/05/21/unraid-chia-machinaris/) was to create a cohesive platform of Chia farming, plotting, and monitoring tools, all behind an effective WebUI.  When I first tried to get Chia farming on Unraid, I found a challenging set of tool integrations, installations, and configurations... all to run Chia on a single computer at the CLI.  

So, once I had gone thru this process, I decided to include these utilities into pre-configured and tuned cohesive unit that could be deployed across many different operating-systems.  By deploying with a Docker image, much of this setup and configuration headache is avoided.

Two of the key utilities that I built Machinaris upon were Plotman and Chiadog.

# Plotman

Plotman is a command-line plotting manager for controlling the Chia plotter to create plot files. Due to [my contribution](https://github.com/ericaltendorf/plotman/pull/797), Plotman was extended to support the [Madmax plotter](https://github.com/madMAx43v3r/chia-plotter), making the old Chia plotter irrelevant.  

My enhanced Plotman is [available on Github](https://github.com/guydavis/plotman/tree/development) and included with every Machinaris Docker image.

# Chiadog

Chiadog is a command-line monitoring tool which parses the log file from Chia farmers and harvesters, checking for problems.  I have [contributed support](https://github.com/martomi/chiadog/pull/302) for monitoring of other blockchains, including Chives. Hopefully this will be useful for others in the community.

My enhanced Chiadog is [available on Github](https://github.com/guydavis/chiadog/tree/dev) and included with every Machinaris Docker image.

# Conclusion

Both Plotman and Chiadog are excellent tools in the Chia eco-system.  Hopefully they will continue to be developed and supported in the future.  As key components of Machinaris, I will do my best to ensure they continue on.

### More in this series...
* [Chia on Unraid](/2021/04/30/unraid-chia-plotting-farming/) - Chia CLI on Unraid with Docker
* [Machinaris](/2021/05/21/unraid-chia-machinaris/) - a new WebUI for Chia on Unraid
* [Distributed Farming](/2021/06/29/machinaris-distributed/) - Machinaris on many worker systems
* [Chia Forks](/2021/10/13/chia-forks/) - running forks of Chia with Machinaris
* [MMX Blockchain](/2021/12/31/mmx-blockchain/) - MMX blockchain on Machinaris