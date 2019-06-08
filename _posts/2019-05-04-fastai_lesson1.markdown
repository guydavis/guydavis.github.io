---
layout: post
title: Image Classification
subtitle: fastai - lesson one
date: 2019-05-04
header-img: img/headers/cactus_flower.jpg
comments: true
published: false
---

This covers my work on the first lesson of the [Fast AI course](https://course.fast.ai/).

## Relaunching Cloud GPU System

Following the FastAI guide on [returning to work](https://course.fast.ai/update_gcp.html), I can easily relaunch the [GCP instance created last month]({{ site.url }}/2019/04/01/fastai_gcp/).  Since it's been awhile, I perform some [basic updates](https://course.fast.ai/start_gcp.html#step-4-access-fastai-materials-and-update-packages).

Launching my Ubuntu shell on Windows 10, I can proxy the Juypter notebook to my local browser:
```
export ZONE='us-west2-b'
export INSTANCE_NAME='my-fastai-instance'
gcloud compute ssh --zone=$ZONE jupyter@$INSTANCE_NAME -- -L 8080:localhost:8080
```

## FastAI - Lesson 1

Getting started with the lessons, I was quite impressed by the power of dynamic Jupyter notebooks.  The interactive browser view was great for quickly working with data and training models. 

![Lesson 1 - Show Batch]({{ site.url }}/img/posts/fastai_lesson1_show_batch.png)

The code editor even offered code completion via keyboard shortcut.  Very slick! 

## Classifier

The FastAI library made using the [Resnet model](https://en.wikipedia.org/wiki/Residual_neural_network) quite simple.  As the instructor mentioned, this model is still a very [high-performing image classifier](https://dawn.cs.stanford.edu/benchmark/v1/index.html), even today. 

## Takeaways

This was a good introduction to transfer learning that trains a machine learning model using a labelled data set, in this case: cats vs dogs.  The trained model can then be validated using a test set, measuring the accuracy via loss function.  Really emphasized the importance of iteratively improving the model, based on measured accuracy.

Another interesting tidbit was the instructor's discussion of GPU VRAM size for training these models.  The [GCP instance](https://cloud.google.com/compute/docs/gpus/) I'm using has a single Nvidia Tesla P4 GPU offering 8 GB GDDR5 memory.  In the context of gaming GPUs these days, the range seems to be 6 GB in an NVidia [RTX 2060](https://www.nvidia.com/en-us/geforce/graphics-cards/rtx-2060/) up to 16 GB in the AMD Radeon VII.  Workstation cards such as the [Nvidia Titan](https://www.nvidia.com/en-us/titan/titan-rtx/) offer 24 GB, but are very expensive.  Seems like there is a real opening here for an entry-level GPU that can be used for both gaming and hobbyist machine-learning.

## Future

While this supervised approach to image classification is interesting, I wonder how well an unsupervised approach works.  I'm guessing that the labelled training set provided to the supervised learner gives it a leg up over unsupervised alternatives.

