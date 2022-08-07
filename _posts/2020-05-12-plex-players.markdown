---
layout: post
title: Plex Players
subtitle: tweaking and tuning
date: 2020-05-12
background: /img/headers/maligne_canyon1.jpg
comments: true
published: true
---

While I've been a fan of [Plex](https://plex.tv) for sharing movies, shows, videos, music, and photos with our family and friends for many years now, the Plex players on various devices are not without their annoyances.

The complaints from my users about [Plex players](https://www.plex.tv/en-ca/apps-devices/) are threefold:
1. Plex requires a lot of fiddling to get a decent stream, without stutterring, particularly for those connecting remotely.
2. Sub-titles are rarely found, displayed, or configured in a way that helps those with hearing issues, often the elderly. 
3. Recently Plex clients have been defaulting to listing Plex's own B-movie content, confusing friends and family interested in my library only.

All of these are in stark contrast to the [Netflix](https://netflix.ca) client which rarely stutters and usually has good subtitles, all with a decent selection of content. For this reason, I still encourage my friends and family to have a Netflix account and only use my Plex server as an alternative source.

# Web Clients

There are two ways to view Plex within a web-browser, either directly off your server or via the Plex.tv relay.

## Local Plex Server

As shown below, one can reach their Plex server in their house at http://LOCAL_COMPUTER:32400, or in my case, proxied to remote users via [Nginx and Organizr v1](/2018/04/12/nginx_organizr/):

<img src="/img/posts/private_media_server_organizr.png" class="img-fluid" />

While this is the simplest approach for my users, I actually discourage it for viewing due to the poor performance they see on their end.  Remote streams regularly get stuck (never-ending pause) despite my server having no trouble transcoding or uploading fast enough.  Often closing their browser and restarting the stream gets things going again, but you don't have to do that with Netflix.

## Plex.tv

Plex users can actually view multiple server libraries at once when browsing the [Plex.tv servers](https://app.plex.tv/desktop) themselves, which proxy back to the respective Plex servers at their friends houses.  

However, in my experience this shows the alot of stuttering and pauses (regardless of content source or ISP or computer).  Not worth the trouble in my estimation.

# Television Boxes

The Plex app running on a "set-top box" connected via HDMI cable makes the most sense for most viewers.  The majority of our Plex viewing is on TV, followed closely by mobile phones and tablets.  

## Chromecast

While the Chromecast devices themselves don't have a Plex app, it's possible to "cast" to them from the Plex app on your phone or tablet.  Basically that just initiates the stream, then the phone is out of the data path between Plex server and Chromecast device.  In our house, I have an original Chromecast connected to an old Samsung TV, and we recently added a Chromecast Ultra connected to a newer LG TV capable of 4K.  Overall, I've been quite pleased with the direct play quality of 4k+ movies on the LG TV + Chromecast Ultra combination.

## Shield TV

Starting with a Nvidia Shield TV in 2017, we've since upgraded to a Shield Pro TV in 2019.  We originally bought the Shield to use the Geforce Now game streaming service, but once we added our own gaming PCs we haven't really used it much since, particularly given remotes and controllers that have both caused us trouble.  That said, the Shield is an excellent Plex client, direct playing nearly everything and never stuttering.  For the Plex abilities alone, I'd still recommend a Nvidia Shield.

## Roku

While we have passed it on to my family, we did originally use a Roku streaming stick for both Plex and Netflix.  It did a decent job, but with the Google Home integration offered by the Chromecasts we're no longer using Roku in our house.

## Apple TV

A decade ago, we had an Apple TV just for Netflix really, but it couldn't play Plex so we gave it away.  I have family using a latest generation Apple TV to play Plex and they've had no complaints.

# Portable Clients

While all the other clients listed here are free to use, the mobile apps cost $5 a pop, unless you're a Plex Pass member and running your own Plex server.  Most of my friends and family would be prime candidates for the mobile Plex apps, but I don't believe any have actually bought it, preferring desktop and TV Plex apps instead.

## Android

The Android app is passable, plays fine without much stuttering, though is a bit hit or miss when it comes to casting to Chromecast devices around the house.  Not sure if the fault there is Plex or Google's though.

## iOS

My wife uses the Plex on her iOS tablet as her primary viewing platform.  Seems to work well for her now, though she's experienced weird tablet rotation bugs and some stuttering in past years.

# Desktop Clients

While a separate download, I have begun encouraging this for everyone who is watching on a computer.  Frankly, the performance is better with much less stuttering and more likelihood of choosing a reasonable stream resolution like 1080p or 720p.

## Windows

When not watching on my phone, I now use the Windows desktop client on an old laptop, connected to an old Samsung TV, perched above my desk:

<img src="/img/posts/plex_players_windows_desktop_to_tv.jpg" class="img-fluid" />

I've found less stuttering and better stream resolution than using Google Chrome to play in the web client.

## Macintosh

Much of my extended family are Macintosh aficionados so I recommend the Macintosh desktop client to them when watching from Macbooks, or even a Mac Mini connected to TV.  Download, install, and login is straight-forward.  Most importantly, in my brief testing the Mac desktop client seems to stream better - more reliably and at higher resolutions than Plex within Chrome.

# Conclusions

I keep reading that Plex alternatives such as [Jellyfin](https://jellyfin.org/) and [Emby](https://emby.media/) are worth considering, particularly given Plex's drawbacks.  However, I haven't found Plex broken enough to move... yet.  Honestly, once I get new hardware for the server and am rebuilding from scratch, I'll likely test to see if I can leave Plex and its hassles behind.

### More in this series...
* [Private Media Server](/2018/01/19/private_media_server/) - overview of my server.
* [Nginx and Organizr v1](/2018/04/12/nginx_organizr/) - proxying Organizr v1.
* [Nginx and Organizr v2](/2019/01/03/nginx_organizr_v2/) - proxying Organizr v2.