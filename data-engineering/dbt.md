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
[How to build a mature dbt project from scratch](https://www.getdbt.com/coalesce-2021/how-to-build-a-mature-dbt-project-from-scratch)

    Infancy: Initial setup of dbt, using basic commands to replicate existing ETL processes.
    Toddlerhood: Introduction of modularity, documentation, and testing to improve reliability and maintenance.
    Childhood: Standardization of project operations, including naming conventions and minimum requirements for documentation and testing to prepare for broader team involvement and scaling.
    Adolescence: Expansion of the project's capabilities, focusing on performance optimization, increased data dimensions, and deeper integration with the dbt community through packages.
    Adulthood: Solidification of the project's role within the data infrastructure, emphasizing mature integration with other tools, extensive documentation, and advanced features like metadata management.


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

[Advantages of Using dbt(Data Build Tool) · Start Data Engineering](https://www.startdataengineering.com/post/advantages-of-using-dbt-data-build-tool/)

1. Easy to use for non engineers (shared data knowledge between engineering and non engineering teams)
2. Extremely flexible data model (recreate data easily, backfills are easy)
3. If most of your transformations are at a data warehouse level, this tool makes it extremely easy to do
4. Built in testing for data quality
5. Online, searchable data catalog and lineage
6. Reusable macros
7. Shockingly low learning curve
8. Production run using dbt cloud or through Airflow trigger.
