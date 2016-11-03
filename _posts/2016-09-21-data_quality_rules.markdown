---
layout: post
title: Data Profiling with Rules
subtitle: advanced data quality with talend
date: 2016-09-21
header-img: img/headers/oregon_coastline.jpg
comments: true
published: false
---

This will be a deep dive look at analyzing data quality with [Talend Open Studio](https://www.talend.com/download/talend-open-studio#t2) using patterns, indicators, and rules.

## Patterns
As described in my [previous post]({{ site.url }}/2016/09/05/data_quality/), Talend performs basic column analysis which counts rows, nulls, duplicates, etc.  However, one can also add pattern matching to this analysis, using either pre-built patterns or custom ones.  The pre-built patterns include:

<img src="{{ site.url }}/img/posts/data_quality_rules_patterns.png" class="img-responsive" style="border: 1px solid gray; padding:10px"/> 

In our case, using the [Adventureworks sample database](https://github.com/lorint/AdventureWorks-for-Postgres) on PostgreSQL, let's match some attributes of the humanresources.vemployees view including email address, state codes, and zip code.

<img src="{{ site.url }}/img/posts/data_quality_rules_pattern_cols.png" class="img-responsive" style="border: 1px solid gray; padding:10px"/> 

Here are the results of executing a simpler job, analyzing only email addresses:

<img src="{{ site.url }}/img/posts/data_quality_rules_email1.png" class="img-responsive" style="border: 1px solid gray; padding:10px"/> 

<img src="{{ site.url }}/img/posts/data_quality_rules_email2.png" class="img-responsive" style="border: 1px solid gray; padding:10px"/> 

Unfortunately, I wasn't able to use the Data view to show me the reported 43 'not-match' records:

<img src="{{ site.url }}/img/posts/data_quality_rules_email2.png" class="img-responsive" style="border: 1px solid gray; padding:10px"/> 

## Indicators

## Rules
Talend offers two types of rules.  The first are match rules, used to identify duplication within a data source and also to link records across data sources.  Secondly, a set of SQL rules is available to flag records, possibly from a table join, meeting a certain criteria.

### Match Rules

### SQL Rules
Talend's 'Table Analysis' job can be executed with [SQL-based profiling rules](https://help.talend.com/display/TalendOpenStudioforDataQualityUserGuide62EN/6.2.2+Creating+a+table+analysis+with+SQL+business+rules).  The rules engine will issue SQL queries against the database to find records which meet the supplied criteria.  Here's a simple example of finding large sales orders in the sales.salesorderheader table: 

<img src="{{ site.url }}/img/posts/data_quality_rules_sql1.png" class="img-responsive" style="border: 1px solid gray; padding:10px"/> 

When run, this job returns a results listing showing that roughly 1/3 of sales orders exceed the $2000 threshold.

<img src="{{ site.url }}/img/posts/data_quality_rules_sql2.png" class="img-responsive" style="border: 1px solid gray; padding:10px"/> 

<img src="{{ site.url }}/img/posts/data_quality_rules_sql3.png" class="img-responsive" style="border: 1px solid gray; padding:10px"/> 

A bit of a hidden feature is to right-click on the stacked bar chart ('matching' section) to see the actual data rows that were flagged by this profiling rule.

## Summary
Talend ships with a default set of patterns, indicators, and rules.  These can be added to in your project by defining your own.  As well, one can import/export user-created libraries via the Exchange in the left-side project tree:

<img src="{{ site.url }}/img/posts/data_quality_rules_sql3.png" class="img-responsive" style="border: 1px solid gray; padding:10px"/> 

While it does take a while to become familiar with Talend Open Studio, it's well worth the effort to gain a powerful tool in your data management toolbox.

### More in this series...
* [Analyzing Data Quality]({{ site.url }}/2016/09/05/data_quality/)
* [Data Visualization]({{site.url}}/2016/10/15/data-viz/)
