---
layout: post
title: Ebook Readers
subtitle: comics, books, and magazines
date: 2020-02-06
background: /img/headers/skywalk.jpg
comments: true
published: true
---

While I've been hosting movies, shows, and photos on a [private server in our house](/2018/01/19/private_media_server) for many years now, I have only recently started to collect digital books, comics, and magazines to read on our tablets and phones.

# Catalog Managers

Once you have ebooks (.epub, .mobi, .pdf), comics (.cbz, .cbr), and magazines (.pdf) you'll want a tool to manage and sort them.  For books, I use [LazyLibrarian](https://lazylibrarian.gitlab.io/) which does a good job of organizing them, show other books by the same author and so on.

<img src="/img/posts/ebook_readers_lazylib.png" class="img-fluid" />

While LazyLibrarian can handle comics, I found I preferred [Mylar](https://github.com/mylar3/mylar3) which seemed to pull info and covers from better sources.

<img src="/img/posts/ebook_readers_mylar.png" class="img-fluid" />

I also considered [Calibre](https://calibre-ebook.com/) but frankly I found it's heavyweight GUI a pain on my old headless Ubuntu server... yes I know it also has a CLI.  It just seemed overkill for my needs.

# OPDS Servers

In order to serve up my library to readers, I found that [Ubooquity](https://vaemendis.net/ubooquity/) gave me a simple UI that I could expose to family via [Organizr](/2018/04/12/nginx_organizr).  Here's the browsing UI showing books:

<img src="/img/posts/ebook_readers_ubooquity_books.png" class="img-fluid" />

There is also a web-based reader in Ubooquity as shown here, but I prefer reading on a portable device:

<img src="/img/posts/ebook_readers_ubooquity_reader.png" class="img-fluid" />

Comics and Magazines also work well:

<img src="/img/posts/ebook_readers_ubooquity_comics.png" class="img-fluid" />

<img src="/img/posts/ebook_readers_ubooquity_magazines.png" class="img-fluid" />

The Ubooquity admin UI was nicely separated so I could restrict access to just myself:

<img src="/img/posts/ebook_readers_ubooquity_admin.png" class="img-fluid" />

Unfortunately, I couldn't disable the Ubooquity admin login, in favor of Organizr's better global admin authentication, so I get a double-login but it's a minor annoyance.

# Ebook Readers

Arguably the most important piece is the ebook reader software running on our tablets and phones.  I selected [Moon+ Reader](https://play.google.com/store/apps/details?id=com.flyersoft.moonreader) on our Android phones and tablets.  Downloads are quick, it's easy on the eyes, and it remembers your place when you come back to a book.

<img src="/img/posts/ebook_readers_moon_reader.png" style="width:50%" />

For my wife's iOS tablet, I found [Marvin3](https://apps.apple.com/us/app/marvin-3/id1086482858) to also work well with OPDS libraries, including authentication.

# Conclusions

While I'm reasonably happy with the ebook readers and catalog servers described above, I have to admit I'm a fan of old-school paper books.  There's just something about a real book when reading.  Even my sons prefer to read Harry Potter in paper form on the couch, but they don't mind the digital options too.

**Update in March**: Well I never thought I'd see our local library closed indefinitely, but COVID-19 has changed everything.  Turns out having a good ebook reader is rather important now, at least for the foreseeable future.