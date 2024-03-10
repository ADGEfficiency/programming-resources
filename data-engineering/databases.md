# Indexes

[SQL Indexing and Tuning e-Book for developers: Use The Index, Luke covers Oracle, MySQL, PostgreSQL, SQL Server, ...](https://use-the-index-luke.com/)

[Poor database indexing - a SQL query performance killer - recommendations](https://www.sqlshack.com/poor-database-indexing-sql-query-performance-killer-recommendations/)

[Relational Databases Explained](https://architecturenotes.co/things-you-should-know-about-databases/)

Indexes are a data structure that helps decrease the look-up time of requested data. Indexes achieve this with the additional costs of storage, memory, and keeping it up to date (slower writes), which allows us to skip the tedious task of checking every table row.

A transaction is a unit of work you want to treat as a single unit. Therefore, it has to either happen in full or not at all.

[Things to know about databases | Hacker News](https://news.ycombinator.com/item?id=31895623)

Realize that any reasonably used database will likely outlast the applications leveraging 

[The right column order in multi-column indexes](https://use-the-index-luke.com/sql/where-clause/the-equals-operator/concatenated-keys)

## Concatenated Indexes

Even though the database creates the index for the primary key automatically, there is still room for manual refinements if the key consists of multiple columns. In that case the database creates an index on all primary key columns—a so-called concatenated index (also known as multi-column, composite or combined index). Note that the column order of a concatenated index has great impact on its usability so it must be chosen carefully.

To define an optimal index you must understand more than just how indexes work—you must also know how the application queries the data. This means you have to know the column combinations that appear in the where clause.

# Joins

[Joins 13 Ways](https://justinjaffray.com/joins-13-ways/?a=b)

# Relational Model

[How and why the Relational Model works for databases](https://blog.the-pans.com/relational/)

# Schema Design

## Entity Attribute Value

[Replacing EAV with JSONB in PostgreSQL](https://coussej.github.io/2016/01/14/Replacing-EAV-with-JSONB-in-PostgreSQL/)

[Anti-pattern: entity-attribute-value (EAV)](https://cedanet.com.au/antipatterns/eav.php)

The basic idea is to record data using a single table, typically with three columns - the entity, attribute and value.

It is arguable there are valid uses of the pattern. The example sited in Wikipedia is for clinical data, where patient records would otherwise need thousands of columns in order to support all the possible attributes on a patient.

However, attribute volatility isn't usually present for most database designs, so the EAV pattern doesn't offer any particular benefits. In fact there are many significant disadvantages:

    Lack of enforced integrity constraints. Eg DBMS won't enforce referential integrity, or ensure values on an attribute are in an acceptable range
    Queries are extremely inefficient, leading to many self joins just to return the counterpart of a single record
    Queries are illegible
    Scalability is very bad
    The design isn't self documenting
    Attributes can be added on the fly giving the designer the illusion that the design is very malleable
    Graphical query tools provided by the RDBMS aren't available
    Views aren't available
    DBMS clustered indexes aren't available
    DBMS query optimisation is bypassed
    DBMS optimised disk layout strategies are bypassed

[Entity-Attribute-Value fallacy | Radek Maziarka](https://radekmaziarka.pl/2018/10/26/entity-attribute-value-fallacy/)

---

# ORMs

## [Is ORM still an 'anti pattern'?](https://github.com/getlago/lago/wiki/Is-ORM-still-an-%27anti-pattern%27%3F)

ORMs are more misused than overused.

### The Fake Problems

ORMs produce objects. (Duh! That’s what the O stands for.) Objects are like directed graphs—nodes that point to other nodes but not necessarily to each other. Conversely, database relational tables contain data that are always linked bidirectionally via shared keys, aka an undirected graph.

SRP dictates that a class should exist for one purpose and one purpose only. And, well, ORMs don’t do that. Sure, at a high level, they do “all the database stuffs”, but that’s equivalent to creating a single class that does “all the app stuffs”. 

JohnoTheCoder explained it best, ORMs: 
- create classes that transact with the database, 
- represent a record, 
- define relationships,
- create and execute migrations.

Separation of Concerns is of similar spirit to SRP, but at the application layer. SOC dictates that an infrastructure component should be concerned with one thing, not multiple. 

And an ORM shifts database management from the backend to the database, violating SOC. 

But SOC is a bit of a silly principle in today’s world. Nowadays, infrastructure components and coding patterns are combining tasks to achieve better performance (e.g., CPU aggregators within OLAP databases), lower latency (e.g., edge backend-frontends), and cleaner code (e.g., monorepos).

### The Real Problems

A common criticism of ORMs is that they’re inefficient.

This is mostly false. ORMs are far more efficient than most programmers believe. However, ORMs encourage poor practices because of how easy it is to rely on host language logic (i.e., JavaScript or Ruby) to combine data.

The first issue is that ORMs sometimes incur massive computational overhead when converting queries into objects (TypeORM is a particular offender of this).

The second issue is that ORMs sometimes make multiple roundtrips to a database by looping through a one-to-many or many-to-many relationship. This is known as the N+1 problem (1 original query + N subqueries). 

The biggest issue with ORMs is visibility. Because ORMs are effectively query writers, they aren’t the ultimate error dispatcher outside of obvious scenarios (such as incorrect primitive types). Rather, ORMs need to digest the returned SQL error and translate it to the user.

### [Is ORM still an anti-pattern? | Hacker News](https://news.ycombinator.com/item?id=36497613)

One of the selling points, which is now understood to be garbage, is that you can use different databases. But no-one uses different databases. 

Another selling point which is "you don't need to know SQL", is also garbage. Every non-trivial long-lived application will require tweaks to individual queries at the string level. 

The proper way to build a data layer is one query at a time, as a string, with string interpolation. The closer you are to raw JDBC the better.

---

ORMs make the easy parts slightly easier, but they make the hard parts really hard

---

The problem is the ORM requires you to know its language, the underlying SQL for that database, as well as how the ORM maps to that underlying language.

It’s the worst of a leaky abstraction, and like 3x the conceptual overhead. But it’s better because … something something OOP. 

---

The unfortunate reality of our industry is that most of the popular tools which software devs are using suck and are encouraging anti-patterns.

---

Competency is a function of the human and not the tools.

People who create piles of garbage will do so regardless of what you give them.

Let's not pretend ORM made poor behavior more manageable. It was just a different style mess to clean up.

You give them TDD, they'll create bad broken tests. You give them linters, they'll put in arcane and asinine rules. 

---

This argument has been presented forever to excuse bad tools, and it is a strawman. Of course good tools don't fix bad behavior. The argument in favor of good tools is that competent people with good tools are insanely more productive than competent people with bad tools. 

## [ What is the "N+1 selects problem" in ORM (Object-Relational Mapping)? - Stack Overflow](https://stackoverflow.com/questions/97197/what-is-the-n1-selects-problem-in-orm-object-relational-mapping)

Let's say you have a collection of Car objects (database rows), and each Car has a collection of Wheel objects (also rows). In other words, Car → Wheel is a 1-to-many relationship.

Now, let's say you need to iterate through all the cars, and for each one, print out a list of the wheels. The naive O/R implementation would do the following:

```
SELECT * FROM Cars;
```

And then for each Car:

```
SELECT * FROM Wheel WHERE CarId = ?
```

In other words, you have one select for the Cars, and then N additional selects, where N is the total number of cars.

Alternatively, one could get all wheels and perform the lookups in memory:

```
SELECT * FROM Wheel;
```

This reduces the number of round-trips to the database from N+1 to 2. Most ORM tools give you several ways to prevent N+1 selects.

[mysql - selecting rows with id from another table - Stack Overflow](https://stackoverflow.com/questions/10562915/selecting-rows-with-id-from-another-table)

```sql
SELECT * FROM terms WHERE id IN 
   (SELECT term_id FROM terms_relation WHERE taxonomy = "categ")
```

```sql
SELECT t.* FROM terms AS t 
   INNER JOIN terms_relation AS tr 
   ON t.id = tr.term_id AND tr.taxonomy = "categ"
```

```sql
SELECT t.id, t.name, t.slug, tr.description, tr.created_at, tr.updated_at 
  FROM terms AS t 
   INNER JOIN terms_relation AS tr 
   ON t.id = tr.term_id AND tr.taxonomy = "categ"
```

[How slow is SELECT * ? - Vettabase](https://vettabase.com/how-slow-is-select/)

[42 things I learned from building a production database](https://maheshba.bitbucket.io/blog/2021/10/19/42Things.html)

[A terrible schema from a clueless programmer](http://rachelbythebay.com/w/2021/11/06/sql/) [HN Discussion](https://news.ycombinator.com/item?id=29139902)

[Common data model mistakes made by startups](https://www.metabase.com/learn/analytics/data-model-mistakes) [HN Discussion](https://news.ycombinator.com/item?id=27248093)

[Diving Deep on S3 Consistency](https://www.allthingsdistributed.com/2021/04/s3-strong-consistency.html)

---

[How Time Series Databases Work—and Where They Don't](https://www.honeycomb.io/blog/time-series-database)

A time series is a sequence of data points where each point is a pair: a timestamp and a numeric value.

Time series databases are optimized for metrics storage.

A major avenue of optimization for TSDBs is compression, reducing the number of bits needed to represent the same data:
- delta encoding - store the difference between consecutive values,
- delta of deltas.

It's very common for vendors to provide tags or labels—pieces of key-value metadata that can be attached to a time series:

- too many tags can cause combinatorial explosion.

They efficiently stores and retrieves time-stamped data. Each time series is stored individually as an optimized list of values, enabling fast data retrieval and cost-effective storage.

Disadvantages:

- They can't effectively store high-cardinality data.
- Write-time aggregation loses the context of the raw data, making it difficult to answer new questions.
- Without data to relate pre-aggregated metrics to each other, your investigations can be led down the wrong path.

---

Transactional versus analytical - different read + write patterns

---

Fact + dimension tables

- one a fact table that says what the forecasts are
- two a dimension table that has all the forecasts

---

https://www.reddit.com/r/dataengineering/comments/tqud76/database_design_best_practices_for_data_warehouses/

 If the system supports transactions, I normalize it. If it's for analysis, I get as close to "One Big Table" (obt) as makes sense so analyst don't have to even worry about joins.

denormalize until it hurts, normalize until it makes sense

Are you optimizing forc read or write?

---

How to structure a database for data reingestion (if the data can be uploaded again):

Instead of upserting the data directly into the table, just insert / append the data into some other table(tableA). Now, create a view on top of this table which will pick up the latest record based on the primary keys. Now if you want to update some historical file you just need to update it in tableA. The changes will reflect into the view.

Don't trust the csv name. Get the file timestamp from the storage metadata if you can and use that. 

---

https://www.reddit.com/r/dataengineering/comments/t4et7u/in_your_etl_process_do_you_load_to_a_staging_area/

Landing Zone (LZ):

Data gets loaded here without any data type restrictions as our external sources are very unreliable. This allows us to be able to do validation testing and determine warnings v. failure.

Data Exchange:

This is where we Type 1 data into type restrictive tables (assuming data passes validation) that are setup like the DW tables. Then we can run another set of validations that our transformations worked appropriately as well as understand data that was not loaded from the LZ source.

Data Warehouse:

Data from the Data Exchange layer gets Type 1 into the production tables and another set of data validations occur to ensure the changes presented in the Data Exchange layer match up with the DW.

Data Marts_<business_function>:

The data warehouse then loads to the appropriate data marts for the reporting services and end-user consumption. We have an external reporting mart, finance reporting mart, and operational reporting mart. This is where hard business rules are applied for each mart. Then there is another set of validations to test the hard business rule logic and ensure consistency of values or lack thereof.

Our legacy DW had staging tables, but they were type restrictive. So any changes in the data would cause a failure in the processing. Using the staging allows you to set aside those problematic records and continue processing the rest of the data.

We will probably incorporate some form of an Archive data store because our operational DB changes very quickly and having a snapshot of the data used at time of processing would be great for audits. Our accounting DB and flat files are already archived so we can reload those at any point as well as have an audit trail for them.

This setup allows us to test new soft rules without corrupting/breaking the DW because if it does not pass in the Data Exchange, it won't pass in the DW. It also allows for more robust and faster validation.

I would imagine you could skip a staging and go straight to the DW, but your data validation better be very good. The other problem with skipping the staging area is these data validations could take much longer than splitting them into smaller bits. Also, skipping staging could be risky depending on if you are Type 1 or Type 2. Without staging and a Type 2 environment, this seems too risky when there is a failure.

That is my 2 cents.

---

Upserts are generally a bad idea in big data. If your db/tables are small it may not be a big deal but usually you want to do append-only and deduplicate on read and deduplicate the actual table occasionally, like daily or weekly.

---

[Scaling Databases - Web Development](https://youtu.be/dkhOZOmV7Fo)

Database Normalization

[On MongoDB](https://www.nemil.com/mongo/index.html)

[PyCon.DE 2017 Tamara Mendt - Modern ETL-ing with Python and Airflow (and Spark)](https://www.youtube.com/watch?v=tcJhSaowzUI)

ETL usually implies batch
- integrting multiple data sources
- pre-aggregating to speed up queries
- computer features for ML

[Was MongoDB Ever the Right Choice?](https://www.simplethread.com/was-mongodb-ever-the-right-choice/)

Solved
- allow non strict schema
- scale data across multiple machines
- ability to change schema
- good write performance

Problems
- loss of transaction structure in data
- loss of foreign key stricture in the data
- loss of ability to enforce schema
- query language

[Data Science for Startups: Data Pipelines](https://towardsdatascience.com/data-science-for-startups-data-pipelines-786f6746a59a)

Ideal data pipeline:
- low latency
- scalable
- interactive querying
- versioning - changes to pipeline & event definitions
- monitoring - if events not received, alerts generated
- testing - test events don't end up in database, but can test components of pipeline

Types of data
- raw - usually JSON
- processed - usually stored in tables
- cooked data - aggregated / summarized

Four eras of data pipelines
1. flat files - local storage

2. database - flat files then loaded into db

3. data lake - stored in Hadoop/S3 then loaded into db
- semi structured in a distributed database (S3), then run ETL to extract into an analytics database
- scales, provides fault tolerance
- less access to data than traditional db (you could use Spark SQL though)
- operational overhead

4. serverless era - managed services for storage and querying
- autoscales - similar benefits to data lake
- expensive
- not portable across cloud service providers

Store events as Parquet on S3 to use with Spark
