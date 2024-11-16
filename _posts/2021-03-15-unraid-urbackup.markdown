---
layout: post
title: Backup to Unraid
subtitle: urbackup for the home
date: 2021-03-15
background: /img/headers/maligne_lake6.jpg
comments: true
published: true
---

After setting an [Unraid](/2021/01/30/unraid-server-setup) system in my basement, it made sense to store backups from the various computers we have around the house.  I looked at a few options, but the free [Urbackup](https://www.urbackup.org/) seemed a good bet.

# Unraid Server Setup

Available via the Community Applications repository of Unraid, installing Unraid is easy.  

<img src="/img/posts/unraid_urbackup_app.png" class="img-fluid" />

After install, you'll want to create a separate share on your Unraid array to hold your backups. 

<img src="/img/posts/unraid_urbackup_share.png" class="img-fluid" />

You don't need to share this `backups` share via NFS or SMB.  Urbackup will make it's own TCP connection from your client computers to the Unraid server for data transfer. Doing so would open you to risk of ransonware which loves to encrypt a local machne and any network shares it can reach.

The Docker container just needs host networking with a host path set to your `backups` share:

<img src="/img/posts/unraid_urbackup_settings.png" class="img-fluid" />

Then you'll have access to the Unraid WebUI:

<img src="/img/posts/unraid_urbackup_webui.png" class="img-fluid" />

There you can set the backups path withn the container:

<img src="/img/posts/unraid_urbackup_paths.png" class="img-fluid" />

Next step is to install Urbackup client software on systems around the house.

# Windows Client Setup

Install on Windows is straight-forward and I went with the default settings, just setting a computer name.

<img src="/img/posts/unraid_urbackup_windows_settings.png" class="img-fluid" />

Then the backups run in the background, a status window on each Windows system can be viewed if you want.

<img src="/img/posts/unraid_urbackup_windows.png" class="img-fluid" />

# Macintosh Client Setup

There is a beta-client for Macintosh systems.  Unfortunately, it only seems to backup user-by-user, rather than whole system on Windows.  So, I'm not really using Urbackup on little Mac Mini.

# Conclusion

Initially, I attempted both image and file backups, but I found that image backups often failed.  So, I've simply gone with file backups.  Overall, it's been quite reliable so far.

### More in this series...
* [Unraid Server Setup](/2021/01/30/unraid-server-setup) - media and storage
* [Unraid GPU Passthrough](/2021/02/02/unraid-gpu-passthru) - failed attempt
* [Unraid Chia](/2021/04/30/unraid-chia-plotting-farming) - plotting and farming
* [Unraid Recovery](/2024/11/16/unraid-recovery) - recovering from an unbootable flash drive
