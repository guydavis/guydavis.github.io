---
layout: post
title: MySQL into PostgreSQL
subtitle: moving data with python
date: 2016-06-21
header-img: img/headers/colored_pillars.jpg
comments: true
published: false
---

Continuing my series on data import into [PostgreSQL](https://www.postgresql.org/) database, this covers a quick way of getting MySQL data into Postgres. 

## MySQL to Postgres with Python

Of course, one doesn't need to rely on GUI tools for ETL jobs.  Here's a short Python script that can be used to extract data from the [MySQL Sakila](https://dev.mysql.com/doc/sakila/en/) demo schema.

Since Python drivers for MySQL on Windows is essentially a crapshoot, this tutorial is performed on a Ubuntnu Linux 16.04 system. You'll likely already have Python installed so just need to run ```pip install mysql-python```. 

```python 
from sqlalchemy import create_engine
engine = create_engine('mysql://sakila:sakila@localhost/sakila', echo=True)
cnx = engine.connect()
x = cnx.execute("SELECT * FROM staff")


```

 

