# Data Pipeline Orchestration

What is data pipeline orchestration?

- schedule tasks & computation, like scraping raw data, processing/cleaning data and aggregations,
- manage dependencies between tasks - if I get raw data again, which downstream tasks do I need to run again?
- monitoring & visibility of computation (future, current & past), easy access to logs.

Pipelines made of tasks that take inputs & create data artifacts:

- imperative - defined in Python (define both how and what),
- declarative - defined in YAML (define what only).

An orchestrator is commonly built from:

1. a scheduler / agent - responsible for starting tasks,
2. executor / worker(s) - run tasks,
3. metadata store -  keep track of pipeline execution,
4. UI - displays metadata on pipeline status & gives control over agent/tasks/workers.

With a data orchestration system you will often maintain two environments - an execution environment and a scheduling / agent environment.

The agent will be an always on service - even if we aren't tracking a task, the agent will still be listening.  Execution environments are only used when there are tasks to execute.

## Importance of DAGs

Directed acyclic graph

## Task versus data driven:

- task based =  decouple the task orchstration from the task itself (Airflow, Prefect),
- data driven =  know the kind of data they are using/creating (Dagster)

Argument for task based is that modern data systems (databases) are very aware of the data content, & can manage/optimize this.

## Orchestration Frameworks

What is important about an orchestration framework?

- how to track dependencies,
- can you pass data between tasks,
- does the orchestrator have visibility on actual data transformations in tasks,
- maturity, 
- documentation quality, 
- does SAS product exist - introduces dependencies, often less flexible but quicker to develop with & avoid solving solved problems.

Why an orchestration framework?

- workflows of data pipeline management are complicated to build from primitive AWS components (EC2, Lambda, RDS etc),
- the problems of data pipeline management (scheduling, batch compute etc) are common & share enough that they can be abstracted out.

# Data Orchestration Frameworks

Which framework (in 2022):

- Airflow 2,
- Prefect 2,
- Dagster.

## Airflow

- Apache,
- widely used / market leader, large community
- DAGs to define dependencies,
- DAGs defined in Python,
- distributed execution,
- connectors for AWS (like Lambda, S3 etc),
- AWS offers a fully managed service,
- batch scheduler aimed at data engineers principally concerned with orchestrating third-party systems employed by others in their organizations,
- not good for streaming, off-schedule / no-schedule tasks, dynamic tasks,
- flaws - scheduler bottlenecking (~10 sec), sharing data between tasks.

This means that if you want to:

- run your workflow on an irregular (or no) schedule
- run multiple simultaneous runs of your workflow
- maintain a workflow that only runs manually

then Airflow is the wrong tool.

More in programming-resources/data-engineering/airflow.md

## Prefect

- open source (?)
- designed to make up for some of Airflows flaws,
- more flexible ways to define tasks in vanilla Python (no 'airflow way'),
- Prefect Cloud - 10k runs per month for free,
- Prefect Server
- Prefect offers a semi-managed solution, you have to provide the workers yourself

