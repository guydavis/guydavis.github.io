---
layout: post
title: SQLServer into PostgreSQL
subtitle: northwind data with rapidminer
date: 2016-06-16
header-img: img/headers/hatley_castle.jpg
comments: true
published: false
---

My preferred data management platform rests upon the [PostgreSQL](https://www.postgresql.org/) database.  The most recent releases have been truly impressive, especially when you consider that the Postgres database is [free software](https://www.postgresql.org/about/).  

Using Postgres for data management means integrating disparate data sources such as other databases, spreadsheets, flat files, etc into Postgres.  There are two primary mechanisms for this: data loading and data virtualization.  I'll cover Postgres data loading in this post, including options for extraction, transformation, and loading (ETL).  

## SQL Server to Postgres with RapidMiner

The data science platform [RapidMiner](https://rapidminer.com/) also offers ETL capabilities.  Again these can be created and tested in a design studio tool, then automated for regular execution on the server. For this example, I'll be extracting data from the [NorthWind](https://northwinddatabase.codeplex.com/) demo schema into Postgres.

