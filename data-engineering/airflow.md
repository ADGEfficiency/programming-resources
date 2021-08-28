what is important about orctestration

- how to track dependencies,
- can you pass data between tasks


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


## https://docs.prefect.io/core/getting_started/why-not-airflow.html#scheduling-and-time

Airflow has a strict dependency on a specific time: the execution_date. No DAG can run without an execution date, and no DAG can run twice for the same execution date. Do you have a specific DAG that needs to run twice, with both instantiations starting at the same time? Airflow doesn’t support that; there are no exceptions. 

More confusingly, the execution_date is not interpreted by Airflow as the start time of the DAG, but rather the end of an interval capped by the DAG’s start time. This was originally due to ETL orchestration requirements, where the job for May 2nd’s data would be run on May 3rd. Today, it is a source of major confusion and one of the most common misunderstandings new users have.

This interval notion arises from Airflow’s strict requirement that DAGs have well-defined schedules

The Airflow Scheduler is the backbone of Airflow. This service is critical to the performance of Airflow and is responsible for:

    reparsing the DAG folder every few seconds
    checking DAG schedules to determine if a DAG is ready to run
    checking all Task dependencies to determine if any Tasks are ready to be run
    setting the final DAG states in the database

Airflow is remains bottlenecked by its own scheduler, which (with default settings) takes 10 seconds to run any task (5 seconds to mark it as queued, and 5 seconds to submit it for execution). No matter how big your Dask cluster, Airflow will still only ask it to run a task every 10 seconds.

XCOMs - are written to the Airflow metadata database


## https://dagster.io/blog/dagster-airflow

Airflow includes:
- a centralized scheduler responsible for scheduling runs and tasks,
- a web server,
- a set of workers for task processing.
