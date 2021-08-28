Tools
- git
- dbt
- Snowflake
- Serverless
- BigQuery (can this be data warehosue?)
- Redshift (can this be data warehosue?)
- Postgres (can this be data warehosue?)


## What is a data engineer

data engineer = entinty recognition
- ETL, events, data warehouse
- know where your data is leaking
- testing - unit test data

- you will see noise



## Choosing technology

- performance + maturity + reliability differs a lot between offerings


## Big data

- volume
- velocity
- variety


## Sources of data

- user generated - search text, clicks,
- system generated - logs, metadata, model predictions,
- enterprise applications data - inventory, customer relationships,
- third party data - 1st party = own customers, 2nd party = collected by another company about own customers, 3rd party = data about public

Internet + smartphones = more data

| Format  | Binary or Text | Human-readable? | Use case     | Layout |
| JSON    | Text           | Yes             | Everywhere   | Arbitrary |
| CSV     | Text           | Yes             | Everywhere   | Row |
| Parquet | Binary         | No              | Tabular data | | Column |

## Data management versus analytics

- data management - SQL (table) based calcs
- complex analytics - array based calcs

## KPIs

Actionable

KPIs that matter
- DAU, WAU, MAU, LTV, churn
- cohorts, segments, funnels
- first hour, first day

KPI should show you where the problems are

## Rows versus columns

Column stores are faster (compression on the columns)
- all databases offer this

## Colmuns / Fields to have in your data

Ensure that all Facts/Events have a business timestamp and an arrival/etl timestamp

## Data sources

JSON
- most common,
- supported by many programming languages,
- versatile,
- key-value.

Row versus columar
- row good for transactions

CSV
- row based,
- good for accessing samples,
- good for writes (appends0

Parquet
- column based,
- good for accessing features,
- good for lots of reads, few writes (appends not good)

Numpy / pandas = columar
- example of accessing columns verus rows of dataframe

Text versus binary

- opening binary files in text editors -> wierd characters / numbers

Binary = more compact, but not human readable

OLTP versus OLAP [RnR]

ETL [RnR]
- sources, targets

ELT = no schema on load

Batch versus streaming

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

## Structured vs Unstructured

Structured versus unstructured data
- structured = schema


## What is a Data Warehouse?

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


## What is a Data Mart?

Simple data warehouse


## What is a Data Lake?

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



## Data Lake House



## Orchestration

Benefits
- parallelization,





## Resources Used

[16 fundamental principles for transforming data in a warehouse](https://miles2code.com/data/datawarehouse/2021/05/11/data-modeling-principles.html)
