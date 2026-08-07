---
id: lakehouse
aliases: []
tags:
  - data-engineering
---

[Understanding Parquet, Iceberg and Data Lakehouses at Broad](https://davidgomes.com/understanding-parquet-iceberg-and-data-lakehouses-at-broad/)

A Data Lake is where companies store their large amounts of data in some raw format like OCR or Parquet, or even CSV files (picture an S3 bucket with lots of these files). This is different from a Data Warehouse where companies are storing this data in a more structured way (schematized SQL tables and database schemas).

The important thing to remember is that neither Delta Lake nor Iceberg are query or storage engines in of themselves. Instead, they’re open specifications that allow query engines to do their job. And they enable a lot of features such as:

    Partitioning
        In specific, Iceberg supports partitioning evolution. This means that you can change the partitioning scheme (or shard key) of a table without rewriting all the existing data. This was a huge painpoint at Netflix and it was one of the reasons they created Iceberg.
    Schema Evolution
    Data Compression
    ACID Transactions around schema changes
    Efficient Query Optimization (things like column pruning, predicate pushdown, and statistics collection to accelerate queries)
    Time travel (point in time queries)
