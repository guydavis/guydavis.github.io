---
layout: post
title: Nvidia Shield
subtitle: media and games on the tv 
date: 2018-10-08
background: /img/headers/waterton_rainbow.jpg
comments: true
published: true
---

With dust gathering on our old Nintendo Wii, I recently decided to upgrade our family's game console.  After looking at the Microsoft XBox, Nintendo Switch, and Sony Playstation options, I decided to head in a different direction.  I chose a [Nvidia Shield](https://www.nvidia.com/en-us/shield/) connected to our upstairs TV.  Here's why...

# Nvidia Shield TV

<img src="/img/posts/shield_tv_gaming.jpg" class="img-fluid" />

This small device does best connected to your TV with an HDMI cable and to the Internet via an ethernet cable.  Once wired up, it is a really useful device, offering many great features including... 

## Media Streaming

Having cut the cord years ago, we really only watch Netflix, Amazon Prime, Youtube, and Plex now.  Starting way back with an old Apple TV, I've also run a Roku and a Chromecast, but the Shield is easily the best at media streaming.  With a handy remote, it's easy to select your media to watch.

## Game Console

The Shield has turned out to be a great system for gaming.  Don't think we'll be getting an XBox or Playstation anytime soon.

### Gaming in the Cloud

<img src="/img/posts/shield_tv_gaming_gfn.jpg" class="img-fluid" />

The ability to play tons of games via the [GeForce Now](https://www.nvidia.com/en-us/geforce/products/geforce-now/) cloud is a great feature. We play from [Steam](https://store.steampowered.com/) and [Blizzard](https://www.blizzard.com), along with others available on GFN.  Right now, the boys are enjoying playing Lego - Harry Potter together, but also like Fort-Nite.  I've been quite impressed on the game speed via wired Internet.  Currently GFN is a free beta, but we'll see how much Nvidia chooses to charge for this in future.

### Gamestream from PC

While we don't currently have a gaming PC with an Nvidia GPU in the house, I am considering upgrading to one next year when prices drop further as the mining craze fades.  With a [Nvidia GTX](https://www.nvidia.com/en-us/geforce/products/) or similar GPU, one can stream games from the PC to the Shield for playing on a TV.  However, I am also considering adding a mid-range [AMD Radeon RX](https://www.amd.com/en/RX-series) or similar GPU, instead to pair with our Freesync monitor.

### Retro Gaming with Emulation

<img src="/img/posts/shield_tv_gaming_retroarch.jpg" class="img-fluid" />

I've also been experimenting with Retroarch as an game emulator for older ROMs.  While I've heard that Nvidia Shield is an excellent platform for game emulation, my experience has been underwhelming.  Given the amount of fiddling required to get most older games to run, I doubt I'll bother much.  Perhaps, I'll have better luck with the [Drastic emulator](https://play.google.com/store/apps/details?id=com.dsemu.drastic) and [ARC Browser](https://play.google.com/store/apps/details?id=net.floatingpoint.android.arcturus).

## Plex Server

Being able to [serve Plex media](/2018/01/19/private_media_server/) up from the Shield itself, freed up my budget laptop to roam about the house again.  Overall, we've found the Shield is able to handle a few concurrent transcodes which is more than enough for our families usage.  I'm still using an old Ubuntu tower for media storage, shared to the Shield via Samba.

*Update in 2019*: Running Plex server on the Shield worked great in October and November.  Then in December an update was pushed to the Shield which introduced bugs around SMB file share handling which made playback unwatchable, with disconnects every few minutes for Plex devices.  After searching for solutions, I ended up installing Plex Server on a Windows 10 PC which works great, no playback issues and supports many more concurrent viewers.  Therefore, I can't recommend using the Shield as a Plex Server anymore.

*Update in 2021*: I moved to an [Unraid server](/2021/01/30/unraid-server-setup), hosting all applications in Docker containers including Plex.

# Conclusions

Overall, the Shield is a fantastic device, particularly due to recent software and service upgrades, most notably the re-vamped GeForce Now service.  My boys and I really enjoy playing Android, PC, and classic games on this system.  It's ability to watch Plex and stream Netflix is also great.

However, the Shield is not a perfect device.  In particular, it's integration with the Google Assistant eco-system is not great.  I specifically disabled the 'always-on' Assistant listening of the Shield remotes, instead preferring to click the button remote or controller to bring up the Shield's assistant when needed.  This prevented the Shield from competing with our Google Home Mini in that room as the Mini is simply better at handling voice commands.

### More in this series...
* [A Private Media Server](/2018/01/19/private_media_server/) - covers Plex on a cheap Linux laptop.
* [Budget Gaming PC](/2018/11/09/budget_pc_gaming) - covers building an entry-level rig for PC gaming. 
* [Retro Game Emulation](/2018/12/15/retro_game_emu) - options for emulating old games on both PC and Shield TV. 
* [Unraid Server Setup](/2021/01/30/unraid-server-setup) - now running Plex in a Docker container.
* [Zen2 Gaming PC](/2019/07/16/zen2_pc_gaming) - building another gaming PC. 
* [GPU Availability](/2021/12/12/xmas-gifts) - finding a GPU during the shortage.
