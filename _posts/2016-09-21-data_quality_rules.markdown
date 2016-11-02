---
layout: post
title: Data Profiling with Rules
subtitle: advanced data quality with talend
date: 2016-09-21
header-img: img/headers/oregon_coastline.jpg
comments: true
published: false
---

This will be a deep dive look at analyzing data quality with [Talend Open Studio](https://www.talend.com/download/talend-open-studio#t2) using both Java and SQL rules.

### Column Set Analysis
As described in my [previous post]({{ site.url }}/2016/09/05/data_quality/), Talend performs basic column analysis which counts rows, nulls, duplicates, etc.  However, one can also add pattern matching to this analysis, using either pre-built patterns or custom ones.  The pre-built patterns include:

<img src="{{ site.url }}/img/posts/data_quality_rules_patterns.png" class="img-responsive" style="border: 1px solid gray; padding:10px"/> 

In our case, using the [Adventureworks sample database](https://github.com/lorint/AdventureWorks-for-Postgres) on PostgreSQL, let's match some attributes of the humanresources.vemployees view including email address, state codes, and zip code.

<img src="{{ site.url }}/img/posts/data_quality_rules_pattern_cols.png" class="img-responsive" style="border: 1px solid gray; padding:10px"/> 

Here are the results of executing a simpler job, analyzing only email addresses:

<img src="{{ site.url }}/img/posts/data_quality_rules_email1.png" class="img-responsive" style="border: 1px solid gray; padding:10px"/> 

<img src="{{ site.url }}/img/posts/data_quality_rules_email2.png" class="img-responsive" style="border: 1px solid gray; padding:10px"/> 

Unfortunately, I wasn't able to use the Data view to show me the reported 43 'not-match' records:

<img src="{{ site.url }}/img/posts/data_quality_rules_email2.png" class="img-responsive" style="border: 1px solid gray; padding:10px"/> 

### SQL-based Rules
https://help.talend.com/display/TalendOpenStudioforDataQualityUserGuide62EN/6.2.2+Creating+a+table+analysis+with+SQL+business+rules
 

### More in this series...
* [Analyzing Data Quality]({{ site.url }}/2016/09/05/data_quality/)
* [Data Visualization]({{site.url}}/2016/10/15/data-viz/)
