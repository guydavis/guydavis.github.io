---
layout: post
title: More Lane Detection
subtitle: adopting a better strategy
date: 2017-06-13
background: /img/headers/prince_of_wales_winter.jpg
comments: true
published: true
---

This is a follow-up to my [first attempt](/2017/05/21/py_lane_detect/) at lane detection, based on a [KDNuggets article](http://www.kdnuggets.com/2017/07/road-lane-line-detection-using-computer-vision-models.html), that resulted in some hilarious results such as this:
<img src="/img/posts/lane_detect_sad_path1.gif" class="img-fluid" />

Armed with some new dashcam samples from [Google Images](https://www.google.ca/search?safe=active&biw=1855&bih=917&tbm=isch&sa=1&q=dashcam+roadway+lane&oq=dashcam+roadway+lane&gs_l=psy-ab.3...0.0.0.5544.0.0.0.0.0.0.0.0..0.0....0...1..64.psy-ab..0.0.0.5vmkNTvVB0Y), I discovered better work by [Naoki Shibuya](https://github.com/naokishibuya/car-finding-lane-lines) for identifying the yellow and white lines within a more reasonable area of interest.

# Improved Codebase
My goal in this post was to evaluate this new approach to [lane detection](https://github.com/guydavis/lane-detect/blob/master/lane_detect.py).  On the original image, lanes detected nicely again:
<img src="/img/posts/lane_detect2_happy_path.gif" class="img-fluid" />

The next test was to see if an image that failed with the [previous approach](/2017/05/21/py_lane_detect/), would properly detect lanes. 
<img src="/img/posts/lane_detect2_img5_passed.gif" class="img-fluid" /> 

Another example of successful detection, this time at night:
<img src="/img/posts/lane_detect2_img16_passed.gif" class="img-fluid" /> 

# Conclusions
Overall, I'm quite pleased by the improvement in lane detection offered by this approach from [Naoki Shibuya](https://github.com/naokishibuya/car-finding-lane-lines).  By better identifying the white and yellow line colors, along with improved area of interest selection, better results were obtained.

## Next Steps
However, there is still room for improvement as many of the sample images still failed to identify lines or detected lanes incorrectly.  Notable is number of lines detected at nearly horizontal, at 90 degrees to the direction of travel. 
<img src="/img/posts/lane_detect2_img13_passed.gif" class="img-fluid" />  

### More in this series...
* [Lane Detection in Images](/2017/05/21/py_lane_detect/) - first attempt.
* [Handling Dashcam Footage](/2017/09/25/lane_detect_video/) - processing video.
* [Deploying in Docker](/2017/10/16/lane_detect_docker/) - bundling as a Docker image.
* [Running on Google Cloud](/2017/11/24/lane_detect_cloud_gke/) - scaling on GKE.
* [Running on Microsoft Cloud](/2017/12/17/lane_detect_cloud_azure/) - scaling on Azure.
