---
layout: post
title: MySQL into PostgreSQL
subtitle: moving data with python's petl
date: 2016-06-21
header-img: img/headers/colored_pillars.jpg
comments: true
published: true
---

Continuing my series on data import into [PostgreSQL](https://www.postgresql.org/) database, this covers a quick way of getting MySQL data into Postgres. 

## MySQL to Postgres with Python

Of course, one doesn't need to rely on GUI tools for ETL jobs.  Here's a short Python script that can be used to extract data from the [MySQL Sakila](https://dev.mysql.com/doc/sakila/en/) demo schema.

This assumes you have the [MySQL Connector for Python](https://anaconda.org/anaconda/mysql-connector-python) installed within your Anaconda install on Windows.  Similar steps are available for Linux systems.

    conda install -c anaconda mysql-connector-python=2.0.4

As well, you'll need the Postgres driver for Python, named psycopg2.  This probably was included with Anaconda, but if not then try:

    pip install psycopg2

Finally, we'll be using the petl and sqlalchemy libraries for ETL in Python.

    pip install petl sqlalchemy

Now we're all set.  We'll extract records from the MySQL sakila.staff table and store them into the 'employee' table in Postgres.  First let's open up some database conections.

```python 
import sys
import petl
import mysql.connector
import psycopg2
import sqlalchemy

my_eng = sqlalchemy.create_engine('mysql+mysqlconnector://sakila:sakila@localhost/sakila')
my_cnx = my_eng.connect()
pg_eng = sqlalchemy.create_engine('postgresql+psycopg2://postgres:postgres@localhost/hr')
pg_cnx = pg_eng.connect()
```

Then we'll read the staff records into a table object.   We could also perform transforms and other cleanups here if needed.

```python 
my_staff = petl.fromdb(my_cnx, 'SELECT staff_id, first_name, last_name, email FROM staff')
```

Next we'll create a target table in Postgres and write out the staff records.

```python 
pg_eng.execute("DROP TABLE IF EXISTS employee")
pg_eng.execute(
    """CREATE TABLE employee (
            staff_id INT PRIMARY KEY,
            first_name VARCHAR(45),
            last_name VARCHAR(45),
            email VARCHAR(50)
        )
    """)

try:
    petl.todb(my_staff, pg_cnx, 'employee')
except sqlalchemy.exc.DataError as err:
    print("Unexpected error: {0}".format(err))
    raise 

pg_cnx.close()
my_cnx.close()
```

I did try the automatic table creation feature of sqlalchemy, but found it was creating columns too small to hold the records. I also messed around with sqlalchemy's MetaData object, but was not overly impressed. As such, the CREATE TABLE above provides more explicit control over the target table schema. 

![Results]({{ site.url }}/img/posts/petl_pg.png)

So, with just a few lines of code, one can easily setup an ETL process for moving data between MySQL and Postgres databases using Python's petl library.

### More in this series...
* [Oracle into PostgreSQL with Talend]({{ site.url }}/2016/06/12/oracle_to_postgres/)
* [SQL Server into PostgreSQL with SquirrelSQL]({{site.url}}/2016/06/16/sqlserver_to_postgres/)
* [Excel into PostgreSQL with RapidMiner]({{site.url}}/2016/06/29/excel_to_postgres/)
* [Data Virtualization with PostgreSQL]({{site.url}}/2016/07/18/pg_data_virt/)