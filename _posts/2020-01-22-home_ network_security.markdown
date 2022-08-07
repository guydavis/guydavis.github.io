---
layout: post
title: Network Security
subtitle: home upgrade continued
date: 2020-01-22
background: /img/headers/icefields4.jpg
comments: true
published: true
---

After I upgraded to a [Unifi home network](/2019/11/19/home_-network_upgrade/) last year for improved performance, I eventually found some time to try out the security features offered in the new Unifi Dream Machine [security gateway](https://ca.store.ui.com/collections/routing-switching/products/unifi-dream-machine).

## Threat Management

Enabling the built-in intrusion detection system (IDS) activates traffic monitoring for security threats, handling speeds up to 850 Mbps. Notifiations of attemtped intrusions can be seen in the dashboard:

<img src="/img/posts/home_network_security_unifi_notifications.png" class="img-fluid" />

The rules are configurable and cover:

<img src="/img/posts/home_network_security_ids.png" class="img-fluid" />

## Deep Packet Inspection

The gateway is also able to fingerprint each client device on the network.  Here's a phone:

<img src="/img/posts/home_network_security_fingerprint.png" class="img-fluid" />

And here's the DPI analysis of the same phone's traffic patterns:

<img src="/img/posts/home_network_security_dpi.png" class="img-fluid" />

## Network Segmentation

Using VLANs, I was able to segment the network between our basement suite, IoT devices, and guest access.  Very configurable as I can continue serving Plex downstairs to the suite, while isolating all other systems and ports from our tenants.

<img src="/img/posts/home_network_security_vlans.png" class="img-fluid" />

## VPN Server

Secure remote access to the home network is another great feature.  I've used this already to connect in while on vacation.  The L2TP server is very easy to setup and connect to from any Windows (or similar) system.

The Unifi controller software also allows remote management via an account secured with two-factor authentication. 

## Honey Pot

The security gateway can serve up a honey pot on LAN networks to record any local clients that are performing unusual network scans.  Very helpful for monitoring whether any systems on the LAN have been compromised by malware and are trying to gain further internal access.

<img src="/img/posts/home_network_security_honeypot.png" class="img-fluid" />

# Conclusions

Overall, the security features of the Unifi Dream Machine are compelling, despite the silly product name.  I fully expect to handle the next decade with this new Unifi equipment providing a secure and performant home network.
