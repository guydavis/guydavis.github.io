---
layout: post
title: Stochastic Gradient Descent
subtitle: fastai - lesson two
date: 2019-06-01
background: /img/headers/crandall_lake.jpg
comments: true
published: true
---

This covers my work on the second lesson of the [Fast AI course](https://course.fast.ai/).  The lesson looked at both data prep/cleaning and then started into SGD.

### Data Prep and Cleaning

Drawing on my old days working with [data quality software](/2016/09/05/data_quality/), this lesson emphasized the importance of good data sets, in particular good training sets.  Often a good scripting language, such as Python, is ideal for the wrangling required to get data ready for your project.

In this example, fast.ai library provides verification:

<img src="/img/posts/fastai_lesson2_verify_images.png" class="img-fluid" />

and, in this case, visual validation:

<img src="/img/posts/fastai_lesson2_validate_images.png" class="img-fluid" />

### Stochastic Gradient Descent

Next up, the instructor covered the basic data structures we'd be using: namely tensors which just multi-dimensional matrices.  Using regression, we then attempted to find functions that could predict a simple set of data while minimizing the mean-squared error. 

<img src="/img/posts/fastai_lesson2_sample_data.png" class="img-fluid" />

The beauty of [stochastic gradient descent](https://en.wikipedia.org/wiki/Stochastic_gradient_descent) is its iterative approach to optimizing a function to match the data.  In particular, SGD uses a randomly (stochastic) selected search path, but measures each step along the way for decreasing error.

## Takeaways

In this lesson, we then extended from the simple function example, to a classifying function for teddy bears, using mini-batches to ensure a performant search.  At the end, we had a decent machine learning algorithm (aka a function) that could pretty reasonably identify teddy bears in an image.

### Next in this series...
* [Lesson 3](/2019/07/31/fastai_lesson3/)