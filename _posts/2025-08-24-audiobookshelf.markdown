---
layout: post
title: Audiobookshelf
subtitle: hosting books
date: 2025-08-24
background: /img/headers/glacier_waterfall.jpg
comments: true
published: true
---

Way back during the Covid shutdown, I set up my home server to [host ebooks and audiobooks](/2020/02/06/ebook_readers/) for my family to access from their phones and tablets. Subsequently, we found that Amazon's Audible service and our local library's Libby service were better options for reading and listening.  However, with the trade war launched by the USA this year, our family has been dumping any American products &amp; services and buying from Canada instead.  So bye-bye Audible subscription!

Instead, I wanted to host access to my own library of ebooks and audiobooks again, using [Readarr](https://readarr.com/), [Libation](https://getlibation.com/), and [Audiobookshelf](https://www.audiobookshelf.org/).

## Readarr

[Readarr](https://readarr.com/) is part of the [Servarr group](https://wiki.servarr.com/) of media management tools, including [Radarr](https://radarr.video/) (movies), [Sonarr](https://sonarr.tv/) (shows), and [Lidarr](https://lidarr.audio/) (music).  Unfortunately, the Readarr project itself has been retired, but the community has picked it up, and are carrying forks forward.  The best, today anyways, seems to be [Bookshelf](https://github.com/pennydreadful/bookshelf) by [pennydreadful](https://github.com/pennydreadful).

Deploying on Unraid is pretty easy, I simply used an existing Unraid app like "binhex-radarr" and change the Repository line to: `ghcr.io/pennydreadful/bookshelf:hardcover`:

<img src="/img/posts/audiobookshelf_readarr_config.png" class="img-fluid" /> 

## Libation

Since, we had some audiobooks on Audible, I needed to use the [Libation project](https://getlibation.com/) to extract them into a format that I could host myself.  Setup on Unraid was a bit tricky as I first needed to install the Libation desktop app on Windows, enter my Amazon Audible logic credentials to generate some encoded JSON files, then install the app on my Unraid server, placing the JSON settings files from Windows into the Unraid appdata area.

<img src="/img/posts/audiobookshelf_unraid_libation.png" class="img-fluid" /> 

Then every half hour, Libation running in a Docker container on my Unraid server would look for any new audiobooks and extract them into place where Audiobookshelf automatically cataloged them, ready for listening by my whole family.

## Audiobookshelf

For hosting, browsing, and reading the books, I chose [Audiobookshelf](https://www.audiobookshelf.org/).  ABS, as it's known, is a Docker container deployed on my Unraid home server, combined with an Android app on our phones.

Deploying on Unraid is shown.  I also added a Path for my ebooks.

<img src="/img/posts/audiobookshelf_unraid_abs.png" class="img-fluid" /> 

Then viewing the running instance of Audio Book Shelf, within a browser: 

<img src="/img/posts/audiobookshelf_home.png" class="img-fluid" /> 

While it is possible to use the web browser to play/read books, I found this interface better for just managing and listing the catalog.  

Instead, listening is best done on a phone with the ABS app itself:

<div>
    <img src="/img/posts/audiobookshelf_app_audiobooks.png" class="img-fluid" style="width: 30%; height: auto" /> 
    <img src="/img/posts/audiobookshelf_app_ebooks.png" class="img-fluid" style="width: 30%; height: auto" /> 
</div>

Reading ebooks on the phone can be done with the ABS app directly (left screenshot) or another reader like Moon+ (right screenshot).

<div>
    <img src="/img/posts/audiobookshelf_app_abs_reader.png" class="img-fluid" style="width: 30%; height: auto" /> 
    <img src="/img/posts/audiobookshelf_app_moon_reader.png" class="img-fluid" style="width: 30%; height: auto" /> 
</div>

<br/>

## Conclusion

This whole setup was quite a bit easier than I expected.  I'm really impressed with the quality of the Audiobookshelf web app and phone app too.  I forsee no problem cancelling our Audible subscription on expiry.  Yet another American digital service that my family here in Canada will never pay for again.

### More in this series...
* [Ebook Readers](/2020/02/06/ebook_readers/) - hosting ebooks and audiobooks myself