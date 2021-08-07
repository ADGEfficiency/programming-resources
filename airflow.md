# Airflow

- [tutorial](https://airflow.apache.org/docs/apache-airflow/stable/tutorial.html)
- [providers.amazon.aws](https://airflow.apache.org/docs/apache-airflow-providers-amazon/stable/_api/airflow/providers/amazon/index.html)

Airflow made of:
- Redis database,
- scheduler Python process, always on server (~4 CPU)
- runs other compute resources to do the data processing

Tasks don't pass data between them:
- data loaded & saved inside each task

Talks
- [Best practices with Airflow - Maxime Beauchemin](https://youtu.be/dgaoqOZlvEA)
- [A Practical Introduction to Airflow - Matt Davis](https://youtu.be/cHATHSB_450)

## Airflow in Practice Stop Worrying Start Loving DAGs - Sarah Schattschneider - https://youtu.be/XD7euLOzKbs

Inspired by CRON - uses CRON tabs
- repeated tasks

Why not CRON?
- logging, monitoring, alerting

What is Airflow
- programatic workflows,
- stateful scheduling,
- CLI + web interface,
- logging, monitoring, alerting
- modular, testable
- solves common batch processing problems

Hook (noun?)
- all interactions with an API
- S3hook, lambda hook

Operator (action)
- instantiate a hook or two to complete a single goal
- PythonOperator, BashOperator

Task
- instance of operator

Value of Airflow
- retry tasks elegantly
- alert on failure
- track dependency
- distributed execution (distributed workers)
- extensible CRON scheduling

CRON scheduling

monday at 0400
- '0 4 * * 1'

10th day of month at 10:50
- '5 10 3 * *'

Challenges
- upgrading challenging with custom hooks & operators

Data sharing
- XCOMS - cross communication between tasks,
- Airflow variables - live in Airflow database,
- Python variables (in memory),
- Environment variables

XCOM + Python = most traceable

Subdags for snapshoting databases
- from database -> s3 -> another database

Slack notifications

Testing
- `airflow_list_dags` check all workflows compile

Markdown documentation
- define in code, appear in web inteface

6 questions about workflow
- summary
- is mission critical
- on failure actions
- points of contact 
- business use case
- prerequisites/dependencies/resourcing



## Elegant data pipelining with Apache Airflow - Bolke de Bruin - 2018 - https://youtu.be/neuh_2_zrt8

Developed by Airbnb 2015, moved to Apache 2016
- used by Reddit, Linkedin, Paypal

ETL, ML, predictive pipelining

Fully open source

Workflows defined in Python

Tasks (like data cleaning) can run in any language

Creates DAGs (directed acyclic graphs)
- DAG defined in Python code,
- Airflow can watch S3 buckets for new dags

Backfills, retries, clears

Functional programming
- no side affect
- idempotent (same thing each time, not stochastic)
- add dates throughout the pipline
- be immutable - no delete, upsert, insert, append - instead just overwrite!

Can use templating to parametrize dates

Creates lineage in data
- track dependencies in the data processing


## Jarek Potiuk: What's coming in Apache Airflow 2.0 | PyData Warsaw 2019 - https://youtu.be/p6d3tr02exQ

Apache product = can trust it

Airflow as an orchchestrator:
- tells others what to do,
- synchronizes work between others,
- monitors what is going on,
- intervenes if needed,
- mostly doesn't do much.

What is airflow good at:
- regular ETL jobs (CRON),
- fixed intervals of data,
- managing complex dependencies,
- backfilling data,
- interface to 100's of different systems

Airflow is not good for streaming!
