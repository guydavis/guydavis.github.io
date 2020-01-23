---
layout: post
title: Home Network Upgrade
subtitle: deploying unifi gear
date: 2019-11-19
header-img: img/headers/lillian_lake.jpg
comments: true
published: true
---

After nearly a decade of dependable service from three Asus NT-R12 wifi access points (APs) running a dd-wrt firmware, I figured an upgrade was in order.  In particular, the old Asus router was limited to 100 Mbps, so an upgrade to 1 Gbps was overdue. 

After looking at options, I selected equipment from [Unifi](https://www.ui.com/) including a [router](https://ca.store.ui.com/collections/routing-switching/products/unifi-dream-machine), switch, and a few access points. Unifi offered a powerful set of features for a home user including isolated VLANs and multiple SSIDs, all running at Gigabit speeds within the house.

## Router and Controller

The Unifi controller software was the primary deciding factor for me.  The dashboard provides a good status overview:

![Dashboard]({{ site.url }}/img/posts/home_network_upgrade_unifi_thruput.png)

and tracks throughput and latency over time:

![Throughput]({{ site.url }}/img/posts/home_network_upgrade_unifi_status.png)

In terms of setup and configuration, it was pretty simple, though I did need to make a couple of changes:

1. Disable Auto Optimize -> Critical to have Google Home equipment multi-cast correctly.
2. Disable Smart Queues for WAN Network -> Allows Internet speed tests to report correctly, but only recommended for home users where QoS is not critical.

As our house contains aluminum in the flooring (heat transfer), I wanted multiple APs throughout for a strong 5 GHz signal.  One nice feature in the controller software is map layout, where one can import a floor plan, drag APs and visualize projected signals strength.

![Upper Floor]({{ site.url }}/img/posts/home_network_upgrade_upper_flr.png)

## Internet Connection

Once my two-year term with the local cable provider expired, I found myself paying too much for a 300 Mbps connection.  I switched over to a [subsiduary offering 150 Mbps](https://www.freedommobile.ca/en-CA/home-internet) for a third the price.  Given my old router had limited speeds into the house to 100 Mbps anyway, I saw no need to pay way even more for Gigabit fiber.

Even at only 150 Mbps, we haven't had any complaints about speed, despite regular concurrent usage each evening including:
* HD video streaming from Youtube, Netflix and Amazon.
* Game streaming from Google Stadia and Nvidia GeforceNOW.
* VPN usage, both personal and work connections.
* Plex streaming to friends and family.
* VOIP phones and security camera streaming.

# Conclusions
Overall, I've been pleasantly surprised with the improved network features and wifi speeds from this upgrade.  I'm looking forward to [trying out the security features soon]({{ site.url }}/2020/01/22/home_-network_security/).
