---
layout: post
title: Excel into PostgreSQL
subtitle: sample excel with rapidminer
date: 2016-06-29
header-img: img/headers/biking_road.jpg
comments: true
---

Continuing my series on data import into [PostgreSQL](https://www.postgresql.org/) database, this covers a quick way of getting Excel data into Postgres.

## Import Excel with RapidMiner

Next, let's look at extracting Excel spreadsheet data into Postgres using RapidMiner. Here's a sample spreadsheet.

![Excel]({{ site.url }}/img/posts/etl_spreadsheet_excel.png)

The RapidMiner process looks likes this:

![Process]({{ site.url }}/img/posts/etl_spreadsheet_process.png)

## Export to Postgres using RapidMiner

We've created a destination schema in Postgres with a table to hold the data:

```
create database excel_import;
\connect excel_import;
create table orders (
        id integer primary key, 
        orderdate timestamp, 
        region varchar(255), 
        rep varchar(255), 
        item varchar(255), 
        units integer, 
        unitcost numeric(10,2), 
        total money
);
```

Creating the Postgres database connection is easy in RapidMiner:

![Connection]({{ site.url }}/img/posts/etl_spreadsheet_jdbc.png)

Executing the process reads the spreadsheet and stores the data into our new Postgres table:

![Orders]({{ site.url }}/img/posts/etl_spreadsheet_pg_table.png)
 