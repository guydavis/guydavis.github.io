---
layout: post
title: Excel into PostgreSQL
subtitle: imputing missing values with rapidminer
date: 2016-06-29
background: /img/headers/biking_on_road.jpg
comments: true
---

Continuing on data import into [PostgreSQL](https://www.postgresql.org/) database, this covers a quick way of loading Excel data while guessing (aka "imputing") missing values.  In this case, I'll use RapidMiner's [Impute Missing Values](http://docs.rapidminer.com/studio/operators/cleansing/missing/impute_missing_values.html) operator with a [k-nearest neighbors](https://en.wikipedia.org/wiki/K-nearest_neighbors_algorithm) learning algorithm.

## Import Excel with RapidMiner

Here's a sample sales spreadsheet to import.  Note, that some of the Region values are missing, but can be guessed at from other records.

<img src="/img/posts/etl_spreadsheet_excel.png" class="img-fluid" />

The RapidMiner top-level process looks likes this:

<img src="/img/posts/etl_spreadsheet_process.png" class="img-fluid" />

However, the Impute Values operator takes a [sub-process](http://docs.rapidminer.com/studio/operators/utility/subprocess.html), a learning model that can make an educated guess at the missing values, based on surrounding data.  Double-click into the 'Impute Values' operator.  This will show it's sub-process area.  Drag a 'k-NN' operator over and connect the 'exa' and 'mod' ports.

<img src="/img/posts/etl_spreadsheet_subprocess.png" class="img-fluid" />

## Export to Postgres using RapidMiner

For the Write Database operator, creating the Postgres database connection is easy in RapidMiner:

<img src="/img/posts/etl_spreadsheet_jdbc.png" class="img-fluid" />

Executing the process reads the spreadsheet, imputes the missing values and stores the data into a created 'orders' Postgres table:

<img src="/img/posts/etl_spreadsheet_pg_table.png" class="img-fluid" />
 
 Most importantly, you can see the missing values have been inserted as part of the data cleansing during this load process.

### More in this series...
* [Oracle into PostgreSQL with Talend](/2016/06/12/oracle_to_postgres/)
* [SQL Server into PostgreSQL with SquirrelSQL](/2016/06/16/sqlserver_to_postgres/)
* [MySQL into PostgreSQL with Python's petl](/2016/06/21/mysql_to_postgres/)
* [Excel into PostgreSQL with RapidMiner](/2016/06/29/excel_to_postgres/)
* [Data Virtualization with PostgreSQL](/2016/07/18/pg_data_virt/)