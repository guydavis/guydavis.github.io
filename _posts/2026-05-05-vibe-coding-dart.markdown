---
layout: post                                                                                                                   
title: Vibe Coding Dart                                                                                                    
subtitle: with google antigravity                                                                                                 
date: 2026-05-05                                                                                                               
background: /img/headers/avalanche_lake.jpg                                                                             
comments: true                                                                                                                 
published: true                                                                
---

<style>
.device-bezel {
  width: 30%; 
  border: 8px solid #222; /* Simulates the phone frame */
  border-radius: 36px;    /* High radius for that "handheld" feel */
  background: #222;       /* Fills gaps if image doesn't perfectly fit */
  box-shadow: 0 20px 40px rgba(0,0,0,0.2);
}
</style>

## Introduction

My son recently was hired as a [Parliamentary Page](https://www.ourcommons.ca/About/Youth/Page-e.html)  for the [Canadian House of Commons](https://www.ourcommons.ca/Members/en/search) during his first year at the [University of Ottawa](https://www.uottawa.ca/faculty-law/common-law/programs/combined-programs/jd-bsocsc), starting this September. As part of his duties, he'll be delivering documents to MPs as requested, so he needs to know all the names of the [Members of Parliament](https://www.ourcommons.ca/Members/en/search) from their photo.  I decided to create a <a href="https://gavindavis.ca/memreps" target="_blank" rel="noopener">mobile flashcard app</a> to aid in his memorization.

## Vibe-Coding a Mobile Flutter App in Dart

While I am a backend developer in my day job, I have built web frontends like [Machinaris](/2021/06/29/machinaris-distributed/), a WebUI for Chia farming and plotting.  I've also done some mobile app development in the past.  However, I've never done any app development with the Dart programming language.  

I decided to try out [Google Antigravity](https://antigravity.dev/) to build this app.  Using Gemini 3 to generate the code, I was able to build a prototype in a few hours. I picked up Dart quite quickly, but using Gemini Flash, I found I really didn't need to code much at all. Rather, my role was reduced to that of customer, designer, and tester.  I would quickly run the app on my old Windows laptop, and then provide feedback to Gemini to improve the app.

Initially, I slapped together a Flutter app that ran on Android and iPhone, but quickly realized that it would be easier if I just served up a mobile web app instead.  Mainly because getting a niche application such as this listed in the Google and Apple app stores would be a significant challenge, involving developer fees, approval processes, and many official testers. 

## Pivoting to a Flutter Web App Instead

Thankfully, Flutter is a Dart framework that supports multiple platforms, including the web.  So with a few changes, I was able to get my app running in a web browser for parliamentary and legislative pages to practice memorizing the names of their representatives.  The initial results were promising.  

<img src="/img/posts/vibe-coding-dart-0.png" class="device-bezel" title="Creating Profile"/>

To start, a parliamentary page can enter their first name, choose app localization in either English or French (defaults to your browser's language), and then select the Canadian legislative body they want to memorize the members of.  In this case, I used the helpful online Represent API provided by the [Open North](https://opennorth.ca/) organization. 

<img src="/img/posts/vibe-coding-dart-1.png" class="device-bezel" title="Browse Screen"/>

 With all the recent by-elections, departures, and floor-crossings this past month though, I found the API was slightly out of date, so I added a post-API load enhancement that scraped the official legislative pages directly. This ensured the data was absolutely up to date.  

* [House of Commons](https://www.ourcommons.ca/)
* [Canadian Senate](https://sencanada.ca/)
* [British Columba](https://www.leg.bc.ca/)
* [Alberta](https://www.assembly.ab.ca/)
* [Saskatchewan](https://www.legassembly.sk.ca/)
* [Manitoba](https://www.gov.mb.ca/legislature)
* [Ontario](https://www.ola.org/)
* [Québec](https://www.assnat.qc.ca/)
* [New Brunswick](https://www.legnb.ca/)
* [Nova Scotia](https://nslegislature.ca/)
* [Newfoundland and Labrador](https://www.assembly.nl.ca/)
* [Prince Edward Island](https://www.assembly.pe.ca/)
* [Nunavut](https://www.assembly.nu.ca/)
* [Northwest Territories](https://www.ntlegislativeassembly.ca/)
* [Yukon](https://yukonassembly.ca/)

In fact, I added the Senate of Canada as OpenNorth didn't even list it.  This should be helpful as [Senate Pages](https://www.ourcommons.ca/About/Youth/Page-e.html) are also expected to know their 105 Senators.  

<img src="/img/posts/vibe-coding-dart-5.png" class="device-bezel" title="Settings Screen"/>

To aid memoriziation, the quizzes progress from easy to hard, eventually reaching the challenge for the parliamentary pages to correctly identify the last name of the current 343 Members of Parliament from their photo. 

<img src="/img/posts/vibe-coding-dart-2.png" class="device-bezel" title="Quizzes Screen"/> <img src="/img/posts/vibe-coding-dart-3.png" class="device-bezel" title="Name Match Quiz"/>

<img src="/img/posts/vibe-coding-dart-9.png" class="device-bezel" title="Party Match Quiz"/> <img src="/img/posts/vibe-coding-dart-4.png" class="device-bezel" title="Name Recall Quiz"/>

To speed the learning process, I adopted the [Free Spaced Repetition Scheduler](https://en.wikipedia.org/wiki/Spaced_repetition) (FSRS) memorization algorithm to select the questions for review. This ensures that members you have previously incorrectly identified are shown more frequently in upcoming questions.  Interestly, after testing this algorithm, I found that I needed to periodically alternate back to random-selection mode to avoid getting stuck in a rut with only a few of the members.  With over 300 faces to memorize, the app needs to balance between showing fresh faces and reinforcing weakly remembered ones.

<img src="/img/posts/vibe-coding-dart-4.png" class="device-bezel" title="Face Match Quiz"/>

## Adding a Backend

Using Firebase as a backend, I was able to add a few more features to the app, including a global leaderboard to let users compare their progress with others.

<img src="/img/posts/vibe-coding-dart-7.png" class="device-bezel" title="Quiz Results"/> <img src="/img/posts/vibe-coding-dart-8.png" class="device-bezel" title="Leaderboard"/>

Quiz results are held in Firestore: 

<img src="/img/posts/vibe-coding-dart-6.png" class="img-fluid" title="Firestore Data"/>

Other Firebase functions included image and data proxying.  As well, the backend provides reCaptcha protection against bots flooding the system.  

## Conclusion

I was pretty happy with the [MemoReps flashcard app](https://gavindavis.ca/memreps). It was a fun project and I learned a lot about Flutter and programming in Dart. Kind of astounding how fast one can throw together a functional app with current AI tools.  It's quite clear that the role of the software developer has moved onto managing and directing AI, rather than actually writing the code.  I'm looking forward to seeing what else AI can do.

### More in this series...
* [Google Gemini Studying](/2025/06/20/google-gemini-studying) - Generating quizzes for school.
