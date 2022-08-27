---
layout: post
title: IP Geolocation
subtitle: mapping peer network connections
date: 2022-03-13
background: /img/headers/hydroline.jpg
comments: true
published: true
---

All blockchains supported by my [Machinaris cryptocurrency platform](https://github.com/guydavis/machinaris) are peer to peer networks, connecting with other nodes all around the world.  Previously, the Machinaris WebUI simply displayed the Connection details in a tablular format.  Efficient but boring...

<img src="/img/posts/machinaris_geolocate_old_connections.png" class="img-fluid" />

So, instead I set out to present the location of network peers on a map, by querying public APIs for locations of their IP addresses:

<img src="/img/posts/machinaris_geolocate_map.png" class="img-fluid" />

# Geolocation

After evaluating multiple services for getting locations from IP addresses, I selected Maxmind.  They have a decent free-tier API service.  So each Machinaris user who is running Machinaris on their local network, needs to only register for a free [Maxmind account](https://www.maxmind.com/en/geolite2/signup).  They then enter the Maxmind account details into their install of Machinaris:

<img src="/img/posts/machinaris_geolocate_settings.png" class="img-fluid" />

Once activated, their Machinaris install will begin geolocating their network peers and display on their map.  By having each user have their own Maxmind account, along with some intelligent caching I added, the number of Maxmind requests is small and well within the limits of the free service.

# Mapping

Building on my previous mapping work, dating back all the way to an old project of mine named the [Baby Name Map](https://github.com/guydavis/babynamemap), I selected [Leaflet](https://leafletjs.com/) as the mapping library.  An excellent open-source project, Leaflet makes it easy to embed simple maps onto a website.

Optionally, one can add their [Mapbox](https://account.mapbox.com/auth/signup/) free account details, to have some nicer looking tiles displayed, particularly as one zooms.  As well, using the drop-down menu, it's possible to filter by blockchain, to see just peers for that network.  Example for the Chia blockchain:

<img src="/img/posts/machinaris_geolocate_chia.png" class="img-fluid" />

# Conclusion

They say *"a picture is worth a thousand words"*... and clearly it's true when it comes to displaying geographic data such as a world-wide peer network.  It's been fun to dust off my mapping skills and work with such great open-source projects and free APIs.

### More in this series...
* [Chia on Unraid](/2021/04/30/unraid-chia-plotting-farming/) - Chia CLI on Unraid with Docker
* [Machinaris](/2021/05/21/unraid-chia-machinaris/) - a new WebUI for Chia on Unraid
* [Distributed Farming](/2021/06/29/machinaris-distributed/) - Machinaris on many worker systems
* [Internationalization](/2022/04/01/machinaris-i18n/) - Translating and localizing a Python web app.
* [Python Profiling](/2022/05/28/machinaris-profiling/) - Profiling Python with Py-Spy