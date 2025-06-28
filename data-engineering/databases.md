# Indexes

[SQL Indexing and Tuning e-Book for developers: Use The Index, Luke covers Oracle, MySQL, PostgreSQL, SQL Server, ...](https://use-the-index-luke.com/)

[Poor database indexing - a SQL query performance killer - recommendations](https://www.sqlshack.com/poor-database-indexing-sql-query-performance-killer-recommendations/)

[I stopped worrying and learned to love denormalized tables | Hacker News](https://news.ycombinator.com/item?id=35924259)

 Who decided the point of using databases is normalization? Where is that coming from? Relational databases have existed before the concept of normalization existed. Also an index is nothing more than a partial copy of a table with a different key. It denormalizes you data. Do you use indexes other than pk? 

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

[A Relational Model of Data for Large Shared Data Banks](https://www.seas.upenn.edu/~zives/03f/cis550/codd.pdf)

[How and why the Relational Model works for databases](https://blog.the-pans.com/relational/)

# Schema Design

## [Why I Stopped Worrying and Learned to Love Denormalized Tables | Hashboard](https://hashboard.com/blog/why-i-stopped-worrying-and-learned-to-love-denormalized-tables)

Normalized tables: Tables designed to avoid repeating information, keeping data organized and easy to maintain.
Denormalized tables: Tables that have repeated information, but make data retrieval faster and simpler to understand. aka One Big Table (OBT)

I’ve come full circle on the power of wide flat tables for analytics.

The excellent query performance of denormalized tables in modern warehouses also make it quicker to run analyses.

I could now safely build an analytics table of millions of records and build many different visualizations and analyses with simple filters and aggregations, no complex joins or CTE’s required. The many columns ensured I could flexibly create the series and aggregations I needed.

[I stopped worrying and learned to love denormalized tables | Hacker News](https://news.ycombinator.com/item?id=35924259)

1) Normalisation at all costs is foolish - if the cost exceeds the value, then don't do it. That isn't complicated. Denormalised data sometimes points at design flaws, but even then all systems have design flaws and they don't automatically need to be fixed. Quality is expensive, like every other property (even doing things the cheap way is expensive, ironically - software is all about managing costs).

2) For any given user it is better to have denormalised data where the data model is perfectly aligned to their use case. For a system with multiple users it is better to have normalised data. And the corollary is that any data important enough to be recorded is probably valuable enough that it will eventually have multiple interested users even if the person building the system swears that this time is different - so they should normalise their data. Brownie point to anyone who has reached enlightenment and understands the you of 12 months hence is a different user with different needs of the data. 

---

Value of denormalization: May improve query performance for some particular use cases. (But probably not any more than using a materialized view)

---

It sounds like the author is calling a kind of materialized/persisted view "denormalized tables". The actual DB tables stay untouched and fully normalized.

It sure makes sense to love them, views are great. I don't know why they need a new name.

---

For the third time this week, in relatively unrelated fields of computation science, I'm reminded of the quote: "Duplication is less expensive than the wrong abstraction".

---

The schemas always exist, it’s just a question of where: the database or the code that interacts with the database. 

---

While this talks mostly about data warehousing, oftentimes denormalization is useful for everyday web app data storage. 

If your web app (usually on Postgres) is mostly frequent reads and rare writes (most web apps are) — there's no excuse for your pages to load slower than a static site. Store your data as normalized as you want, add a denormalized materialized view, update it on writes, render pages based on the view.

---

## [How to Join a fact and a type 2 dimension (SCD2) table](https://www.startdataengineering.com/post/how-to-join-fact-scd2-tables/)

## [Separate Tables Vs One table for Select Queries](https://stackoverflow.com/questions/47647139/database-design-separate-tables-vs-one-table-for-select-queries)

Normal forms:

- [First normal form](https://en.wikipedia.org/wiki/First_normal_form),
- [Second normal form](https://en.wikipedia.org/wiki/Second_normal_form),
- [Third normal form](https://en.wikipedia.org/wiki/Third_normal_form).

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

## [mysql - Database design for user settings - Stack Overflow](https://stackoverflow.com/questions/10204902/database-design-for-user-settings)

```
SETTING:
+----+------------------+-------------+--------------+-----------+-----------+
| id | description      | constrained | data_type    | min_value | max_value |
+----+------------------+-------------+--------------+-----------+-----------+
| 10 | Favourite Colour | true        | alphanumeric | {null}    | {null}    |
| 11 | Item Max Limit   | false       | integer      | 0         | 9001      |
| 12 | Item Min Limit   | false       | integer      | 0         | 9000      |
+----+------------------+-------------+--------------+-----------+-----------+

ALLOWED_SETTING_VALUE:
+-----+------------+--------------+-----------+
| id  | setting_id | item_value   | caption   |
+-----+------------+--------------+-----------+
| 123 | 10         | #0000FF      | Blue      |
| 124 | 10         | #FFFF00      | Yellow    |
| 125 | 10         | #FF00FF      | Pink      |
+-----+------------+--------------+-----------+

USER_SETTING:
+------+---------+------------+--------------------------+---------------------+
| id   | user_id | setting_id | allowed_setting_value_id | unconstrained_value |
+------+---------+------------+--------------------------+---------------------+
| 5678 | 234     | 10         | 124                      | {null}              |
| 7890 | 234     | 11         | {null}                   | 100                 |
| 8901 | 234     | 12         | {null}                   | 1                   |
+------+---------+------------+--------------------------+---------------------+

```

```sql
-- DDL and sample data population...
CREATE TABLE SETTING
    (`id` int, `description` varchar(16)
     , `constrained` varchar(5), `data_type` varchar(12)
     , `min_value` varchar(6) NULL , `max_value` varchar(6) NULL)
;

INSERT INTO SETTING
    (`id`, `description`, `constrained`, `data_type`, `min_value`, `max_value`)
VALUES
    (10, 'Favourite Colour', 'true', 'alphanumeric', NULL, NULL),
    (11, 'Item Max Limit', 'false', 'integer', '0', '9001'),
    (12, 'Item Min Limit', 'false', 'integer', '0', '9000')
;

CREATE TABLE ALLOWED_SETTING_VALUE
    (`id` int, `setting_id` int, `item_value` varchar(7)
     , `caption` varchar(6))
;

INSERT INTO ALLOWED_SETTING_VALUE
    (`id`, `setting_id`, `item_value`, `caption`)
VALUES
    (123, 10, '#0000FF', 'Blue'),
    (124, 10, '#FFFF00', 'Yellow'),
    (125, 10, '#FF00FF', 'Pink')
;

CREATE TABLE USER_SETTING
    (`id` int, `user_id` int, `setting_id` int
     , `allowed_setting_value_id` varchar(6) NULL
     , `unconstrained_value` varchar(6) NULL)
;

INSERT INTO USER_SETTING
    (`id`, `user_id`, `setting_id`, `allowed_setting_value_id`, `unconstrained_value`)
VALUES
    (5678, 234, 10, '124', NULL),
    (7890, 234, 11, NULL, '100'),
    (8901, 234, 12, NULL, '1')
;
```

```sql
-- Show settings for a given user
select
  US.user_id 
, S1.description 
, S1.data_type 
, case when S1.constrained = 'true'
  then AV.item_value
  else US.unconstrained_value
  end value
, AV.caption
from USER_SETTING US
  inner join SETTING S1
    on US.setting_id = S1.id 
  left outer join ALLOWED_SETTING_VALUE AV
    on US.allowed_setting_value_id = AV.id
where US.user_id = 234
```

# Views

Views are a way to store an alias for a query in the database.

A materialized view actually runs the query and stores the results.  It's a cache for the query.

Materialized views are only as accurate as the last time they ran the query they are caching.

---

# ORMs

## [An ORM can bite you](https://jorzel.github.io/an-orm-can-bite-you/)

ORMs can lazy load - they don't load all objects defined in foreign keys.

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

## Migrations

[The Ten Rules of Schema Growth](https://blog.datomic.com/2017/01/the-ten-rules-of-schema-growth.html)

Grow your schema, and never break it.

Growth migrations are suitable for production, and breakage migrations are, at best, a dev-only convenience. Keep them widely separate.

Use aliases for columns.

[Rules of schema growth (2017) | Hacker News](https://news.ycombinator.com/item?id=38089980)

SQL implementations of views are often problematic in practice due to planning complexity & overhead. In theory they should also be a good mechanism for handling writes (see "updateable views" / "writable views") but the list of caveats is long and many developers are understandably nervous about pushing lots of logic into TRIGGERs.

---

The central thesis revolves around continuous growth with no advice given for removal/cleanup. This is not a sound strategy for a database schema, at least for the SQL side. Column bloat, trigger bloat, index bloat... Schemas cannot continuously grow, there needs to be DROPs along the way. 

---

> 5.  Never remove a name. > Removing a named schema component at any level is a breaking change for programs that depend on that name. Never remove a name.

I agree with this in theory and have seen it go oh so very wrong in practice. Tables with dozens of columns, some of which may be unused, invalid, actively deceiving, or at the very least confusing. Then a new developer joins and goes "A-ha! This is the way to get my data." ... except it's not and now their query is lying to users, analysts, leadership, anyone who thinks they're looking at the right data but isn't.

You absolutely have to make time to deprecate and remove parts of the schema that are no longer valid. Even if it means breaking a few eggs (hopefully during a thorough test run or phased rollout) 

---

This x100. The most miserable and frustrating periods of my career have been in places that never deprecated anything.

---

There are few things more important than comprehensive and up to date database documentation. Otherwise you don't even know what your data means. An organization that cannot produce documentation like that is somewhere between amateurish and waiting for a disaster to happen, unfortunately. 

---

Data outlives code.

[Databases have failed the web](https://josephg.com/blog/databases-have-failed-the-web/)

Databases only talk custom binary TCP protocols, not HTTP. Not REST. Not websockets. So you need something to translate between how the server works and how the browser works. 

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

[ML Engineer Guide: Feature Store vs Data Warehouse - Hopsworks](https://www.hopsworks.ai/post/feature-store-vs-data-warehouse)

The feature store is a data warehouse of features for machine learning (ML). 

It is a central vault for storing documented, curated, and access-controlled features that can be used across many different models.

Architecturally, it differs from the traditional data warehouse in that it is a dual-database. 

One database (row-oriented) serving features at low latency to online applications.

The other database (column-oriented) storing large volumes of features, used by Data Scientists to create train/test datasets and by batch applications doing offline model scoring.

---

Often separated into offline (large batches) and online (single rows).

[Monarch: Google’s Planet-Scale In-Memory Time Series Database](http://www.vldb.org/pvldb/vol13/p3181-adams.pdf)

[Databases, Types and the Relational Model - Third Manifesto](https://www.dcs.warwick.ac.uk/~hugh/TTM/DTATRM.pdf)

[The Snowflake Elastic Data Warehouse | Proceedings of the 2016 International Conference on Management of Data](https://dl.acm.org/doi/abs/10.1145/2882903.2903741)

[PostgreSQL and UUID as Primary Key | Hacker News](https://news.ycombinator.com/item?id=40884878)

---

## Testing

[How to deal with stored procedure hell? : r/ExperiencedDevs](https://www.reddit.com/r/ExperiencedDevs/comments/1h7z9px/how_to_deal_with_stored_procedure_hell/?share_id=l2fyJkCqdDUatd0OogR4W&utm_name=androidcss&rdt=45072)

 Here's one good thing about stored procedures that you can use to your advantage in this case: You can easily wrap simple, crude unit tests around them. Just stick to an Arrange/Act/Assert pattern with some ad hoc SQL. The execution of the stored procedure is the Act. Any necessary SQL to prime things for it is the Arrange (including, if necessary, a BEGIN TRAN). Then you Assert the state of the database after the procedure executes and, if necessary, ROLLBACK TRAN. 

Once you have a toolbox of unit tests like this, then you can much more safely fiddle with these stored procedures. 

As someone who also refactors legacy code for a living. This is the way. Wrap legacy code in tests, then replace it. If your tests are sufficiently thorough, you can be sure that the refactor doesn't break any behavior. 

## [Things I Wished More Developers Knew About Databases | by Jaana Dogan | Medium](https://rakyll.medium.com/things-i-wished-more-developers-knew-about-databases-2d0178464f78)

ACID compliance is marketing more than technical specification
- MongoDB claimed ACID while defaulting to 60-second disk commits and lacking journaling
- Different databases interpret ACID properties with significant variation
- "Snapshot isolation" often substituted for true serializability without disclosure
- Tradeoff: Strict ACID compliance can severely impact performance and availability

AUTOINCREMENT creates distributed system bottlenecks
- Global coordination required in distributed databases
- Sequential IDs can create hotspots in partitioned systems
- UUIDs eliminate coordination but impact index performance
- Natural keys often better but require careful uniqueness analysis
- Pushback: Sequential IDs enable efficient range queries and better compression

Database growth introduces fundamental unpredictability
- Scaling assumptions become invalid as data size increases

---

## DuckDB

[Mastering DuckDB when you're used to pandas or Polars: part 1 | Labs](https://labs.quansight.org/blog/duckdb-when-used-to-frames)

[Mastering DuckDB when you're used to pandas or Polars: part 2 | Labs](https://labs.quansight.org/blog/duckdb-when-used-to-frames_part2)

## UUIDs

[TIL: 8 versions of UUID and when to use them | nicole@web](https://ntietz.com/blog/til-uses-for-the-different-uuid-versions/)

    UUID Version 1 (v1) is generated from timestamp, monotonic counter, and a MAC address.
    UUID Version 2 (v2) is reserved for security IDs with no known details[2].
    UUID Version 3 (v3) is generated from MD5 hashes of some data you provide. The RFC suggests DNS and URLs among the candidates for data.
    UUID Version 4 (v4) is generated from entirely random data. This is probably what most people think of and run into with UUIDs.
    UUID Version 5 (v5) is generated from SHA1 hahes of some data you provide. As with v3, the RFC suggests DNS or URLs as candidates.
    UUID Version 6 (v6) is generated from timestamp, monotonic counter, and a MAC address. These are the same data as Version 1, but they change the order so that sorting them will sort by creation time.
    UUID Version 7 (v7) is generated from a timestamp and random data.
    UUID Version 8 (v8) is entirely custom (besides the required version/variant fields that all versions contain).

Most developers should choose between v4 and v7

- v4 for general random IDs (safest choice)
- v7 for database keys where sorting matters (performance benefit)
- v5/v8 only when you have specific data requirements

Timestamp-based UUIDs (v1, v6, v7) in databases create performance vs privacy tradeoffs

- Performance benefit: sequential keys improve spatial locality in B-trees
- Privacy concern: reveals creation timestamps relative to other records
- Mitigation strategy: use separate public identifiers, keep internal UUIDs private
- Alternative approach: add timestamp as separate indexed columns instead

Many developers wrongly assume higher version numbers mean newer/better 
