---
layout: post
title: Hosting Minecraft
subtitle: server management with amp
date: 2020-06-03
header-img: img/headers/train_dance.jpg
comments: true
published: true
---

When my kid's school was cancelled in mid-March due to the Covid pandemic, we made the best of a bad situation by connecting with friends online instead of in-person, often thru our Discord chat server.  Also, as my boys are both big Minecraft fans, they immediately wanted to get their own game server going to share with their friends.

## Java Server

As we had client licenses for both the Java and Bedrock editions of Minecraft, my first stop was running a [Java Server](https://www.minecraft.net/en-us/download/server), enabling white-listing, and punching a hole in our Unifi firewall.  Fairly easy, but it required someone to login in after a Windows reboot and click the bat file to launch the CMD to run it.

Also, there were no backups, so if we needed to roll-back the destructive changes of an over-zealous cousin a day before, I had to be manually backing up.  Also, running multiple servers simultaneously was a hassle.  All in all, a bit of pain for "server" software, even if a free game.

## Cubecoders AMP

Looking for an alternative, I found [AMP](https://cubecoders.com/AMP) which is actual server software to manage and run multiple game servers of different types.  After configuration, I was able to run two Minecraft Java Servers and one Minecraft Bedrock server no trouble on our little AMD 2400g server.

### Instances Screen

![Instances]({{ site.url }}/img/posts/minecraft_servers_instances.png)

### Status Controls

![Status]({{ site.url }}/img/posts/minecraft_servers_status.png)

### Console Screen

![Console]({{ site.url }}/img/posts/minecraft_servers_console.png)

### Game Settings

![Settings]({{ site.url }}/img/posts/minecraft_servers_game.png)

## Conclusions

AMP was a big win for manageability as it let me easily configure, run, and keep backed up multiple game servers.  Each allowed for easy upgrades and was run as a Windows service, ensuring they all started back up after reboots.

As well, AMP supports many, many different types of game servers so I expect to use more as my boys outgrow Minecraft.

![Types]({{ site.url }}/img/posts/minecraft_servers_game_types.png)

Wait... does anyone really outgrow Minecraft though?
