---
layout: post
title: Sports Calendar
subtitle: vibe coding a web scraper
date: 2025-05-16
background: /img/headers/playa_beach.jpg
comments: true
published: true
---

Last month I was [testing](/2025/04/27/google-gemini-2_5) the new Google [Gemini Pro 2.5](https://blog.google/technology/google-deepmind/gemini-model-thinking-updates-march-2025/) model.  So I figured I'd try a small little code project, built using assistance from Gemini.

## Project Overview

With the trade war launched by the USA, our family has been dumping any American products &amp; services and buying from Canada instead.  Bye-bye Netfix and Amazon Prime! Instead we became subscribers to [CBC Gem](https://gem.cbc.ca/) streaming TV service.  I found that CBC often has streaming sports on, but I kept forgetting to check their [online schedule](https://www.cbc.ca/sports/streaming-schedule?sport=Volleyball) for my favorite sport: Volleyball.

I wanted to write a web page scaper that would pull the scheduled events off the CBC schedule and add them to a personal Google Calendar, that I could toggle on/off of my own Google Calendar view.  Since I check my Google Calendar all the time, I would notice if an upcoming CBC Sports event was worth watching.

### Project Creation

So, turning to [Google Gemini](https://gemini.google.com/app), I prompted as shown:

<img src="/img/posts/google-gemini25-pro-calendar.png" class="img-fluid" /> 

This resulted in a useful set of code (3 Python files) along with setup instructions covering:
1. Setting up Python and libraries on my laptop.
1. How to inspect the target web page using browser developer tools, to identify the HTML tags containing data to scrape.
1. The content of 3 Python files, well commented with sections where I needed to fill out the templates.

I added this initial structure to a [Github Repo](https://github.com/guydavis/cbc-sports-calendar), then was able to click the 'Import Code' button in Google Gemini's chat box, allowing my project to be seen by Gemini.  Ideally, I would be able to share my local folder (with uncommitted changes), but I didn't see that option yet.

Looking at the generated code, I was impressed that all the relevant Google Cloud libraries were present and ready for use.  Gemini chose the BeautifulSoup library for scraping and even took into account the time change difference (EST for CBC and MST for me).

### Creating OAuth Client

This actually took me quite a while as I initially incorrectly chose an OAuth Client in my Google Cloud Console for this new app, of type "web application".  This resulted in issues related to missing `redirect_uri` which I worked through with Gemini.  

However, the correct type to use in case of this script is "desktop application".  Then the OAuth configuration started working for me, allowing me to fully execute the Calendar API.

### Squashing Bugs

To guard against duplicate event creation, I asked Gemini to modify a method to deduplicate on processing:

<img src="/img/posts/sports-event-calendar-duplicates.png" class="img-fluid" /> 

This gave me a quick win to make the code more resilient against source page changes in the future.

### Working Calendar

After running my script, the events are in my calendar:

<img src="/img/posts/sports-event-calendar-events.png" class="img-fluid" /> 

### Scheduling with Cron

Adding the following to my local crontab, let's me run it daily:
```
30 9 * * * /usr/bin/bash -c 'if [ -f /path/to/project/cbc-sports-calendar/events_creator.py ]; then pushd /path/to/project/cbc-sports-calendar && /usr/bin/python3 /path/to/project/cbc-sports-calendar/events_creator.py && popd; fi'
```
Of course, if the headless cron run encounters an authentication token expiry, it won't be able to pop open a browser window, but I can run it manually every once in a while.

## Conclusions

I don't feel I was "vibe coding" this entirely... to be honest, I did sneak over to StackOverflow occassionally.  However, I did find the generated code output and the problem solving, particularly with Google Cloud OAuth flow setup, done by Gemini was very helpful.  I can see how this has changed the practice and profession of programming forever. 
