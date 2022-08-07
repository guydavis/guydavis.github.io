---
layout: post
title: Lane Detection in Docker
subtitle: publishing an image
date: 2017-10-16
background: /img/headers/sydney_opera.jpg
comments: true
published: true
---

To scale up the [lane-detection algorithm](/2017/09/25/lane_detect_video/) to handle more video, it first needs to be published as a Docker image for easy deployment to cloud environments.  This post covers bundling a Python microservice by building it on [Docker Cloud](https://cloud.docker.com/swarm/guydavis/) from its [repo on Github](https://github.com/guydavis/lane-detect).

Drawing on [OpenCV](http://opencv.org/) and [moviepy](https://zulko.github.io/moviepy/), this algorithm from [Naoki Shibuya](https://github.com/naokishibuya/car-finding-lane-lines) draws red markers over detected lanes in dashcam footage as shown below:

<iframe width="560" height="315" src="https://www.youtube.com/embed/M91KB01VBNs" frameborder="0" gesture="media" allowfullscreen></iframe>

## Dockerfile
```
FROM ubuntu:16.04

# Update and install dependencies
RUN apt-get update -y 
RUN apt-get upgrade -y
RUN apt-get dist-upgrade -y
RUN apt-get install -y build-essential cmake pkg-config \
                libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev \
                libavcodec-dev libavformat-dev libswscale-dev libv4l-dev  \
                libxvidcore-dev libx264-dev imagemagick \
                libgtk-3-dev libatlas-base-dev gfortran 
RUN apt-get install -y python2.7-dev python3.5-dev python-opencv python3-tk \
                python-pip python3-pip 
RUN apt-get autoremove -y
RUN pip install --upgrade pip && pip3 install --upgrade pip

# Install Python3 modules
WORKDIR /opt
COPY requirements.txt .
RUN pip3 install -r requirements.txt
RUN python3 -c "import imageio; imageio.plugins.ffmpeg.download()"

COPY lane_detect.py .
ENTRYPOINT ["/usr/bin/python3", "lane_detect.py"]
CMD ["images/*", "videos/*"]
```

## Docker Build
The Docker build was first done locally with 

```
    docker build -t guydavis/lane-detect .
```

## Docker Run
With some local image data mounted for the Docker container, output was saved into another volume:

```
    docker run -v $PWD/images:/opt/images -v $PWD/output:/opt/output \  
        guydavis/lane-detect images/mysnapshot.jpg
```

[<img src="/img/posts/lane_detect_docker_img.png" class="img-fluid" />

```
    docker run -v $PWD/videos:/opt/videos -v $PWD/output:/opt/output \
        guydavis/lane-detect videos/mydashcam.mov
```
[<img src="/img/posts/lane_detect_docker_vid.png" class="img-fluid" />

The first time I ran this, the Python Tkinter library complained about lack of a DISPLAY environment.  This worked when I ran Python directly on my Ubuntu laptop, but fails when running headless in a Docker container.  The trick was to add this line beginning of the Python script to avoid the DISPLAY error:

```
    import matplotlib
    matplotlib.use('Agg')
```

## Docker Cloud Build
Once I'd tested on my local machine, I pushed to Github and a Docker Cloud build kicked off automatically:
[<img src="/img/posts/lane_detect_docker_cloud_build.png" class="img-fluid" />

# Conclusions
Moving the lane detection algorithm to a Docker image makes for a repeatable and immutable deployment.  By encapsulating the various Python, OpenCV, and Imagemagick libraries the entire package is more portable now.
 
## Next Steps
Now that the lane detection algorithm is containerized, I'll next deploy it to cloud providers to process more video in a cluster of workers. 

### More in this series...
* [Lane Detection in Images](/2017/05/21/py_lane_detect/) - first attempt.
* [Improved Lane Detection](/2017/06/13/lane_detect_improved/) - improved approach.
* [Handling Dashcam Footage](/2017/09/25/lane_detect_video/) - processing video.
* [Running on Google Cloud](/2017/11/24/lane_detect_cloud_gke/) - scaling on GKE.
* [Running on Microsoft Cloud](/2017/12/17/lane_detect_cloud_azure/) - scaling on Azure.
