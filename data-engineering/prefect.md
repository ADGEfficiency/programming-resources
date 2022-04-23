# Intro to Prefect



---
task, flow, flow runs

prefect questions we had
- terminology
- flow, agent
- how to link tasks, manage dependencies


https://docs.prefect.io/core/tutorial/01-etl-before-prefect.html

problems with 
- parallelization,
- workflow failures affect unrelated code

extract, transform & load


## https://docs.prefect.io/core/concepts/tasks.html

task = function
- `@task`,
- inherit from `prefect.Task`, define `run` method
- can retry `max_retries` `retry_delay`
- retry != new task

smaller tasks = errors are more contained

Triggers handle dependencies
- `all_successful`, `any_failed` etc

Prefect flows are not executed when you create them
- define time versus run time

## https://docs.prefect.io/core/concepts/flows.html#overview

Flow = container for tasks
- DAG
- graph = edges + nodes,
- directed = edge start & end
- acyclic = no circular dependencies

Imperative API allows fine grained control

- separate data dependencies from state dependencies

Flows have schedules


## https://docs.prefect.io/core/concepts/states.html#overview

States = data about tasks & flows - `State` object

- fundamental data unit = State 

## https://docs.prefect.io/core/concepts/engine.html#overview

- flow runner = contiounsly tries to run flows - will run forever,
- task runner = single task,
- state data object,
- Executor = interface with external envs

runners input/output state objects

Executor actually runs tasks

- Dask distributed recommended
- https://distributed.dask.org/en/latest/
- runs python functions

Submit Python functions

Can use `LocalExectuor` locally (no Dask)

## https://docs.prefect.io/core/concepts/execution.html#triggers


## https://docs.prefect.io/core/concepts/schedules.html


Three components of schedule:

- clock - emits events,
- filters - avoid running on weekends,
- adjustments - modify events - like advancing to next month


## https://docs.prefect.io/core/concepts/results.html

## https://docs.prefect.io/api/latest/engine/results.html

https://docs.prefect.io/core/advanced_tutorials/using-results.html

## https://docs.prefect.io/core/idioms/targets.html

flow results - https://docs.prefect.io/core/advanced_tutorials/using-results.html

---

## https://docs.prefect.io/core/concepts/persistence.html


---


## https://docs.prefect.io/core/concepts/templating.html

---

Prefect brings a bunch of abstractions - two important ones are the flow & flow run.

What to label flow runs:

    give maximum visibility of what is running in the flow run name,
    something like nem_prices_raw_2014-01-01

What to label flows:

    flows can be quite general purpose, so are reused,
    what happens to existing/scheduled flow runs if a flow is changed/updated?
    much of the EMD work fits nicely into an ETL abstraction -> reuse of the ETL flow
    will reusing get us into trouble in between stages?

Agents - looks out for and runs flows

Project - just a label

---
## Prefect Targeting

[https://stackoverflow.com/questions/63419097/prefect-how-to-avoid-rerunning-a-task](https://stackoverflow.com/questions/63419097/prefect-how-to-avoid-rerunning-a-task)

For caching / not rerunning already run tasks in Prefect:

The simplest way to cache a task is to use targets, which 
lets you specify that the task has a templatable side effect (usually a 
file in local or Cloud storage, but could be e.g. a database entry, 
redis key, or anything else). Before the task is run, it checks if the 
side effect exists and if it does, skips the run.

For example, this task will write its result to a local file automatically templated with the task name and the current date:

`@task(result=LocalResult(), target="{task_name}-{today}")
def get_data():
    return [1, 2, 3, 4, 5]`
