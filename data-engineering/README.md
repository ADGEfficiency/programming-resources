# Data Engineering


## What is data engineering?

A data engineer enables access to data

Emphasis on data quality

Data science versus BI analytics
- BI analytics = SQL
- petascale SQL is a solved problem
- 500+ nodes, databases work well

Data scientists will replace BI
- predictive model or big table of numbers
- BI = big table of number

Data science
- data management - SQL (table) based calcs
- complex analytics - array based calcs

Data management versus analytics

- data management - SQL (table) based calcs
- complex analytics - array based calcs (deep learning etc)


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


### What is a Data Mart?

Simple data warehouse


## Data Lake House


## Tools

- git
- great expectations
- dbt
- Snowflake
- Serverless
- BigQuery (can this be data warehosue?)
- Redshift (can this be data warehosue?)
- Postgres (can this be data warehosue?)

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

