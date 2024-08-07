---
layout: post
title: Automated Roller Blinds
subtitle: ikea hacks edition
date: 2019-10-30
background: /img/headers/galatea_lakes.jpg
comments: true
published: true
---

This covers a DIY approach to automating an [Ikea roller blind ](https://www.ikea.com/us/en/p/bleking-roller-blind-red-brown-50459883/) via Google Home voice control.  In my case, I use it to cover a large TV in our living room during the day, but this would also work well on windows.

<img src="https://www.ikea.com/PIAimages/0806379_PE769919_S5.JPG?f=s "Ikea Bleking"" class="img-fluid" />

While Ikea just started offering new automated [FYRTUR](https://www.ikea.com/us/en/p/fyrtur-blackout-roller-blind-wireless-battery-operated-gray-90417462/) roller blinds, they require batteries and apparently have a buggy home automatation interface. Instead, for less cost, with this DIY approach, the blinds are hard-wired and work-well via remote control, phone app, and most importantly have Google Voice control.  I also needed a 60" wide blind, which Frytur doesn't offer.

## Adding a Motor to the Blind

So, along with the [Bleking blind](https://www.ikea.com/us/en/p/bleking-roller-blind-red-brown-50459883/), I ordered a [Rollerhouse blind motor](https://www.amazon.ca/gp/product/B074T2FC4B/) and [power supply](https://www.amazon.ca/gp/product/B07TZBDHMF/)

<img src="/img/posts/automated_roller_blinds1.jpg" class="img-fluid" />

First off, unscrew the ends and put aside the metal top brace as it won't be needed.

<img src="/img/posts/automated_roller_blinds2.jpg" class="img-fluid" />

Use a knife to pop out the plastic ends.

<img src="/img/posts/automated_roller_blinds3.jpg" class="img-fluid" />

Including the other end with spring:

<img src="/img/posts/automated_roller_blinds4.jpg" class="img-fluid" />

I used a hack saw to trim down the short tube, removing the wider edge lip.  Then, using a bit of my son's Batman hockey tape, I increased the diameter of the motor end and slid it into the Ikea tube piece.  

The tube piece has two small grooves running lengthwise which align with two small lengthwise bumps inside the metal roller blind tube.  This helps prevent the motor from slipping within the tube.  

<img src="/img/posts/automated_roller_blinds5.jpg" class="img-fluid" />

Friction-fit the small rotating cuff with cut tape at the end of the motor.

<img src="/img/posts/automated_roller_blinds8.jpg" class="img-fluid" />

<img src="/img/posts/automated_roller_blinds6.jpg" class="img-fluid" />

<img src="/img/posts/automated_roller_blinds7.jpg" class="img-fluid" />

## Configuring the Automation

After following the directions to pair the provided Rollerhouse remote with the blind, I setup the [Broadlink RM Pro](https://www.amazon.ca/BroadLink-Automation-Universal-Compatible-Smartphone/dp/B01GIXZDKO) to clone the RF remote signals of the original remote using the `ihc` app for Android on my phone.

<img src="/img/posts/automated_roller_blinds10.png" class="img-fluid" />

<img src="/img/posts/automated_roller_blinds9.png" class="img-fluid" />

Finally, I used the Google Home app to connect the roller blind via ihc in as a smart plug.

<img src="/img/posts/automated_roller_blinds12.png" class="img-fluid" />

Initially, tested by saying: `OK Google, turn the Roller Blind on`, but that's not what I want to say on a regular basis.  Instead, I set up a Routine keyed of `OK Google, turn on the TV` which:

1. Executes `OK Google, turn the Roller Blind on` to raise the blind
2. Executes a standard `Turn on the living room televsion` via Chromecast.

<img src="/img/posts/automated_roller_blinds11.png" class="img-fluid" />

So, all together, it looks something like:

<iframe width="560" height="315" src="https://www.youtube.com/embed/jXrZbQZBIYk" frameborder="0" gesture="media" allowfullscreen></iframe>

Now I just need to get that new TV...
