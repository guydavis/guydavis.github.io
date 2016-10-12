---
layout: post
title: PostgreSQL Data Virtualization
subtitle: with foreign data wrappers
date: 2016-07-18
header-img: img/headers/elephant_statue.jpg
comments: true
published: false
---

For this example, I'll be exposing [sample data from MySQL](https://dev.mysql.com/doc/sakila/en/) as a table within our PostgreSQL database.  Here's the data, queried in MySQL Bench:

![MySQL]({{ site.url }}/img/posts/data_virt_mysql_staff.png)


## Installing the Software

To make use of Postgres' Foreign Data Wrappers, you'll need the following:

1. CentOS 7. (Windows and Ubuntu were both dead ends)
2. PostgreSQL 9.5.  (Unfortunately, 9.6 didn't have Multicorn yet)
3. Multicorn 1.3.2 on Python 2.7 
4. sqlalchemy 1.0.14
5. DB Drivers: MySQLdb, 

So, once I had a CentOS 7 VM running inside Vagrant, the next step was to install Postgres 9.5 following the directions [here](https://wiki.postgresql.org/wiki/YUM_Installation) and [here](http://stackoverflow.com/questions/35492893/unable-to-start-postgresql-9-5-on-centos-7).

Once PostgreSQL was installed, I was able to start adding the rest of the dependencies:

    yum install -y multicorn95 epel-release vim python-pip python-sqlalchemy freetds MySQL-python

## Configuring the Foreign Tables

```sql 
CREATE EXTENSION multicorn;

CREATE SERVER MYSQL_SAKILA foreign data wrapper multicorn options (
    wrapper 'multicorn.sqlalchemyfdw.SqlAlchemyFdw'
);

create foreign table mysql_staff (
  staff_id integer,
  first_name varchar,
  last_name varchar
) server MYSQL_SAKILA options (
  tablename 'staff',
  db_url 'mysql://sakila:sakila@localhost/sakila'
);
```

![PG]({{ site.url }}/img/posts/data_virt_mysql_staff_in_pg.png)

## What didn't work...
1. [FreeTDS + tds_fdw on Windows](https://github.com/tds-fdw/tds_fdw/issues/53)
2. [Ubuntu 16.04 on Vagrant](https://github.com/mitchellh/vagrant/issues/7155)
3. [BigSQL + CentOS7 + multicorn](https://www.bigsql.org/components.jsp)

### More in this series...
* [Oracle into PostgreSQL with Talend]({{ site.url }}//2016/06/12/oracle_to_postgres/)
* [SQL Server into PostgreSQL with SquirrelSQL]({{site.url}}/2016/06/16/sqlserver_to_postgres/)
* [MySQL into PostgreSQL with Python's petl]({{site.url}}/2016/06/21/mysql_to_postgres/)
* [Excel into PostgreSQL with RapidMiner]({{site.url}}/2016/06/29/excel_to_postgres/)
