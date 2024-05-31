# Data Pipelines

- isolated transformations,
- dependency,
- testing,
- visibility.

https://www.reddit.com/r/dataengineering/comments/tt0yv7/handbook_for_commom_pipelines/

Three stage:
- raw
- cleaned / processed
- aggregated / final / polished / business objects

There is a configuration registry which contains the details of data (csv file). Details include but not limited to
  primary key of data
  incremental field of data (for incremental ingestion)
  partition field
  ingestion style (incremental/full)

## Pipelines Best Practices

    handle late-arriving data

    keep raw data to support reprocessing

    handle occasional bursts from reprocessing, backfilling, etc

    support comprehensive unit-testing and constraint-checking

    minimize tight-coupling by subscribing to domain objects rather than replicate physical schemas

    manage costs on cloud databases

    provide a low-enough data latency to satisfy their users

    automate everything

    observability & alerting & KPIs

    data dictionaries / data catalogs / documentation

Documentation

Visibility/Transparency ,metadata (run history) and logging

Error recovery

Monitoring

Robust and offers some governance. 

    Idempotency and atomicity built in

    Incremental loading where applicable,

    Pipeline keeps incremental state in a cheapest, most portable and accessible way - at destination.

    Re-using glue code in a declarative way

    Memory management for scalability, sometimes parallelism, buffer raw data to files for resuming or retrying, or reprocessing later

    Support local testing and unit tests - pipeline should be runnable locally.

    Self deploying schemas

    Self healing schemas and automatic db migrations

    Tracking schemas and knowing when they change

    Data type conversions from weakly/untyped to strongly typed, so they do not get implicitly converted or guessed later

    ddl and their performance hints deployed by the pipeline to enable self ddl deployments.

    Extraction retries with incremental backoffs (only way to load big pulls from Zendesk for example)

    Loading retries on network issues

    error handling

    data contracts if ingesting data from sources that might sent trash (web events for example)

    Ensuring any kept raw data is in accordance with GDPR's right to be forgotten (30d expiration on PII data or some deletion strategy)

    documentation

## https://www.reddit.com/r/dataengineering/comments/tsdocr/is_this_a_well_designed_idempotent_airflow/


[Components, Workflows, and Cookbooks - Omri Fima | PyData Global 2021](https://youtu.be/QZe3o0KnmYE)

components (ingredients) - reusable code
- highly shareable / reusable

workflow (recipe) - reusable atomic piece of work
- has entrypoint + arguments
- shareable reliable, consistent building blocks

cookbook (menu) - combination of workflows and cookbooks
- business flow?
- curated, env specific, task specific, experimental

```
/pipelines
--/components
----resources.py
----secrets.py
----environment.py
--/workflows
----feature_eng.py
----train.py
--/cookbooks
----long_covid.py
----e2e_test.py
```

Namespace isolation for pipelines
- one branch = one namespace
- push updates the namespace

3 types of namespace
- serving - snapshot of prod pipeline
- research - WIP research
- master/e2e - continuously validate health of codebase

Wrote a client to run jobs off

```
cli = ArgoClient()
results = cli.submit()
results.outputs['accuracy']
```


Will use data orchestration, workflow management interchangeably

Integrating a data orchestration framework requires answering three steps:

1. Why use a framework?
2. Which framework to use?
3. How to use that framework?

## 1. Why use a framework?

Currently (2022-08-30) we have answered why a framework - data pipeline orchestration of pipelines with complex dependencies is difficult to build with AWS primitives.  

## 2. Which framework to use?

How to judge/evaluate a framework?

- language - most are Python,
- maturity - documentation, availability of developers with experience,
- data aware - does the orchestrator have visibility on actual data transformations in tasks,
- SAS availability,
- maintenance - operations overhead, outage frequency, time taken to fix bugs,
- deployment - version upgrades
- development - going from `.py` -> scheduled pipeline,
- testing,
- scaling - scheduler bottlenecks, execution environment limitations,
- observability.

5 = better

Airflow:

- mature & outdated,
- legacy concepts,
- can't run locally without a scheduler.

Prefect:

- successor to Airflow,
- launched Prefect 2 in 2022,
- run flows without an agent easily,
- Prefect offers a managed solution for the UI - provide the scheduling & execution environment yourself.

Dagster:

- successor to Airflow, less mature than Prefect
- data aware - has more insight / access to data inputs, outputs & transformations,
- not only task dependencies but data dependencies,
- Dagster cloud - https://dagster.io/cloud.


---
