---
layout: post
title: A Private Media Server
subtitle: sharing with friends and family
date: 2018-01-19
header-img: img/headers/rhodes_acropolis.jpg
comments: true
published: true
---

Having given up cable TV a while back, I wanted a means of sharing my personal collection of home videos, photos, movies, shows, and music to other computers, TVs, tablets, and phones around my house.  Deciding on [Plex](https://www.plex.tv), I setup a private media server that automates management of all my digital content: 

![Organizr]({{ site.url }}/img/posts/private_media_server_organizr.png)

## Overall Approaches
These days, a quick way to setup a media server is to rent a virtual private server (VPS) from a cloud provider.  [Digital Ocean](http://digitalocean.com) and [Hetzner](https://www.hetzner.com) are good options, but a search for [seedbox](https://www.google.ca/search?q=seedbox) turns up many more possibilities.  [Plex Cloud](https://www.plex.tv/features/cloud/) is another option, storing files on Google Drive, OneDrive, or Dropbox.

A cheaper route, particularly if you have old hardware available, is to set up your own home server.  Options in this case are to deploy the software onto either a [Windows](https://brandonb.ca/ultimate-media-server-setup) or a [Linux](https://www.htpcguides.com/install-plex-media-server-ubuntu-16-x-and-later/) system, possibly using [Docker](https://github.com/tom472/mediabox) to simplify.

## Linux Server Setup
In my case, I evaluated the approaches above and decided to use an ancient system (AMD64 Athalon 2800 @ 1 GHz with 1.5 GB RAM) running Ubuntu 16.04.  The only thing this old workhorse couldn't do was run Plex which required the "new" [SSE instruction set](https://en.wikipedia.org/wiki/Streaming_SIMD_Extensions) for transcoding video.  So, Plex itself is running on an old Acer laptop (Intel Pentium 3556U @ 1.7GHz with 8 GB RAM), also with Ubuntu 16.04.

### Plex Media Server
Plex is used to serve up photos, home videos, music, shows, and movies to other devices in my house and to family &amp; friends across the country.  It's basically a private Netflix, Spotify, and Flickr, all rolled into one.  Once installed, Plex is configured via an admin web page.  Media access can then be had from other [computers, tablets, phones, and TVs](https://www.plex.tv/how-it-works/). 

Family members in the same household can easily be granted access.  As well, Plex allows you to invite friends and family outside the household to access your collection.  Importantly, this list of approved users will be used by the apps discussed below for authentication.

### Organizr &amp; Ombi
Next up is a slick web UI named [Organizr](https://organizr.us/) for combining multiple web tools together in a nice tabbed interface, all authenticated by your Plex server.  In my case, this let's me offer straightforward buttons to friends and family titled:  Home, Watch, Request, and Stats.  Here's the `Request` view, provided by Ombi, with Organizr links along the left side:

![Ombi]({{ site.url }}/img/posts/private_media_server_ombi.png)

[Ombi](https://www.ombi.io/) is a easy request tool for users to search for new movies and shows to add to the collection.  It is a simple frontend end to automated tools for query online [movie](http://www.imdb.com/) and [show](https://www.thetvdb.com/) databases.  The simplicity is paramount as family members using Ombi may not be the most technically savy.  For what it does, Ombi excels!

### Sonarr &amp; Radarr

To catalogue and manage the movies and shows in my collection, I use [Radarr](https://radarr.video/) and [Sonarr](https://sonarr.tv/) respectively.  These [excellent tools](https://www.htpcguides.com/install-nzbdrone-ubuntu/) can also monitor ongoing series for new episodes as well as upgrade the quality of a particular video as better versions are indexed.  Below is a screenshot of Radarr displaying a movie I encoded from the original DVD I purchased years ago.  I may no longer have a DVD player, but I can still watch the movie!

![Radarr]({{ site.url }}/img/posts/private_media_server_radarr.png)

### Jackett

Sonarr and Radarr can both search for new content via [Jackett](https://github.com/Jackett/Jackett), which is an API proxy to [online trackers](https://www.htpcguides.com/add-custom-torrent-trackers-in-sonarr-using-jackett-guide/).  Requests can be forwarded to a download client, with privacy provided by a VPN, as described in this [helpful tutorial](https://www.htpcguides.com/force-torrent-traffic-vpn-split-tunnel-debian-8-ubuntu-16-04/).

### Tautulli

To keep tabs on the collection and my users, I monitor Plex using [Tautulli](http://tautulli.com/).  This nice Python app provides ongoing reports and statistics that are useful for both myself as administrator, as well as my users to see what others have been enjoying.

![Tautulli]({{ site.url }}/img/posts/private_media_server_tautulli.png)

### Nginx and PML
Since all my media services only connect out to the Internet for IMDB queries and such via my VPN, to allow users to access them I've set up [Nginx](https://www.nginx.com/resources/admin-guide/reverse-proxy/) as a reverse proxy.  I've rolled my own setup but [Organizr's installer](https://github.com/causefx/Organizr/wiki/Linux-Installation#auto-installer-for-linux-debianubuntu-only) will create a nice default config.  External access to my site is SSL-encrypted through the great [Let's Encrypt](https://letsencrypt.org/) project.

Another useful admin tool is [PML](http://pimpmylog.com/) for online access to my web server's access and error logs.  Combined with remote shell access, I can administer my server from pretty much anywhere, making remote monitoring and debugging possible.

## Conclusions
While not for the average cord cutter, running a private media server has been a great learning experience for me.  I've found the online communities around these projects really helpful, which has prompted me to donate some $ to these open source projects to ensure they keep developing and invovating.  Keep up the good work!

