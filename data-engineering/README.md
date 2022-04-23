# Data Engineering


## What is data engineering?

> the most basic foundation of what is most critically needed: all the important data, in the same place, easily queryable (from https://erikbern.com/2021/07/07/the-data-team-a-short-story.html)

A data engineer enables access to data

Emphasis on data quality

Data science versus BI analytics:

- BI analytics = SQL
- petascale SQL is a solved problem
- 500+ nodes, databases work well

Data scientists will replace BI:

- predictive model or big table of numbers?
- BI = big table of number

Data science:

- data management - SQL (table) based calcs,
- complex analytics - array based calcs.

Data management versus analytics:

- data management - SQL (table) based calcs,
- complex analytics - array based calcs (deep learning etc).

Skills
- SQL Data Modeling Python Cloud Spark Kafka

---

Don't worry too much about the individual tools in the beginning. Yes, there are certain tools like u/Cloudskipper92 mentioned Airflow, DBT, Snowflake and so on, but you need to understand why and when you use them.

Understand the 4 different parts of a platform: data integration, processing frameworks, data stores (Data Lakes, OLTP and OLAP) and visualization. Figure out which tools are in them. 

Work on understanding the difference between batch jobs (ETL) and data streaming.  
I recommend learning a "transactional" and a "analytics" use case. 

In the transactional build a streaming pipeline e.g. API -> Kafka -> Spark Streaming -> MongoDB -> API/UI

For the analytics one use a Data Warehouse/Analytics store and write data to it. e.g.  
File in S3 -> Apache Spark batch job (scheduled by airflow) -> Snowflake -> PowerBI  

---
https://www.reddit.com/r/dataengineering/comments/tpg0r9/common_mistakes_data_engineers_make_and_how_to/

A common mistake I see is companies that write a data model without really thinking about it. 

The model becomes the byproduct of all the features they've implemented and the framework and the libraries they've used, rather than something that was deliberately designed.

---




## What is a data engineer?

Data engineer = entity recognition

- ETL, ELT, events, data warehouse
- know where your data is leaking
- testing - unit test data
- understand you will see noise


## Big Data

- volume
- velocity
- variety

Better compute ability / access (cloud)

Business user data literacy

Business value of data - better tooling = higher leverage tooling


## Sources of Data

- user generated - search text, clicks,
- system generated - logs, metadata, model predictions,
- enterprise applications data - inventory, customer relationships,
- third party data - 1st party = own customers, 2nd party = collected by another company about own customers, 3rd party = data about public

Internet + smartphones = more data

| Format  | Binary or Text | Human-readable? | Use case     | Layout |
| JSON    | Text           | Yes             | Everywhere   | Arbitrary |
| CSV     | Text           | Yes             | Everywhere   | Row |
| Parquet | Binary         | No              | Tabular data | | Column |


## KPIs

Actionable

KPIs that matter

- DAU, WAU, MAU, LTV, churn
- cohorts, segments, funnels
- first hour, first day

KPI should show you where the problems are


## Rows versus Columns

Column stores are faster when accessing columns (compression on the columns)

Row good for transactions


## Colmuns / Fields to have in your data

Ensure that all Facts/Events have a business timestamp and an arrival/etl timestamp


## Structured vs. Unstructured

Structured versus unstructured data
- structured = schema
- no structure = no sql (but you can do sql on most no sql databases :)


## ETL / ELT

ETL = 
- sources, targets

ELT = no schema on load

OLTP versus OLAP [RnR]

ETL [RnR]


## Data Sources


### Qualities of Data Sources

Text or binary
- everything can read text
 
Text versus binary

- opening binary files in text editors -> wierd characters / numbers

Binary = more compact, but not human readable

JSON
- most common,
- supported by many programming languages,
- versatile,
- key-value.

JSONL


### CSV

- row based,
- good for accessing samples,
- good for writes (appends)
- excel workbook = binary, not text! -> not everything can work with Excel workbooks (do a cat of template)
- sometimes will use different separators (TSV etc)
- CSV = path of least resistance

At its most basic, CSVs have only two delimiting characters: a comma to delimit columns, and a newline to delimit rows.

**Further reading**
- [It's Time to Retire the CSV](https://www.bitsondisk.com/writing/2021/retire-the-csv/) - [Hacker News discussion](https://news.ycombinator.com/item?id=28221654)

Parquet
- column based,
- good for accessing features,
- good for lots of reads, few writes (appends not good)

Numpy / pandas = columar
- example of accessing columns verus rows of dataframe


Batch versus streaming

- not real time / stream at the start
- https://www.reddit.com/r/dataengineering/comments/sfme7l/can_someone_help_me_understand_why_data_batch/


## Storage layers

Storage layers
- raw
- core - entities,
- aggregations,
- bespoke / experimental / convienence.


## Databases

Normalization
- good in theory (no duplication, less memory, link by foreign keys)
- but not good in practice (require many quieries / joins to get data, slow quieries)


## Abstractions in Data Engineering

### Orchestration

Setup + execute jobs

https://medium.com/memory-leak/data-orchestration-a-primer-56f3ddbb1700

Data orchestration solutions center around the concept of a DAG (direct acyclic graphs), a collection of all the tasks you want to run, organized in a way that reflects their relationships and dependencies.

Historically individuals wrote cron jobs to orchestrate data but today there are data orchestration frameworks that allow them to programmatically author, schedule, and monitor data pipelines.

Benefits
- parallelization,
- managing dependencies between tasks,
- failure handling & alerting

Components of orchestration
- operator - defines tasks,
- task - operator running with arguments,
- inputs & outputs

What can you do with orchestration

1) cleansing, organizing, and publishing data into a data warehouse, 2) computing business metrics, 3) applying rules to target and engage users through email campaigns, 4) maintaining data infrastructure like database scrapes, and 5) running a TensorFlow task to train a machine learning model.

