[palantir/pyspark-style-guide](https://github.com/palantir/pyspark-style-guide) - This is a guide to PySpark code style presenting common situations and the associated best practices based on the most frequent recurring topics across the PySpark repos we've encountered.

[owenrh/spark-fires](https://github.com/owenrh/spark-fires) - Spark fires is a anti-pattern playground where we deliberately break Spark applications in various ways so you can observe what happens and potentially recognise the issue when you come across it in your day-to-day development and support activities.

[eakmanrq/sqlframe: Turning PySpark Into a Universal DataFrame API](https://github.com/eakmanrq/sqlframe)

[650GB of Data (Delta Lake on S3). Polars vs. DuckDB vs. Daft vs. Spark | Hacker News](https://news.ycombinator.com/item?id=45920881)

Python UDFs in Spark are a known footgun
- Entire Python context serialized via cloudpickle and sent to executors
- Can be GBs of serialized data; almost always replaceable with native Spark functions
- One team baked a linter rule to catch UDF usage
