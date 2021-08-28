task, flow, how flows run


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