Data awareness of the tool (Dagster etc)

- task driven versus data driven tasks
- data driven know about data, and can test on data artifacts, versioning data etc

Is data passed between task


### Monitoring

Did pipelines run



## Components of a Data Engineering System

### Choosing technology

Performance + maturity + reliability differs a lot between cloud offerings

### What is a Data Lake?

https://en.wikipedia.org/wiki/Data_lake

Structured and unstructured data
Fast arrival (e.g. no need to clean up first)
Can handle data from any source
No need to worry about schema, schema changes
Blob or file storage (S3, Google Cloud Storage, Azure Blob?)

Combination of analytics platform (like Spark, Python) and a storage platform (S3, Azure Blob etc).

Important properties of data lakes:
- Support for unstructured and semi-structured data.
- Scalability to PetaBytes and higher.
- SQL like interface to interact with the stored data.
- Ability to connect various analytics tools as seamlessly as possible.
- Are generally a combination of decoupled storage and analytics tools.

https://aws.amazon.com/big-data/datalakes-and-analytics/what-is-a-data-lake/


References:
- [Modern Data Lakes Overview](https://developer.sh/posts/delta-lake-and-iceberg)



### Databases

#### Database operations

Upsert = An operation that inserts rows into a database table if they do not already exist, or updates them if they do


### What is a Data Warehouse?

https://en.wikipedia.org/wiki/Data_warehouse

Focus on business analytics

Loads data from many sources (makes copies)

Built using ETL or ELT

Focus on structured data
  Schema clearly defined
  Easy to search and analyze
  Can only handle data with specific schema
  Schema changes will cause a lot of trouble
  Data warehouse

Redshift, Snowflake, Google BigQuery
- better access to hadoop by only SQL

OLTP-based relational databases are, by definition, meant for transactional loads. For analytical loads, data lakes, data warehouses, data marts, there’s another list of databases.


### What is a Data Mart?

Simple data warehouse


## Data Lake House


## ETL tools

Stitch

Fivetran


## Tools

- git
- dbt
- Snowflake,
- boto
- Stitch, 
- Fivetran,
- Serverless,
- BigQuery (can this be data warehosue?)
- Redshift (can this be data warehosue?)
- Postgres (can this be data warehosue?)


## dbt

SQL + yaml + Python

- use to extract data from data warehouse

Modelling raw data

Generate documentation

https://www.getdbt.com/

dbt connects to and runs SQL against your database, warehouse, platform, or query engine.

## What makes dbt so powerful?

As a dbt user, your main focus will be on writing models (i.e. select queries) that reflect core business logic – there’s no need to write boilerplate code to create tables and views, or to define the order of execution of your models. Instead, dbt handles turning these models into objects in your warehouse for you.

dbt handles boilerplate code to materialize queries as relations. For each model you create, you can easily configure a materialization.

Jinja templating


## Who should use dbt?

dbt is appropriate for anyone who interacts with a data warehouse. It can be used by data engineers, data analysts and data scientists, or anyone that knows how to write select queries in SQL.



## Great Expectations

https://docs.greatexpectations.io/docs/why_use_ge
- automated testing of data in prod
- similar use case to data ingestion - https://greatexpectations.io/case-studies/heineken-case-study/

## Hypothesis

https://hypothesis.readthedocs.io/en/latest/
- more powerful unit testing
- https://www.hillelwayne.com/contract-examples/


### Spark

Spark
- no persistence
- no sharing (data is copied)
- no indexes
- 70% is SQL
- moves the data to the query (problem)


## Resources Used

[16 fundamental principles for transforming data in a warehouse](https://miles2code.com/data/datawarehouse/2021/05/11/data-modeling-principles.html)

[CS329 - Lecture 3 - Data Engineering](https://docs.google.com/document/u/1/d/1b9iuZiDEGVLHyMmnf6w2y1aN6yWQhAyqk3GHlpI9q6M/mobilebasic)

[Modern Data Stack for Analytics Engineering - Kyle Shannon](https://youtu.be/UmIZIkeOfi0)

[The New Data Engineering Stack](https://towardsdatascience.com/the-new-data-engineering-stack-78939850bb30)

[Learn from Silicon Valley’s Data Engineers: Dimensional Data Modeling is Dead](https://blog.devgenius.io/learn-from-googles-data-engineers-dimensional-data-modeling-is-dead-68f6c2cb3fb0)

- storage is cheap - means the memory saving you make in db from star/snowflake schema = not valuable
- maintenance cost of updating data models when source changes


## Reading

[The Unbundling of Airflow](https://blog.fal.ai/the-unbundling-of-airflow-2/) - how the new ecosystem of data tooling is taking away parts of what Airflow used to be used for.

---

Creating a Data Engineering Culture -  Jesse Anderson

https://youtu.be/VkeleGIUSM8 - [slides](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbnFJc3JJWk9VcHU2a2h2ZEJSWUJxT1dBMnpEUXxBQ3Jtc0ttSm1pY2dYWnM3SW1JZTIzcFRQejZfYmRwN3R5aEJWQTdrS29uQmtDcWZQdmRXb1BxN09QZlhnbjRxZTdpTnVoUmhOTW1qNVFDbjVxLThtLWNyUGhNOTRlLXI4MnpYRkQzcEJITkxQVWdDUVZOcDgxdw&q=https%3A%2F%2Fwww.dataengconf.com%2Fspeaker%2Fcreating-a-data-engineering-culture%3Futm_source%3Dyoutube%26utm_medium%3Dsocial%26utm_campaign%3D%2520-%2520DEC-BCN-18%2520Slides%2520Download)

Top 10 Data Engineering Mistakes - Lars Albertsson
https://youtu.be/Hyhwem1Gyjo

Future of Data Engineering - Chris Riccomini
https://youtu.be/ZZr9oE4Oa5U

[An introduction to Entity Resolution — needs and challenges](https://towardsdatascience.com/an-introduction-to-entity-resolution-needs-and-challenges-97fba052dde5)

Entity resolution

For understanding the data, computers need to identify records that refer to the same real-world entity

A corporate service provider can use entity resolution to resolve organization names despite the different representations, misspellings, abbreviations, and typographical errors.

Leading and trailing white spaces, hyphens, case differences, and dots can make any two addresses look different when they are not.

[andkret/Cookbook](https://github.com/andkret/Cookbook) - The Data Engineering Cookbook

- hit and miss, early chapters are better

[Top 10 blog posts to help you transition to data engineering](https://blog.insightdatascience.com/top-10-blog-posts-to-help-you-transition-to-data-engineering-1db2312ecdaf)

`mara/mara-pipelines` - a lightweight data transformation framework with a focus on transparency and complexity reduction [github](https://github.com/mara/mara-pipelines)

[Stanford Seminar - Big Data is (at least) Four Different Problems](https://youtu.be/S79-buNhdhI)

https://youtu.be/S79-buNhdhI?t=1849


## Daniel Molnar talks

Berlin Buzzwords 2016
- [slides](https://www.slideshare.net/soobrosa/migrating-a-data-stack-from-aws-to-azure-via-raspberry-pi)
- [talk](https://www.youtube.com/watch?time_continue=378&v=QhXPANTd9nE&feature=emb_logo)

Data Janitor 101 - [slides](https://www.slideshare.net/soobrosa/data-janitor-101)

a/b
- don't a/b test (unless it really makes sense)
- costs too much
- world isnt IID
- random variation in small samples
- most results are illusory
- small data -> bayesian

lots of data science is about proving something isn't working
- importance of curiosity, talking to users
- causation versus corrulation

- computers are a sadness, I am the cure
- chose boring technology
- discovering python
- you suck at excel, data driven products now!
- chris stucchio on testing
