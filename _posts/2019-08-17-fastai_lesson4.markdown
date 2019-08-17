---
layout: post
title: Natural Language Processing
subtitle: fastai - lesson four
date: 2019-08-17
header-img: img/headers/iceline_trail.jpg
comments: true
published: true
---

This covers my work on the fourth lesson of the [Fast AI course](https://course.fast.ai/).  

## Natural Language Processing (NLP)

The model used was initially trained on the Wikipedia test set (WT103).  Very interesting to hear that what was state of the art last year, has been bundled into the base FastAI library this year.  Fast-moving field...

![Lesson 4 - Tedious Copy Pasta]({{ site.url }}/img/posts/fastai_lesson4_nlp_approach.png)

Steps involved:
1. Train model on a large corpus of text, in this case the Wikipedia archive.
1. Fine-tune the model on *target corpus* text, a training set in your particular domain.
1. Remove the *encoder* in this fine tuned language model, and replace it with a *classifier*. 
1. Then fine-tune this model for the final classification task (in this case, sentiment analysis).

## Takeaways

Obviously, one needs to stick to the same language between steps 1 and 2 above.  Would be interesting to see how much the model fails if initially trained in English, then applied to Korean for example.

Interesting coverage of other types of data such as tabular (aka spreadsheet/database) and collaborative filtering as well.

### Next in this series...
* [Lesson 5]({{ site.url }}/2019/08/31/fastai_lesson5/)
