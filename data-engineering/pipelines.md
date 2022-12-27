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

## https://www.reddit.com/r/dataengineering/comments/tsdocr/is_this_a_well_designed_idempotent_airflow/


[Components, Workflows, and Cookbooks - Omri Fima | PyData Global 2021](https://youtu.be/QZe3o0KnmYE)

components (ingredients) - reuseable code
- highly shareable / reusable

workflow (recipe) - reuseable atomic piece of work
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
