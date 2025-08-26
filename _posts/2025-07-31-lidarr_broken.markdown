---
layout: post
title: Lidarr & Soulseek
subtitle: growing the library
date: 2025-07-31
background: /img/headers/glacier_wildlife.jpg
comments: true
published: true
---

After I scripted [imports of album lists](/2023/09/23/lidarr_importing) into the Lidarr media tracking system back in 2023, I revisted it recently to import some more.  However, I found the Lidarr project itself in state of disarray, with multiple users complaining of a broken metadata API for weeks and weeks.  In fact, the devs acknowledged the issue and indicated they had no ETA for fix:

<img src="/img/posts/lidarr_broken_devs.png" class="img-fluid" /> 

## Lidarr Workarounds

Digging into the Lidarr Discord for support, I found a [fork from blampe](https://github.com/blampe/hearring-aid) that seemed to help somewhat.  However, the issue with broken metadata lookups involved server side as well, so this wasn't a final solution.  

## Spotify Playlist Import

A common way to share album lists these days seems to be Spotify.  I've never been a subscriber myself so I looked for tools to extract an album list from Spotify into a CSV file that I could then import into Lidarr.  This sounds easy, but the slight variation in naming of artists and albums makes this a challenging data cleanup problem.

To start with, I used Spotlistr generate the CSV file with appropriate fields from the Spotify playlist:

<img src="/img/posts/lidarr_broken_spotlistr.png" class="img-fluid" /> 

Then I used my [lidarrtools](https://github.com/guydavis/lidarrtools) scripts, to complete the import from CSV file into my Lidarr instance, working around missing meta-data.

## Soulseek Alternatives

As I was looking at my music library, I stumbled across [Soulseek](https://github.com/slskd/slskd/tree/master) as an alternative means of sourcing music, for import into Lidarr.  In my case, I am running Unraid so I found Docker templates for 'slskd' and 'soularr'.  [Soularr](https://soularr.net/) is a headless Python script that connects Soulseek and Lidarr.  

Here's the configuration for Soulseek:
<img src="/img/posts/slskd_unraid_template.png" class="img-fluid" /> 

Here's the configuration for Soularr:
<img src="/img/posts/soularr_unraid_template.png" class="img-fluid" /> 

I needed to edit the `slskd.yml` file at `/mnt/user/appdata/slskd` to set an urlbase of `/slskd` (behind my SWAG proxy) and add an api_key for connection by Soularr.

Then I needed to create a `config.ini` file at `/mnt/user/appdata/soularr`, filling in the `lidarr` and `slskd` sections:

<img src="/img/posts/soularr_lidarr_config.png" class="img-fluid" /> 

<img src="/img/posts/soularr_slskd_config.png" class="img-fluid" /> 

Then port-forwarded 50300 and 50301 on my router to allow for Soulseek traffic.  After this, Soularr seemed to start querying Soulseek for missing albums, and then importing them into Lidarr. 


## Conclusion

UPDATE: Eventually in August, the Lidarr devs deployed a new metadata service that began to correct the missing API hits for artist & album searches.  Big thanks to them for improving Lidarr, a very useful bit of software.

### More in this series...
* [Lidarr Importing](/2023/09/23/lidarr_importing) - Scripting album imports