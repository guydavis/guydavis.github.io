---
layout: post
title: Anaconda Setup
subtitle: data science on windows
date: 2019-03-21
background: /img/headers/banff_valley.jpg
comments: true
published: true
---

After migrating to Windows on my old laptop and installing [WSL](/2019/02/28/windows_linux_subsystem), I also wanted to get up to speed on [Anaconda](https://www.anaconda.com/).  I'd previously used Anaconda as a simple Python install on Windows, but haven't had time to really get into the data science libraries it offers.

## Anaconda Install

[Downloading](https://www.anaconda.com/distribution/#download-section) and running the 64-bit Windows installer for Python 3.7 was straight-forward.  This gets one a good number of [default packages](https://docs.anaconda.com/anaconda/), with more available via the `conda` package manager. 

## Using Navigator

Available, from the Start menu, Anaconda Navigator launches a command window, and then opens a browser window to an interactive Python session.  Adding a simple print statement, saving it, and running yields:

<img src="/img/posts/anaconda_nav_helloworld.png" class="img-fluid" />

## Installing Packages

So, I thought to give this [CPU vs GPU test](https://course.fast.ai/gpu_tutorial.html) a try.  First off, this was unlikely to work on my crappy old laptop with only Intel integrated graphics:

<img src="/img/posts/anaconda_nav_speccy.png" class="img-fluid" />

I mean, [CUDA](https://developer.nvidia.com/how-to-cuda-c-cpp) specifically is built for Nvidia GPUs.  Even my recently built [budget gaming PC](/2018/11/09/budget_pc_gaming) with a decent [AMD APU](https://www.amd.com/en/products/apu/amd-ryzen-5-2400g) won't work with CUDA.  

So instead, I installed the CPU-only version of Pytorch, in an Anaconda command prompt (run as Administrator):

```
conda install pytorch-cpu torchvision-cpu -c pytorch
```

## Pytorch CPU/GPU Test

So with Pytorch installed, I returned to my Jupiter Notebook launched in Anaconda Navigator:

<img src="/img/posts/anaconda_nav_pytorch.png" class="img-fluid" />

As you can see, my old laptop very slowly executed the CPU test, but errored on the GPU test.  

## Conclusions

So it seems using a 5-year budget laptop ($300 CDN when new), may not be the path to performant data science and machine learning workflows.  :)

I could add a top of the line [Nvidia RTX 2080ti](https://www.nvidia.com/en-us/geforce/graphics-cards/rtx-2080-ti/) to our gaming PC for [nearly $2k](https://www.memoryexpress.com/Products/MX73400) CDN but that seems a waste of money.  To simply dabble, one need only [launch a cloud instance](https://course.fast.ai/start_gcp.html) and pay by use, a few hours at a time.  Up next...
