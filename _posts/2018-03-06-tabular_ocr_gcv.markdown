---
layout: post
title: Tabular Data Extraction 
subtitle: with cloud vision
date: 2018-03-06
background: /img/headers/zoo_xmas_tree.jpg
comments: true
published: true
---

After some initial attempts around tabular OCR, I wanted to explore further the capabilities of Google's [Cloud Vision](https://cloud.google.com/vision/) API for [OCR processing jobs](https://cloud.google.com/vision/docs/ocr).

# More Samples

The following are some additional tabular data tables in PNG format, with results returned from the Cloud Vision OCR engine below.

# Sample 1

The first sample is a fairly clear inventory table with readable text.

<img src="/img/posts/ocr_table2_inventory.png" class="img-fluid" />

<img src="/img/posts/ocr_table2_inventory_result.png" class="img-fluid" />

<img src="/img/posts/ocr_table2_inventory_doc.png" class="img-fluid" />

# Sample 2

The second sample is a less clear extract from an old book.

<img src="/img/posts/ocr_table2_names.png" class="img-fluid" />

<img src="/img/posts/ocr_table2_names_result.png" class="img-fluid" />

<img src="/img/posts/ocr_table2_names_doc.png" class="img-fluid" />


# Conclusion
Overall, Google Cloud Vision seems like a very capable approach for quickly solving OCR tasks.  Definitely worth keeping an eye on during project evaluation stages.

## Next Steps
Next, I'm going to give Tesseract's new LSTM support another try.  Hopefully, they've made some progress towards a final release in the past few months. 

### More in this series...
* [Optical Character Recognition](/2018/02/28/tabular-ocr-options) - first attempt, investigating options.
