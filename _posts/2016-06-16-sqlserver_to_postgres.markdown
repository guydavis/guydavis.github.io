---
layout: post
title: SQLServer into PostgreSQL
subtitle: northwind data with squirrel
date: 2016-06-16
background: /img/headers/hatley_castle.jpg
comments: true
published: true
---

Continuing my series on data import into [PostgreSQL](https://www.postgresql.org/) database, this covers a quick way of getting some sample SQLServer data into Postgres.  For this example, I'll be performing a quick 'n dirty transfer using [SquirrelSQL](http://squirrel-sql.sourceforge.net/), a cross-platform database tool.

## SQL Server to Postgres with SquirrelSQL

Initally, I tried the [DBCopy plugin](http://dbcopyplugin.sourceforge.net/) in Squirrel, however it errored out on type conversions from SQLServer to Postgres.  With no means to easily configure, DBCopy was a dead end.  Instead, I just used Squirrel to export a CSV file of data from a SELECT query against the employees table.

```
select EmployeeID as staff_id, FirstName as first_name, LastName as last_name from Employees;
```

<img src="/img/posts/etl_mssql1.png" class="img-fluid" />

With that query executed, select the 'Session &#124; Scripts &#124; Store result of SQL in file' option.  Choose CSV as format and save to a temporary location.

<img src="/img/posts/etl_mssql2.png" class="img-fluid" />

Then to create the target table in Postgres and import the CSV data:

```
DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
    staff_id INT PRIMARY KEY,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    email VARCHAR(50)
);
COPY employee(staff_id, first_name, last_name) FROM 'C:/tmp/northwnd_employees.csv' DELIMITER ',' CSV HEADER;
```

This loads the data into PostgreSQL:

<img src="/img/posts/etl_mssql3.png" class="img-fluid" />

While this works, I wouldn't recommend this apporach except for one off jobs as it's not easily automatable or extensible.  It's a pity the DBCopy plugin which allows copy/paste of entire tables doesn't support more column type mappings.

### More in this series...
* [Oracle into PostgreSQL with Talend](/2016/06/12/oracle_to_postgres/)
* [MySQL into PostgreSQL with Python's petl](/2016/06/21/mysql_to_postgres/)
* [Excel into PostgreSQL with RapidMiner](/2016/06/29/excel_to_postgres/)
* [Data Virtualization with PostgreSQL](/2016/07/18/pg_data_virt/)