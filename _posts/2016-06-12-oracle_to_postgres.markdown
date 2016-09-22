---
layout: post
title: Oracle into PostgreSQL
subtitle: data loading with talend
date: 2016-06-12
header-img: img/headers/dino_sunset.jpg
comments: true
published: false
---

My preferred data management platform rests upon the [PostgreSQL](https://www.postgresql.org/) database.  The most recent releases have been truly impressive, especially when you consider that the Postgres database is [free software](https://www.postgresql.org/about/).  

Using Postgres for data management means integrating disparate data sources such as other databases, spreadsheets, flat files, etc into Postgres.  There are two primary mechanisms for this: data loading and data virtualization.  I'll cover Postgres data loading in this post, including options for extraction, transformation, and loading (ETL).  

## Oracle to Postgres with Talend ETL

[Talend](https://www.talend.com/) offers a [data integration product](https://www.talend.com/products/data-integration) which allows for data transfers with cleaning.  These can be created and tested in a design studio tool, then automated for regular execution on the server.  For this example, I'll be extracting data from the [Oracle HR](https://docs.oracle.com/cd/B13789_01/server.101/b10771/scripts003.htm) demo schema into Postgres.

## SQL Server to Postgres with RapidMiner

The data science platform [RapidMiner](https://rapidminer.com/) also offers ETL capabilities.  Again these can be created and tested in a design studio tool, then automated for regular execution on the server. For this example, I'll be extracting data from the [NorthWind](https://northwinddatabase.codeplex.com/) demo schema into Postgres.

## MySQL to Postgres with Python

Of course, one doesn't need to rely on GUI tools for ETL jobs.  Here's a short Python script that can be used to extract data from the [MySQL Sakila](https://dev.mysql.com/doc/sakila/en/) demo schema.

```python 

```

 

