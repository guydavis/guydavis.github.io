---
layout: post
title: Optical Character Recognition  
subtitle: of scanned tabular images
date: 2018-02-28
header-img: img/headers/x-country.jpg
comments: true
published: true
---

I recently had an opportunity to research options for extracting tabular data from scanned PDF images.  Turns out this a very challenging problem, given the widely varying layouts and scan quality of typical examples. I did find a [very good approach by Markus Konrad](https://datascience.blog.wzb.eu/2017/02/16/data-mining-ocr-pdfs-using-pdftabextract-to-liberate-tabular-data-from-scanned-documents/) that searched for table border lines using the same algorithm I recently used for finding [road lane markers in dashcam footage]({{ site.url }}/2017/06/13/lane_detect_improved/). Here's a sample input:

![Output]({{ site.url }}/img/posts/ocr_table_sample.png)

Clearly a challenge!

# Optical Character Recognition
While the above example showed the importance of pre-processing the image before attempting OCR, I thought it would be interesting to attempt OCR with other options.

## Tesseract
A good option on Linux is the venerable [Tesseract](https://github.com/tesseract-ocr/tesseract/) project.  Quickly installed on Ubuntu, I converted the PDF to PNG with ImageMagick, and then executed the Tesseract OCR:

```
sudo apt install tesseract-ocr
convert -density 300 samples/ALA1934_RR-excerpt.pdf -resize 25% samples/ALA1934_RR-excerpt.png
tesseract --tessdata-dir /usr/share/tesseract-ocr samples/ALA1934_RR-excerpt.png outputbase -l eng -psm 3
```

Unforunately, the output from default Tesseract on this sample was:

```
mum?” , w xm-Alt‘ynun4mmum4
...
Amman: rm- vmlahmae Blillcr dumb die Ala Anwigzn-AG.
,.
```

Hmm, not going to cut it...

## Tesseract LSTM

Next up I tried the new alpha version of Tesseract that uses an [LSTM neural networks](https://en.wikipedia.org/wiki/Long_short-term_memory) for improved performance and quality of OCR.  Unfortunately, in early 2018, I wasn't able to make it work, however this looks like a promising avenue so I'll be watching as Tesseract improves their implementation over time.

## Google Cloud Vision

Next, I gave Google's online API for image analysis, named [Cloud Vision](https://cloud.google.com/vision/) a try.  Within a few seconds of uploading the PNG image, I was shown the following results:

![Output]({{ site.url }}/img/posts/ocr_table_gcv_labels.png)

![Output]({{ site.url }}/img/posts/ocr_table_gcv_doc.png)

# Conclusion

So for 'off-the-shelf' options Google Cloud Vision seems a promising alternative, though be mindful it is a [commercial offering](https://cloud.google.com/vision/pricing) where one pays by the API call.  I can definitely see that true tabular data extraction would require a [multi-stage pipeline with manual review](https://datascience.blog.wzb.eu/2017/02/16/data-mining-ocr-pdfs-using-pdftabextract-to-liberate-tabular-data-from-scanned-documents/). 

## Next Steps

I'd like to try more test images with Google Cloud Vision to see how it performs overall.  As well, I hope to revisit Tesseract LSTM as it moves to a full release. 

### More in this series...
* [Tabular Data Extraction with GCV]({{ site.url }}/2018/03/06/tabular_ocr_gcv) - further testing of Google Cloud Vision.
