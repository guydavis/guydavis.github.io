---
layout: post
title: Dashcam Lane Detection
subtitle: handling video
date: 2017-09-25
background: /img/headers/smoky_highway_lanes.png
comments: true
published: true
---

Following my [first](/2017/05/21/py_lane_detect/) and [second](/2017/06/13/lane_detect_improved/) attempts at lane detection with [computer vision](http://opencv.org/) in Python, this third post will look at applying lane detection to dashcam video.

In my case, I've pulled a variety of footage from the [DOD 460W dashcam](https://dod-tech.ca/en/product/dod-ls460w/) in my [2007 Honda Fit](http://i2.cdn.turner.com/money/galleries/2008/autos/0806/gallery.cr_best_used_mpg/images/2008_honda_fit.jpg).  I tried to include highway and city routes, during both day and night.

# Improved Codebase
I am applying the approach by [Naoki Shibuya](https://github.com/naokishibuya/car-finding-lane-lines), which uses [moviepy](https://zulko.github.io/moviepy/) for splitting a video file into sequential images, and then applying the lane detection algorithm.  This draws red markers over detected lanes in dashcam footage.

```
QUEUE_LENGTH=50

class LaneDetector:
    def __init__(self):
        self.left_lines  = deque(maxlen=QUEUE_LENGTH)
        self.right_lines = deque(maxlen=QUEUE_LENGTH)

    def mean_line(self, line, lines):
        if line is not None:
            lines.append(line)
        if len(lines)>0:
            line = np.mean(lines, axis=0, dtype=np.int32)
            line = tuple(map(tuple, line))
        return line

    def process(self, image):
        try:
            white_yellow = select_white_yellow(image)
            gray         = convert_gray_scale(white_yellow)
            smooth_gray  = apply_smoothing(gray)
            edges        = detect_edges(smooth_gray)
            regions      = select_region(edges)
            lines        = hough_lines(regions)
            left_line, right_line = lane_lines(image, lines)
            left_line  = self.mean_line(left_line,  self.left_lines)
            right_line = self.mean_line(right_line, self.right_lines)
            return draw_lane_lines(image, (left_line, right_line))
        except:
            #traceback.print_exc()
            return image

def process_video(dirpath, video_file):
    video_outfile = os.path.splitext(video_file)[0] + '.mp4'
    detector = LaneDetector()
    clip = VideoFileClip(os.path.join(dirpath, video_file))
    processed = clip.fl_image(detector.process)
    print(os.path.join('output', video_file))
    processed.write_videofile(os.path.join('output', video_outfile), audio=False)
    
```

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
* [Lane Detection in Images](/2017/05/21/py_lane_detect/) - first attempt.
* [Improved Lane Detection](/2017/06/13/lane_detect_improved/) - improved approach.
* [Deploying in Docker](/2017/10/16/lane_detect_docker/) - bundling as a Docker image.
* [Running on Google Cloud](/2017/11/24/lane_detect_cloud_gke/) - scaling on GKE.
* [Running on Microsoft Cloud](/2017/12/17/lane_detect_cloud_azure/) - scaling on Azure.
