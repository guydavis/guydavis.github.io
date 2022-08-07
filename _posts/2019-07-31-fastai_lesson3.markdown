---
layout: post
title: Multi-label Classification
subtitle: fastai - lesson three
date: 2019-07-31
background: /img/headers/roman_colesium.jpg
comments: true
published: true
---

This covers my work on the third lesson of the [Fast AI course](https://course.fast.ai/).  Initial setup involved downloading a dataset from Kaggle which was a pain as the Jupyter notebook for the course doens't allow you to run everything from it, often resulting in tedious copy/pasting shell commands over to my GCloud instance:

<img src="/img/posts/fastai_lesson3_tedious_copypasta.png" class="img-fluid" />

Only later did I realize that Jupyter supports shell execution via the exclamation point.  So I should have been uncommenting the code, but leaving the '!' behind.  D'oh!

## Working with Data

The instructor covered the usefulness of the [datablock API](https://docs.fast.ai/data_block.html) in FastAI.  The method chaining offered by Python was used to good effect, resulting in terse but understandable data manipulation.  

<img src="/img/posts/fastai_lesson3_datablock_example.png" class="img-fluid" />

Even Python's support for partials came in handy here.

## Classification and Segmentation

Moving beyond the binary labelling of the [previous class](/2019/06/01/fastai_lesson2/), learning was performed to use multiple labels.  In the case of the satellite images, labels included agricultural land, forested, roads, etc.

Moving onto the next image set, the instructor showed that labels can actually be in the form of color-coding objects (via segmentation mask) on an image.  As before the learner was run, 

<img src="/img/posts/fastai_lesson3_segmentation_masking.png" class="img-fluid" />

## Takeaways

This class provided some good approaches to classification, re-iterating the importance of carefully selecting a workable learning rate during training.  In particular, he emphasized how initially selecting a high learning rates, followed by lowering of the rate during later training results in better model generalizations.

### Next in this series...
* [Lesson 4](/2019/08/17/fastai_lesson4/)