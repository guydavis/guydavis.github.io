---
layout: post
title: Installing Python
subtitle: for machine learning and data science
date: 2016-03-23
header-img: img/headers/maui_kiteboarder.jpg
comments: true
---

It's been over a decade since I last worked with the Python programming language on day-to-day basis, but it's pretty clear from the libraries, tutorials, and projects that Python is the defacto standard for data science and machine learning.  Here's how to get up and running, on both Windows and Linux, with the latest toolkits.

## Windows (10 Desktop)
1. Download and install [Anaconda](https://docs.continuum.io/anaconda/install#id5) with Python 3.5.
2. `pip install theano algopy` from the Anaconda shell.

NOTE:  Windows is not supported for TensorFlow currently.

## Linux (Ubuntu 14.04 LTS)
1. `sudo apt-get install python3-setuptools`
2. `sudo easy_install3 pip`
3. `sudo apt-get install python 3.5-dev`
4. `sudo apt-get install python3.4-dev`
5. `sudo pip3 install theano scikit-learn algopy pandas https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.9.0-cp34-cp34m-linux_x86_64.whl`

NOTE: These directions worked in June 2016, expect the versions to be different later on.

## What's Installed?
Following these instructions will give you an isolated install of Python 3 with lots of great libraries, ready to go:

- numpy: [Numerical Python](http://www.numpy.org/) library offering linear algebra and useful matrix functions.
- scipy: [Scientific Python](https://www.scipy.org/) library with many useful numerical routines.
- algopy: [Algorithmic Differentiation](https://pythonhosted.org/algopy/) library for evaluation of higher-order derivatives. 
- pandas: [Pandas](http://pandas.pydata.org/) is great for data analysis and manipulation.
- sklearn: [Scikit Learn](http://scikit-learn.org/stable/index.html) offers machine learning algorithms.
- theano: [Theano](http://deeplearning.net/software/theano/) offers deep learning algorithms, building on numpy.
- tensorflow: [TensorFlow](https://www.tensorflow.org/), from Google, offers numerical computation using data flow graphs.

To test out a successful install, try `import theano, numpy, scipy, algopy, sklearn, pandas, tensorflow` in the python shell.  No errors, means a successful install.  I'll be delving into the use of these tools in future posts.