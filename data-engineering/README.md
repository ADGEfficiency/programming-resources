---
tags:
- dbt
- metabase
---

# Data Engineering

## What is data engineering?

1. **access to data** - all the important data, in the same place, easily queryable & accessible by everyone in the business,
2. **access to data generation/creation/transformation**.

> the most basic foundation of what is most critically needed: all the important data, in the same place, easily queryable (from https://erikbern.com/2021/07/07/the-data-team-a-short-story.html)


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

## Principles

- always save raw data unchanged,
- keep schemas separate from database code (so can easily change databases),
- system test with 'toy' systems (pull 2 months of data, put it through the entire pipeline etc),
- particular + consistent on column naming - a common set of columns used in many tables,
- capitalization is not important,
- use binary formats (Parquet etc) where possible.

## Components of a data engineering system

Datalake - unstructured data/file storage

Database - structured data storage, can be queried using a query language (commonly SQL), usually relational, performant way to store & access data.

Computation layers:

- serverless functions,
- Linux boxes,
- containers.

Orchestration - how to create/schedule/monitor pipelines.

Python - scripting / computing.  pandas, pytest, poetry, pydantic, mypy.

Optional

Data warehouse = analytics database:

- Snowflake, Redshift,
- different data layout (columnar) = better for analytics,
- use when you hit limits with transactional

Athena - easy way to do SQL over S3 data (acts like a relational database).

Streamining / queueing

NoSQL

Spark / Dask / Ray

Elastic Search

## Good data engineering practices

- always save raw data unchanged (*idempotency* is a core part of our data pipeline design),
- keep schemas separate from database code (so we can easily change databases),
- particular + consistent on column naming - a common set of columns (`pytz_timezone`, `datetime_utc`, `last_changed_utc`, `E, B, Q, K` etc) for use in many tables,
- we only rely on capitalization ( `datetime` != `Datetime` ) at *sim engine time*, not anywhere else (our databases tend to flatten column names),
- parquet everywhere - columar (important!) binary data format, can be read & visualized directly by frontend,
- Our work always need to be account aware - our infra is always deployed across accounts (not within account).

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

- opening binary files in text editors -> weird characters / numbers

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
- bespoke / experimental / convenience.


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

Snowflake:
- cloud data warehouse as a service
- focus on SQL

Databricks:
- less managed,
- data lakehouse (data lake + SQL),
- Spark


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

[Shopify's Data Science & Engineering Foundations](https://shopify.engineering/shopifys-data-science-engineering-foundations)

Kimball style relational models - not that important it's the best strategy, but that it's what was agreed.

Single data modelling platform, anyone can access.

[The Unbundling of Airflow](https://blog.fal.ai/the-unbundling-of-airflow-2/) - how the new ecosystem of data tooling is taking away parts of what Airflow used to be used for.

[Good enough practices in scientific computing](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005510)

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
- world isn't IID
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


## Example Projects

[gitlab-data/analytics](https://gitlab.com/gitlab-data/analytics)

[Open-Source Data Engineering Projects](https://brain.sspaeti.com/open-source-data-engineering-projects/)

[josephmachado/data_engineering_project_template ](https://github.com/josephmachado/data_engineering_project_template)

## Textbooks

[Data Engineering Design Patterns](https://www.dedp.online/)

## Architecture

## [A modern data stack for startups](https://incident.io/blog/data-stack)

Fivetran and Stitch are both ETL tools designed to transport data from various sources into destinations. We use both to load data into BigQuery, our data warehouse.

Once in BigQuery, we clean and transform the data using a tool called dbt. This allows us to turn raw source data into an ideal, 'data warehouse native', format that can be easily used for analysis.

Finally, Metabase provides a visualisation and analytics layer, running queries against BigQuery.

This dataset contains many tables, and each table will be either:

Dim ⇒ dimension table
Fct ⇒ fact table
Stg ⇒ staging table

### Dimension (dim) and fact (fct) tables

Normally described as 'marts', these tables represent key business data and have been engineered for ease of use when querying.

An example of a dimension table is dim_organisations. In general, dimension tables have a single row per entity they describe (ie, an organisation) and have a large number of columns that can be used to filter and group those entities.

Fact tables are complementary to dimension tables, and can be seen as a list of things that happened (also referred to as an 'event stream').

### Staging (stg) tables

Source data, which is what Fivetran and Stitch generate, is unstable and often awkward to use.

Instead of having people query the awkward source tables, we choose to build staging tables from the source data which:
- Renames columns to be consistent (all true/false columns start with is_ or has_)
- Casts columns to the right type (timestamp strings are parsed as timestamps)
- Extracts deeply nested data into a suitable form (custom fields become columns)

And whatever else is needed to turn the source data into the 'ideal' data for querying.

### dbt

```
dbt/models
├── marts
│  └── core
│      ├── core.yml
│      ├── dim_incidents.sql
│      ├── dim_organisations.sql
│      ├── dim_users.sql
│      ├── fct_organisation_statistics.sql
│      └── fct_user_incident_graph.sql
└── staging
    ├── close
    │  ├── README.md
    │  ├── src_close.yml
    │  ├── stg_close.yml
    │  ├── stg_close__activities.sql
    │  ├── stg_close__leads.sql
    │  └── stg_close__opportunities.sql
    └── product
        ├── README.md
        ├── src_product.yml
        ├── stg_product.yml
        ├── stg_product__actions.sql
        ├── stg_product__announcement_rules.sql
        ├── ...
        └── stg_product__workflows.sql
```

You'll see mentions of 'base' tables in dbt literature, described as the first transformation after source and appearing before staging. We've opted not to create these, and to go straight for staging tables - this avoids maintaining another layer of dbt schemas, and lots of our data (especially Product) is close to staging format at source anyway.

We don't produce marts from staging models unless we join them across schemas (as with the dimension tables) or perform complex transformations on them (fact tables). Again, this is to reduce the number of dbt schemas.

We only have core marts right now. Until we add more marts, it makes little sense implementing a more complex structure (such as grouping marts under business units), better to adapt as we grow.

---

Once we had the stack up and running, we ran two workshops aiming at different audiences:

- Intro to dbt, for engineers who will build dbt models. We can't hire a fulltime BI team just yet, and think we can get by with engineers surfacing more complex data features to Metabase by defining them in dbt. This session covered our dbt setup and we mobbed on adding a feature to a dbt model, manually running the schema sync into Metabase.
- Intro to data, for the entire company. Everyone is expected to use data in their work, so everyone needs to be familiar with Metabase. This session included a rundown of the stack, then working as a group to visualise a few key business metrics. Finally, we took a list of questions we've been dying to have answered and divided it among us, with people trying to answer them in pairs.

## [Data-Oriented Architecture | Eyas's Blog](https://blog.eyas.sh/2020/03/data-oriented-architecture/)

DOA is an inversion of the traditional dichotomy between a monolithic binary and data store (monolithic architecture) on the one hand, and small, distributed, independent binaries each with their own data stores (microservices, and service-oriented architecture) on the other. 

In data-oriented architecture, a monolithic data store is the sole source of state in the system, which is being acted on by loosely-coupled, stateless microservices.

### Monoliths

In a monolithic service, the bulk of server-side code is in one program that is talking to one or more databases, handling multiple aspects of a functional computation. Imagine a trading system that receives requests from customers to buy or sell some security, prices them, and fills their orders.

Within a monolithic server, code could still be componentized and separated into individual modules, but there’s no forced API boundary between the different components of the program. The only rigidly defined APIs in the program are typically either (a) between the UI and the server (in whatever REST/HTTP protocol they decide on), (b) between the server and the data stores (in whatever query language they decide on), or (c) between the server and its external dependencies.

### Service-Oriented Architecture and microservices

Microservices are a type of service-oriented architecture. 

Service-oriented architectures (SOA), on the other hand, break up monolithic programs into services for each independent, componentized function.

The interface between each of these services is a formally-defined API layer. Services typically communicate one-on-one through RPCs, although other techniques like message-passing and pubsub are common.

Service oriented architectures allow different services to be developed and reasoned about independently (and in parallel), if needed. The services are loosely-coupled, which means that a totally new service can now reuse the other services.

As each service in an SOA defines its own API, each service can be independently accessed and interacted with. Developers debugging or mocking individual pieces can call individual components separately, and new flows can re-compose these individual services to enable new behaviors.

### Scaling microservices

What I’m getting at here is that as a microservices ecosystem grows, it starts being susceptible to the following problems at scale:

1. N2 growth in complexity of integration as the number of components grow2,
2. The shape of a network becomes hard to reason about a priori; i.e. creating or maintaining a testing environment or sandbox will require a lot of reasoning to make sure no component within a graph has an external dependency

### Data Oriented Architecture

In Data-Oriented Architecture (DOA), systems are still organized around small, loosely-coupled components, as in SOA microservices. But DOA departs from microservices in two key ways:

1. Components are always stateless - Rather than componentizing and federating data stores for each relevant component, DOA mandates describing the data or state-layer in terms of a centrally managed global schema.
2. Component-to-component interaction is minimized, instead favoring interaction through the data layer

### DOA Component Communication

1. Data Produces and Consumes

Organizing components into producers and consumers of data is the main way to design a DOA system.

If you can, at a high level, write your business logic as a series of map, filter, reduce, flatMap, and other monadic operations, you can write your DOA system as a series of components, each which queries or subscribes to its inputs and produces its outputs. The challenge in DOA is that these intermediate steps are visible, queryable data—which means that it needs to be well-encapsulated, well-represented, and corresponds to a particular business-logic concept. The advantage, though, is that the behavior of the system is externally observable, traceable, and auditable.

2. Triggering Actions and Behaviors

Sometimes, the simplest way to think about communication between components is as an RPC. While a well-designed DOA system3 should see a majority of its inter-component communication replaced by producer/consumer paradigms, you might still need direct ways for component X to tell Y to do Z.

First, it’s important to consider if RPCs can be reorganized as events and their effects. I.e., asking if, rather than component X sending RPCs to component Y where event E happens, can X instead produce events E, and have component Y drive the responses by consuming these events?

There is, of course, a naïve way to implement data-based events, where each event is persisted to a database in its own table corresponding 1:1 with a serialized version of a the RPC request. In that case, data-based events don’t decouple a system at all. For data-based events to work, translating a request/response into persisted events require them to be meaningful business-logic constructs.

### It’s all about the trade-off

This architecture is not a magic bullet. Where data-oriented architecture erases classes of problems, new ones arise: It requires the designer to think hard about data ownership.

## [A modern data stack for startups (2022) | Hacker News](https://news.ycombinator.com/item?id=38812087)

## [Emerging Architectures for Modern Data Infrastructure | Andreessen Horowitz](https://a16z.com/emerging-architectures-for-modern-data-infrastructure/) 

## [Emerging Architectures for Modern Data Infrastructure | Hacker News](https://news.ycombinator.com/item?id=24814687)

This article has a large gap in the story: it ignores sensor data sources, which are both the highest velocity and highest volume data models by multiple orders of magnitude.

I will make a prediction. When software that can address sensor data models becomes a platform instead of bespoke, it will eat the lunch of a lot of adjacent data platforms that aren’t targeted at sensor data for a simple reason: the extreme operational efficiency of data infrastructure required to handle sensor data models applies just as much to any other data model, there simply hasn’t been an existential economic incentive to build it for those other data models.

---

There are typically 2 types of data to collect: Transactional data and behavioural data.

Most transactional data, due to their important nature, are already generated and captured by the production applications. Since the logic is coded by application engineer, it's usually hard to get this data wrong. These data are then ETL-ed (or EL-ed) over to a DW, as described by the article.

For behavioural data, this is where your statement will most apply to. This is where tools like Snowplow, Posthog, Segment, etc come in to set up the proper event data collection engine. This is also where it's important to "collect data properly", as these kinds of event data changes structure fast, and hard to keep track over time. I'd admit this space (data collection management) is still nascent, with only tools like iterative.ly on the market. 

## [Writing a high quality data pipeline for master data with apache spark – Part 1 – Kapernikov](https://kapernikov.com/writing-a-high-quality-data-pipeline-for-master-data-with-apache-spark-part-1/)

1. composability,
2. re-use logic instead of data,
3. verifability - that jobs are executable, external datasets are compliant, pipelines don't violate contracts,
4. version control.

[Building a data team at a mid-stage startup: a short story](https://erikbern.com/2021/07/07/the-data-team-a-short-story.html)

[Building a data team at a mid-stage startup | Hacker News](https://news.ycombinator.com/item?id=27777594)

# [Data Engineering Wiki](https://dataengineering.wiki/Index)

## [Concepts](https://dataengineering.wiki/Concepts/Concepts)

### [Claim Check Pattern](https://dataengineering.wiki/Concepts/Claim+Check+Pattern)

The claim-check pattern is used to reduce the cost and size of large messages by first storing the data in an external storage location and then sending a reference to the data/event to the consumer.

1. Send message
2. Store message in data store
3. Enqueue the message's reference (i.e. key)
4. Read the message's reference
5. Retrieve the message
6. Process the message

Claim Check Pattern Advantages

    Reduces cost of data transfer via messaging/streams. This is because storage is usually cheaper than messaging/streaming resources (memory).
    Helps protect the message bus and client from being overwhelmed or slowed down by large messages.
    Allows you to asynchronously process data which can help with scalability/performance.

Claim Check Pattern Disadvantages

    If the external service used to store the payload fails, then the message will not be delivered.
    Requires additional storage space and adds additional time to store/retrieve data.

[How to learn data engineering](https://www.blef.fr/learn-data-engineering/)

If we go a bit deeper, I think that every data engineer should have basis in:

- data modeling — this is related to the way the data is stored is a data warehouse and the field has been cracked years ago by Kimball dimensional modeling and also Inmon model. But it recently got challenged because of "infinite" cloud power with OBT (one big table or flat) model. In order to complete your understanding of data modeling you should learn what's an OLAP cube. The cherry on the cake here is the Slowly Changing Dimensions — SCDs — concept.
- formats — This is a huge part of data engineering. Picking the right format for your data storage. Wrong format often means bad querying performance and user-experience. In a nutshell you have: text based formats (CSV, JSON and raw stuff), columnar file formats (Parquet, ORC), memory format (Arrow), transport protocols and format (Protobuf, Thrift, gRPC, Avro), table formats (Hudi, Iceberg, Delta), database and vendor formats (Postgres, Snowflake, BigQuery, etc.). Here a small benchmark between some popular formats.
- batch — Batch processing is at the core of data engineering. One of the major task is to move data from a source storage to a destination storage. In batch. On a regular schedule. Sometime with transformation. This is close to what we also call ETL or ELT. The main difference between both is the fact that your computation resides in your warehouse with SQL rather than outside with a programming language loading data in memory. In this category I recommend also to have a look at data ingestion (Airbyte, Fivetran, etc.), workflows (Airflow, Prefect, Dagster, etc.) and transformation (Spark, dbt, Pandas, etc.) tools.
- stream — Stream processing can be seen as the evolution of the batch. This is not. It addresses different use-cases. This is often linked to real-time. Main technologies around stream are bus messages like Kafka and processing framework like Flink or Spark on top of the bus. Recently all-in-one cloud services appeared to simplify the real-time work. Understand Change Data Capture — CDC.
- infrastructure — When you do data engineering this is important to master data infrastructure concepts. You'll be seen as the most technical person of a data team and you'll need to help regarding "low-level" stuff you team. You'll be also asked to put in place a data infrastructure. It means a data warehouse, a data lake or other concepts starting with data. My advice on this point is to learn from others. Read technical blogs, watch conferences and read 📘 Designing Data-Intensive Applications (even if it could be overkill).
- new concepts — in today's data engineering a lot of new concepts enter the field every year like quality, lineage, metadata management, governance, privacy, sharing, etc.
