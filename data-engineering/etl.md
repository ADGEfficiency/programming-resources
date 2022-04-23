# ETL


## Extract

Loading into system with no business logic / transformation applied


## Transform

Can have multiple stages of sequential transforms (usually you will have a few)

keep in mind that in each T you can have multiple transformations (change column names, map fields, change data types, fill missing data etc.)

Quite common pattern in data lakehouses is to save intermediate results, the pattern becomes ETLTLTL.

- raw json files that come from an SNS topic / streaming service,
- processed parquet files,
- aggregated database tables.


## Load

The output step


## Common Combinations

ETL

ELT

ETLTLTL

---

https://www.reddit.com/r/datascience/comments/tonhes/when_is_etl_better_than_elt_for_a_company_that/

ELT just means you're storing data in its source format and then transforming it to for example SQL.

ETL would mean you get data from a source, could be a JSON tweet and then transform and load it into your DB.

The biggest distinction is how / in what schema you land your data.

One part I’ll add, and it falls more on the Data Engineering side of the world, is deciding where you want to scale your compute up. If you have a large amount of data and choose to use a tool like Spark, it makes more sense to do ETL, as you can easily scale your Spark clusters and do transformations pre-database.

For ELT (simple load then SQL transform), you’re relying on the memory in your database cluster to do the transformations. Which is fine, but depending on your configuration, may not be performant or cost effective.

---

The important takeaway between ELT and ETL is that with ELT you are decoupled from your source system and with ETL this is not the case.

