---
layout: post
title: Lidarr Importing
subtitle: building a library
date: 2023-09-23
background: /img/headers/peyto_lake.jpg
comments: true
published: true
---

<img src="/img/posts/lidar-importing.jpg" class="img-fluid" style="margin-left:10px; float:right"/>

So, I finally got sick of Youtube Music constantly playing me the same 10 songs when say "OK Google, play some music" to my house speakers.  I still remember the good old days of the Google Play Music service when that prompt would result in a nice mix of old favorites and also music I'd not encountered before.  Tragically, Google knifed GPM a few years ago, despite Youtube Music being a far inferior service.

Instead, I've dusted off my decades old collection of MP3s, ripped from my long-gone CDs.  After pointing [Lidarr](https://lidarr.audio/) at my collection, I was able to start adding additional artists.  I was intrigued by the list of "[1001 Albums to Listen to Before You Die](https://en.wikipedia.org/wiki/1001_Albums_You_Must_Hear_Before_You_Die)" by Robert Dimery.

After initially trying to use a Trackt list to import into Lidarr, I had just a mess of incorrect matches.  So, restarting after a cleanup, I wrote my own [Python script](https://github.com/guydavis/lidarrtools) to add the correct albums into Lidarr.  This took a bit of time as fuzzy matching was required for differing namings between the book editor and the MusicBrainz database that Lidarr uses.

Eventually, I was able to get a lot of neat new music (to me anyway) loaded in.  Now I listen around the house with Plex and find myself discovering interesting new artists from past decades.  