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