Prefect Cloud versus Server - [https://docs.prefect.io/orchestration/](https://docs.prefect.io/orchestration/)

- cloud = hosted,
- server = open source, self deploy - see [https://docs.prefect.io/orchestration/server/overview.html](https://docs.prefect.io/orchestration/server/overview.html)

Prefect Cloud:

- permissions and authorization
- performance enhancements that allow you to scale
- agent monitoring
- secure runtime secrets and parameters
- team management
- SLAs

Task library - [https://docs.prefect.io/core/task_library/overview.html](https://docs.prefect.io/core/task_library/overview.html)

More in data-engineering/prefect.md

## Dagster

- more strict about defining what comes in & out of tasks than Airflow,
- eaiser to test,
- don't need to double define dependencies (both intra & inter task data dependencies need to be defined in AirfloW)

## Honorable Mentions

Luigi 

- no concept of DAG - harder to manage complex tasks,
- no ability to run distributed tasks → issues with scaling beyond a single pipeline,
- predecessor to Airflow

Argo

- DAGs defined in yaml,
- all tasks are container runs on Kubernetes.

## References

[https://docs.prefect.io/core/getting_started/why-not-airflow.html](https://docs.prefect.io/core/getting_started/why-not-airflow.html)

[https://www.datarevenue.com/en-blog/what-we-are-loving-about-prefect](https://www.datarevenue.com/en-blog/what-we-are-loving-about-prefect)

### [https://www.reddit.com/r/dataengineering/comments/oqbiiu/airflow_vs_prefect/](https://www.reddit.com/r/dataengineering/comments/oqbiiu/airflow_vs_prefect/)

> We actually just evaluated Airflow v Prefect and have decided to move forward with Prefect.
Prefect has more modern approach with a much cleaner Python API that is just easier to use, great docs and great community support through their Slack channel - we found a bug, put it on Slack and a fix was released 5 days later
A significant advantage was the infrastructure. We had Perfect up and running locally and in Azure in a flash, it's extremely easy to set up (whether you go for the Perfect Cloud or Server route). Airflow on the other hand was more finicky and time consuming and looking around it seemed like maintenance was less than ideal too
I'd also like to highlight the Perfect Cloud option too - yes you need to pay Prefect, but 10,000 free successful task runs per month is quite generous and not needing to host the orchestration later is a great way to onboard yourselves when you're just starting out. For us, it's shortened our time to production and we'll revaluate hosting the orchestration layer ourselves once we're using it more heavily

> If there is no remaining DevOps capacity a managed Airflow installation makes sense. Additionally, everything else is running on AWS? Go with their managed Airflow solution.
That's a question of "ease of integration". Your shop is fully invested in a cloud provider? Use the solution which integrates best with the existing cloud infrastructure. That would usually mean their managed Airflow product.

> I evaluated Airflow, Dagster, Argo and Prefect in the last couple of months.
As other have commented, Airflow is showing it's age. But a big pro for Airflow is the resources on the Internet - blogs, tutorials and so on.
Dagster made the impression it's not production ready yet. Their Slack Channel is full of questions "why did i get this error?", contrasted with the Slack Channel of Prefect, which has more of "How do i do this?".Prefects Slack Channel is also very, very active. Almost every question get's answered by the team and if it looks like a bug, they will open the Github Issue for you.
For me it came down to Argo and Prefect. Argo is a different beast than Prefect, as all configuration is written in YAML and all tasks are container runs on Kubernetes. So writing DAGs is completly independent of any programming language. It also has a side-project which is dedicated to responding to events from outside - something which is included in Airflow as Sensors but Prefect is currently lacking. But it's on their roadmap. A Workaround is a call to the Prefect GraphQL-API.
If you intend to run Kubernetes anyway, or already have a Kubernetes Cluster, i would recommend Argo as it offers a whole ecosystem of connected solutions: not just orchestration, but also responding to events and running a CI/CD pipeline.But that comes with a price: the learning curve is steep. I expect it to be more future proof than Prefect, as everything is moving to get dockerized anyway. And the abstraction level is higher. And IT in general is all about abstraction to make complicated things easier.
For me Prefect is a good fit as my use-case won't outgrow their 10.000 Flow Runs per Month and i like that i can outsource running the orchestration to someone who has much more experience in running it than me. Your data doesn't leave your control, their "Cloud Scheduler" just sends requests to your Prefect Workers at the appropriate time. Everything else executes under your control. And you get a very nice GUI which you do not have to host yourself. There's always the option of running your own Prefect Server, if you want to.
So:
You have a running Kubernetes Cluster: use Argo
You do not have a running Kubernetes Cluster: use Prefect. Running a Kubernetes Cluster just for Argo is overkill.

[https://dagster.io/blog/dagster-airflow](https://dagster.io/blog/dagster-airflow)

[https://www.reddit.com/r/dataengineering/comments/mzwk9e/airflow_vs_dagster/](https://www.reddit.com/r/dataengineering/comments/mzwk9e/airflow_vs_dagster/)

There are several aspects if you want to compare an orchestration tool with something exisiting like airflow:

First,
 how easy is it to build pipelines? This is not just the syntax, but 
also the whole eco system of plugins and operators that make it easy to 
talk to all the system you want to orchestrate. Here Airflow shows a lot
 of strength.

Second, how easy is 
it to manage your pipelines. That includes CI/CD, automated testing etc.
 here Airflow is showing some serious short comings.

Third
 how easy is it to operate your pipelines. What is the health of your 
orchestrator, what tools do you have available to track performance, 
what are the means to alert you when something goes wrong etc. Airflow 
is pretty good at this.

Last is 
(oh well there may be more, I dunno) how well does it scale. If you are 
running hundreds of Dags and tens of thousands of invocations a day, 
does the orchestrator keep up. That’s a hard question. Airflow had its 
problems but with V2 a lot of these are being addressed.

[https://kapernikov.com/a-comparison-of-data-processing-frameworks/](https://kapernikov.com/a-comparison-of-data-processing-frameworks/)
