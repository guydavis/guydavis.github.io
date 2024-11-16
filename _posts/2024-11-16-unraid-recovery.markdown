---
layout: post
title: Unraid Recovery
subtitle: my flash drive died!
date: 2024-11-16
background: /img/headers/maple_leaf.jpg
comments: true
published: true
---

I've been running [Unraid](https://unraid.net) OS as my house's media server for a few years now.  Overall, I've been very pleased with it, particuarly with how well it handles old and mismatched hardware.  While Unraid may not offer the pure disk performance of it's primary competitor [TrueNAS](https://www.truenas.com/), I've found Unraid's performance more than sufficient for home use.  As well, deploying applications for home use is simple with Unraid, while TrueNAS took a complicated "enterprise" approach to application deployment.

## Unraid Reliability

The hard-drive storage of my Unraid server has been rock solid.  I haven't lost any data which is the most important feature of such a network storage system.  That said, I have had repeated failures of the USB sticks that [Unraid requires to boot](https://docs.unraid.net/unraid-os/getting-started/#prerequisites).   In practice, it seems most USB thumb drives are shit, particularly if they sit 24/7 in the heat put out by my server.

So far, I've had 3 different thumb drives fail.  Often I find out when I try to upgrade my server OS, only to receive an error that the update could not be written to the USB stick before reboot.  When this happens, I have buy another USB-2 drive, 32 GB or smaller, as that is the recommendation from Unraid.  Then I start to follow the instructions for [replacing the drive](https://docs.unraid.net/unraid-os/manual/changing-the-flash-device/#why-replace-your-usb-flash-boot-device).  This process is somewhat error-prone and requires that exactly the correct backups have been taken.

### Backups Required

Recovering from an Unraid thumb drive failure, in my experience, require the following backups to have been taken BEFORE the failure:
* Flash Backup: about 0.5 GB, I download this bootable set of configurations every year and save it in my Google Drive storage.
* Appdata Backup: a plugin configured to save the working state (XML) and data of each deployed application with all settings.

## Unraid License

Changing to a new bootable thumb drive, requires [migrating the Unraid license](https://docs.unraid.net/unraid-os/manual/changing-the-flash-device/#notes-about-replacing-your-registration-key).  A fairly straight-forward process, it is still a hassle given how often I have had to do tihs, nearly once a year now I believe.

## Conclusions

With all the backups in place, recovering a working Unraid system after a thumb drive is not too bad.  I am still a happy user of this network storage OS.  However, my experience demonstrates the importance of having all backups in place before they are needed.  Rebuilding an Unraid system from scratch, with all the configuration and tweaking required, would not be a pleasant experience.

### More in this series...
* [Unraid Server Setup](/2021/01/30/unraid-server-setup) - media and storage
* [Unraid GPU Passthrough](/2021/02/02/unraid-gpu-passthru) - failed attempt
