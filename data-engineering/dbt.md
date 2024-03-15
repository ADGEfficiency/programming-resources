## dbt

SQL + yaml + Python

- use to extract data from data warehouse

Modelling raw data

Generate documentation

https://www.getdbt.com/

dbt connects to and runs SQL against your database, warehouse, platform, or query engine.

## What makes dbt so powerful?

As a dbt user, your main focus will be on writing models (i.e. select queries) that reflect core business logic – there’s no need to write boilerplate code to create tables and views, or to define the order of execution of your models. Instead, dbt handles turning these models into objects in your warehouse for you.

dbt handles boilerplate code to materialize queries as relations. For each model you create, you can easily configure a materialization.

Jinja templating


## Who should use dbt?

dbt is appropriate for anyone who interacts with a data warehouse. It can be used by data engineers, data analysts and data scientists, or anyone that knows how to write select queries in SQL.


---
## https://docs.getdbt.com/faqs/loading-data

### How do I load data into my warehouse?

dbt assumes that you already have a copy of your data, in your data warehouse. We recommend you use an off-the-shelf tool like Stitch or Fivetran to get data into your warehouse.

### Can dbt be used to load data?

No, dbt does not extract or load data. It focuses on the transformation step only.

## [dbt(Data Build Tool) Tutorial · Start Data Engineering](https://www.startdataengineering.com/post/dbt-data-build-tool-tutorial/#1-introduction)

Warehouse connections are in `profiles.yml`

## [How we style our dbt models | dbt Developer Hub](https://docs.getdbt.com/best-practices/how-we-style/1-how-we-style-our-dbt-models)

## [What's your data engineering stack at your company? : r/dataengineering](https://www.reddit.com/r/dataengineering/comments/slolx6/whats_your_data_engineering_stack_at_your_company/)

Transforming data is easy. The problem is that you reach a point when you have:

- high demand for more transformations
- you need to maintain and change the many transformations you have
- understanding all of this is also crucial

Basically you have a lot of demand to use the data in many ways.

People who are very good with spark, python et al. Are hard and expensive to come by, and it can be hard to interpret.

DBT lets you do everything in SQL which is easier to interpret and cheaper / easier to hire for. You basically make analysts responsible for what engineers needed to do before.

[Uplevel your dbt workflow with these tools and techniques · Start Data Engineering](https://www.startdataengineering.com/post/uplevel-dbt-workflow/)

[How we style our dbt models | dbt Developer Hub](https://docs.getdbt.com/best-practices/how-we-style/1-how-we-style-our-dbt-models)
