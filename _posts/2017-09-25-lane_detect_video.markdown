---
layout: post
title: Dashcam Lane Detection
subtitle: handling video
date: 2017-09-25
header-img: img/headers/smoky_highway_lanes.png
comments: true
published: true
---

Following my [first]({{ site.url }}/2017/05/21/py_lane_detect/) and [second]({{ site.url }}/2017/06/13/lane_detect_improved/) attempts at lane detection with [computer vision](http://opencv.org/) in Python, this third post will look at applying lane detection to dashcam video.

In my case, I've pulled a variety of footage from the [DOD 460W dashcam](https://dod-tech.ca/en/product/dod-ls460w/) in my [2007 Honda Fit](http://i2.cdn.turner.com/money/galleries/2008/autos/0806/gallery.cr_best_used_mpg/images/2008_honda_fit.jpg).  I tried to include highway and city routes, during both day and night.

# Improved Codebase
I am applying the approach by [Naoki Shibuya](https://github.com/naokishibuya/car-finding-lane-lines), which uses [moviepy](https://zulko.github.io/moviepy/) for splitting a video file into sequential images, and then applying the lane detection algorithm.  This draws red markers over detected lanes in dashcam footage.

The [Canny Edge Detection](https://github.com/guydavis/lane-detect/blob/master/lane_detect.py) algorithm worked well once I cropped out the yellow text my dashcam overlays on the footage from the area of interest.  However, it's not perfect as you see in this sample clip where:

* I change lanes and the right line detector goes wonky.
* I pass a turn off and the left lane marker vanishes.
* I pass a police officer writing a ticket to a fool in a jacked-up pickup truck.  

<iframe width="560" height="315" src="https://www.youtube.com/embed/M91KB01VBNs" frameborder="0" gesture="media" allowfullscreen></iframe>

# Conclusions
Overall, this algorithm does a pretty good job of detecting lanes in dashcam footage, however taking 30 minutes or more to process 3 minutes of dashcam footage isn't a reasonable approach.  I would not want to drive in that vehicle!  

## Next Steps
There are two directions I'd like to follow up on:
* Bundling up the current lane detection algortihm as a Docker image to scale it to process more video.
* Trying out a machine learning approach, potentially offering better detection than the static behavior of the [Canny algorithm](https://en.wikipedia.org/wiki/Canny_edge_detector).

### More in this series...
* [Lane Detection in Images]({{ site.url }}/2017/05/21/py_lane_detect/) - first attempt.
* [Improved Lane Detection]({{ site.url }}/2017/06/13/lane_detect_improved/) - improved approach.
* [Deploying in Docker]({{ site.url }}/2017/10/25/lane_detect_docker/) - bundling as a Docker image.
