https://www.bitsondisk.com/writing/2021/retire-the-csv/

https://news.ycombinator.com/item?id=28221654

Creating a Data Engineering Culture -  Jesse Anderson

https://youtu.be/VkeleGIUSM8 - [slides](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbnFJc3JJWk9VcHU2a2h2ZEJSWUJxT1dBMnpEUXxBQ3Jtc0ttSm1pY2dYWnM3SW1JZTIzcFRQejZfYmRwN3R5aEJWQTdrS29uQmtDcWZQdmRXb1BxN09QZlhnbjRxZTdpTnVoUmhOTW1qNVFDbjVxLThtLWNyUGhNOTRlLXI4MnpYRkQzcEJITkxQVWdDUVZOcDgxdw&q=https%3A%2F%2Fwww.dataengconf.com%2Fspeaker%2Fcreating-a-data-engineering-culture%3Futm_source%3Dyoutube%26utm_medium%3Dsocial%26utm_campaign%3D%2520-%2520DEC-BCN-18%2520Slides%2520Download)

Top 10 Data Engineering Mistakes - Lars Albertsson
https://youtu.be/Hyhwem1Gyjo

Future of Data Engineering - Chris Riccomini
https://youtu.be/ZZr9oE4Oa5U

Upsert = An operation that inserts rows into a database table if they do not already exist, or updates them if they do

[CS329 - Lecture 3 - Data Engineering](https://docs.google.com/document/u/1/d/1b9iuZiDEGVLHyMmnf6w2y1aN6yWQhAyqk3GHlpI9q6M/mobilebasic)


[andkret/Cookbook](https://github.com/andkret/Cookbook) - The Data Engineering Cookbook
- hit and miss, early chapters are better

[Top 10 blog posts to help you transition to data engineering](https://blog.insightdatascience.com/top-10-blog-posts-to-help-you-transition-to-data-engineering-1db2312ecdaf)

`mara/mara-pipelines` - a lightweight data transformation framework with a focus on transparency and complexity reduction [github](https://github.com/mara/mara-pipelines)


## [Stanford Seminar - Big Data is (at least) Four Different Problems](https://youtu.be/S79-buNhdhI)

Michael Stonebreaker - created first RMDBS INGRES

Where will there be disruption in the big data market

Data science versus BI analytics
- BI analytics = SQL
- petascale SQL is a solved problem
- 500+ nodes, databases work well

Column stores are faster (compression on the columns)
- all databases offer this
- performance + maturity + reliability differs a lot between offerings

Warehouses are getting faster than resources are getting cheaper

Data scientists will replace BI
- predictive model or big table of numbers
- BI = big table of number

Take a decade to train enough data scientists

Data science
- data management - SQL (table) based calcs
- complex analytics - array based calcs

Example of calculating covariance between many stocks
- equivalent to `stock * stock.T`
- not a table calculation

### How to support data science

Option 1
- Map Reduce + HDFS (2008)
- dropped by Google in 2011 -> BigTable
- 2015 officially abandoned

2013
- MapReduce is mostly SQL market (Hive)

Option 2
- spark

Spark
- no persistence
- no sharing (data is copied)
- no indexes
- 70% is SQL
- moves the data to the query (problem)

Option 3
- move query to data
- use relational database for SQL
- user defined functions for analytics
- table to arry is expensive

Option 4
- use array based DMBS
- most efficient long term solution

https://youtu.be/S79-buNhdhI?t=1849

Big velocity
- complex event processing


## Daniel Molnar talks

Berlin Buzzwords 2016
- [slides](https://www.slideshare.net/soobrosa/migrating-a-data-stack-from-aws-to-azure-via-raspberry-pi)
- [talk](https://www.youtube.com/watch?time_continue=378&v=QhXPANTd9nE&feature=emb_logo)

Data Janitor 101 - [slides](https://www.slideshare.net/soobrosa/data-janitor-101)

emphasis on data quality

KPIs that matter
- DAU, WAU, MAU, LTV, churn
- cohorts, segments, funnels
- first hour, first day

KPI should show you where the problems are

Actionable

Excel = most used programming environment
- no version control, ugly

business analyst ->  data engineer
- not real time / stream at the start

data engineer = entinty recognition
- ETL, events, data warehouse
- know where your data is leaking
- testing - unit test data

- you will see noise

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

---

CS 329S: Machine Learning Systems Design - Lct 3 - Data engineering - https://docs.google.com/document/u/1/d/1b9iuZiDEGVLHyMmnf6w2y1aN6yWQhAyqk3GHlpI9q6M/mobilebasic


Sources of data
- user generated - search text, clicks,
- system generated - logs, metadata, model predictions,
- enterprise applications data - inventory, customer relationships,
- third party data - 1st party = own customers, 2nd party = collected by another company about own customers, 3rd party = data about public

Internet + smartphones = more data

| Format  | Binary or Text | Human-readable? | Use case     | Layout |
| JSON    | Text           | Yes             | Everywhere   | Arbitrary |
| CSV     | Text           | Yes             | Everywhere   | Row |
| Parquet | Binary         | No              | Tabular data | | Column |


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
