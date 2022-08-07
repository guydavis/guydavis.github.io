---
layout: post
title: Unraid Server Setup
subtitle: file storage and much more...
date: 2021-01-30
background: /img/headers/maligne_lake4.jpg
comments: true
published: true
---

Having run a [basic media server](/2018/01/19/private_media_server/) on an old Ubuntu box for a few years now, I found some time over the holidays to move into a more spacious system running [Unraid](https://unraid.net/).

Building upon a solid Linux core, Unraid is a network-attached storage (NAS) product that excels at serving media, particularly handy for home users.  It allows growth by adding mismatched hard-drives over time.  Docker containers offer all the required media services.

# Hardware 

As this storage device is not a [gaming PC](/2019/07/16/zen2_pc_gaming/), you're better to run Unraid on many CPU cores with lots of drives, neither of which need to be blazing fast.  In my case, I had a spare tower with dual CPUs (12 cores with 24 threads). 
<img src="/img/posts/unraid_server_setup_processor.png" class="img-fluid" />

To allow for many Docker containers and a few VMs, its got 48 GB of ECC RAM:

<img src="/img/posts/unraid_server_setup_memory.png" class="img-fluid" />

I added a UPS to deal with brown-outs and black-outs, monitored by Unraid:

<img src="/img/posts/unraid_server_setup_power.png" class="img-fluid" />

It also has an old Quadro GPU, but that's [another story](/2021/02/02/unraid-gpu-passthru).

# Array Setup

Unraid itself runs in RAM, [booting off a USB thumb-drive](https://wiki.unraid.net/UnRAID_6/Getting_Started).  After updating the BIOS settings to ignore disks in the boot order, I was able to access the Unraid GUI via web browser.  With a 30 day trial, I started to test with a new 8 TB shucked drive for [parity](https://wiki.unraid.net/UnRAID_6/Storage_Management#Parity_Disks), a single 2 TB hard disk, and a small 240 GB SSD for cache.

As testing progressed, I continued to add hard-drives, [pre-clearing](https://wiki.unraid.net/UnRAID_6/Storage_Management#Clear_v_Pre-Clear) them first, then rolling them into the array:

<img src="/img/posts/unraid_server_setup_array.png" class="img-fluid" />

As shown above, I'm now up to 27 TB in the array, with data redundancy provided by the 8 TB parity disk.  The oldest drive is a WD Green 1 TB from 2008!

# Cache Setup

While Unraid excels at growing a heterogenous storage array over time, these mismatched disks will not handle writes as fast as a homogenous array of fast ZFS disks on FreeNAS for example.  To make up for this, Unraid uses a cache pool of SSD drives.  I started with a single Kingston SSD, but added a 2nd to make a redundant pair.

<img src="/img/posts/unraid_server_setup_cache.png" class="img-fluid" />

# File Shares

As a storage array, Unraid comes with a few file shares already setup:
* appdata: resides solely on the Cache and is used by Docker containers for databases etc.
* domains: also on the fast Cache, holds the disks of virtual machines 
* isos: good spot for holding ISO images
* system: used by Unraid itself, though most of Unraid runs in RAM for speed.

<img src="/img/posts/unraid_server_setup_shares.png" class="img-fluid" />

I added a couple more:
* data: My general storage share, which is set to write to Cache for speed, but Mover pushes changes to the full sized array overnight.  Available via both SMB and NFS to my network.
* backups: Used to hold Urbackup data, writes slowly to the array as needed.  Not shared via SMB/NFS to prevent ransomware from encrypting my backups.

# Docker Containers

Unraid makes it really easy to run and update all sorts of Docker containers.  For basic media server, I'm following this [guide](https://trash-guides.info/Misc/how-to-set-up-hardlinks-and-atomic-moves/):

<img src="/img/posts/unraid_server_setup_docker.png" class="img-fluid" />

Swag provides reverse-proxy and Organizr tabs it all together. I've also added [Urbackup](https://www.urbackup.org/) to backup computers on my network, and [AMP](https://cubecoders.com/AMP) to [run Minecraft servers](/2020/06/03/minecraft-servers/).

# Conclusions

Overall, I'm really impressed with Unraid.  It's been on my list to try for years, but I kept putting it off.  We'll see how it holds up in the coming months and years, but for the price, it seems to offer a lot of value.  It's done an excellent job of taking over as my media server.  I hope to explore additional projects my adding more containers and VMs in the future.

### More in this series...
* [Unraid GPU Passthrough](/2021/02/02/unraid-gpu-passthru) - failed attempt
* [Unraid Urbackup](/2021/03/15/unraid-urbackup) - household backups
* [Unraid Chia](/2021/04/30/unraid-chia-plotting-farming) - plotting and farming
