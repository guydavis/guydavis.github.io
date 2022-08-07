---
layout: post
title: i18n and l10n
subtitle: translating python web apps
date: 2022-04-01
background: /img/headers/nose_hill_west_pano.jpg
comments: true
published: true
---

Ever since my [Machinaris cryptocurrency platform](https://github.com/guydavis/machinaris) launched a year ago, the community that sprung up around it has been very active.  Drawn from around the world, they have provided invaluable feedback and guidance on the direction of the platform as it has matured and become more powerful.

<img src="/img/posts/machinaris_geolocate_map.png" class="img-fluid" />

However, as a native English speaker, Machinaris has so far only been available in English.  This changed with the most recent release of [Machinaris version 0.7.0](https://github.com/guydavis/machinaris/releases/tag/0.7.0).  With great [contributions](https://github.com/guydavis/machinaris/wiki/Localization#contributing) from community members, Machinaris has been both internationalized and localized.

# Translations

The first step was to extract all the hard-coded English messages throughout the application.  I selected [Flask-Babel](https://pythonhosted.org/Flask-BabelEx/) for this.  So basically, where a English string in the web template was before:

```
    This is an English message.
```

This was extracted using Flax-Babel, by wrapping it in a convenience translation method:
```
    { { _('This is an English message.') } }
```

Running the Babel language pack initialization for supported locales, then the extraction, resulted in [messages.po files](https://github.com/guydavis/machinaris/tree/develop/web/translations) such as this one with an msgid (English key) corresponding to the msgstr (local translation):

<img src="/img/posts/machinaris_i18n_messages.png" class="img-fluid" />

Each browser request sends an 'Accept-Language' weighted list of accepted languages.  Here's the settings from Mozilla Firefox:

<img src="/img/posts/machinaris_i18n_browser_language.png" class="img-fluid" />

Machinaris will find the best match between the browser's requested language and the supported locales. The fallback default is `en` (English). Here's what this looks like in Portuguese:

<img src="/img/posts/machinaris_i18n_pt.png" class="img-fluid" />

# Number Formats

Machinaris uses [Babel](https://babel.pocoo.org/en/latest/index.html) to support locale-dependent [number and currency formatting](https://babel.pocoo.org/en/latest/api/numbers.html).  For example, this allows for decimals to use commas as a grouping-separator in the US, while a comma represents the decimal point in France.

<img src="/img/posts/machinaris_i18n_numbers.png" class="img-fluid" />

# Date Formats

There is only one true date format: <a href="https://www.reddit.com/r/ISO8601">ISO8601</a>.  Seriously though, this allows easy sorting in tables by date column.

<a href="https://xkcd.com/1179/">
    <img src="https://imgs.xkcd.com/comics/iso_8601.png"/>
</a>

# Conclusions

Overall, the [Babel library](https://babel.pocoo.org/en/latest/) is the definitely the way to go when internationalizing a  application in Python.  [Combined](https://flask-babel.tkte.ch/) with the [Flask](https://flask.palletsprojects.com/en/2.0.x/) web layer, it allows one to release a multi-lingual application for users all around the world. 

### More in this series...
* [Chia on Unraid](/2021/04/30/unraid-chia-plotting-farming/) - Chia CLI on Unraid with Docker
* [Machinaris](/2021/05/21/unraid-chia-machinaris/) - a new WebUI for Chia on Unraid
* [Distributed Farming](/2021/06/29/machinaris-distributed/) - Machinaris on many worker systems
* [Network Peer Geolocation](/2022/03/13/machinaris-geolocate/) - Mapping location of blockchain peers by IP address.