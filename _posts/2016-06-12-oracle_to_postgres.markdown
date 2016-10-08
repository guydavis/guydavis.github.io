---
layout: post
title: Oracle into PostgreSQL
subtitle: data loading with talend
date: 2016-06-12
header-img: img/headers/dino_sunset.jpg
comments: true
published: true
---

My preferred data management platform rests upon the [PostgreSQL](https://www.postgresql.org/) database.  The most recent releases have been truly impressive, especially when you consider that the Postgres database is [free software](https://www.postgresql.org/about/).  

Using Postgres for data management means integrating disparate data sources such as other databases, spreadsheets, flat files, etc into Postgres.  There are two primary mechanisms for this: data loading and data virtualization.  

I'll cover Postgres data loading in this post, including options for extraction, transformation, and loading (ETL).  

## Import via Talend Open Studio

The tool I'll use for this data import is the free [Talend Open Studio](https://www.talend.com/products/talend-open-studio).  I'll be pulling data from an Oracle Express instance with it's Human Resources (HR) sample database.

First trick was to launch Talend without error due to the presence of a Java 7 install on my system.  Once I figured out the cause of startup failure, I was able to create a launch.bat file to make explicit use of a Java 8 install.

```
start /B TOS_DI-win-x86_64.exe -VM "C:\Program Files\Java\jdk1.8.0_40\bin"
```

Talend OS starts up pretty empty, particularly the 'Palette' area on the right.  Once selecting 'Help &#124; Install Additional Packages...' and installing all required and optional packages, I was able to create a new Job by right-clicking the 'Job Designs' folder on left in my local project.  

Once I had a populated palette, things got became quite intuitive for a simple data extraction from Oracle into Postgres.  From the palette, I dragged a 'tOracleInput' component to the project area, then a 'tPostgresqlOutput' component over and connected them together as shown:

![Job]({{ site.url }}/img/posts/etl_talend1.png)

Setting the parameters for Oracle input component was straight forward:

![Oracle]({{ site.url }}/img/posts/etl_talend2.png)

As was setting the parameters of the Postgres output component:

![Postgres]({{ site.url }}/img/posts/etl_talend2.png)

However, by default Talend will use column names from Oracle exactly, including them as upper-case.  Uppercase columns in Postgres will work if you quote them everywhere, but who wants to bother with that?  So instead, I changed the output schema mapping as shown:

![Mapping]({{ site.url }}/img/posts/etl_talend4.png)

Running the job successfully resulted in a new 'employee' table in Postgres, with records seen here:

![Results]({{ site.url }}/img/posts/etl_talend5.png)

Overall, once up and running, Talend's tools for data integration seem quite powerful.  In future, I'll be looking at other palette components available.

### More in this series...
* [SQL Server into PostgreSQL with SquirrelSQL]({{site.url}}/2016/06/16/sqlserver_to_postgres/)
* [MySQL into PostgreSQL with Python's petl]({{site.url}}/2016/06/21/mysql_to_postgres/)
* [Excel into PostgreSQL with RapidMiner]({{site.url}}/2016/06/29/excel_to_postgres/)
* [Data Virtualization with PostgreSQL]({{site.url}}/2016/07/18/pg_data_virt/)