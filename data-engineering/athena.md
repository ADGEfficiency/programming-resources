# AWS Athena

Limited on the amount of data we can pull - limited by boto when reading csv


### https://www.upsolver.com/blog/aws-athena-performance-best-practices-performance-tuning-tips

Therefore its performance is strongly dependent on how data is organized in S3—if data is sorted to allow efficient metadata based filtering, it will perform fast, and if not, some queries may be very slow.

In addition, Athena has no indexes—it relies on fast full table scans. This means some operations, like joins between big tables, can be very slow, which is why Amazon recommends running them outside of Athena.

Amazon places some restrictions on queries: for example, users can only submit one query at a time and can only run up to five simultaneous queries for each account.

... there are **two main areas** you would need to focus on to improve the performance of your queries in Athena:

1. data structure on s3,
 - Optimizing the storage layer – partitioning, compacting and converting your data to columnar file formats make it easier for Athena to access the data it needs to answer a query, reducing the latencies involved with disk reads and table scans
2. queries.
 - Query tuning – optimizing the SQL queries you run in Athena can lead to more efficient operations.


### Data structure on S3

1. partitioning
2. use parquet
3. dont use small (less than 128 MB) files
4. join in etl layer (ie python)
5. optimize how columnar data stored (stripe size, block size)
6. optimize queries

`ORDER BY ... LIMIT` -> sorts in parallel

`GROUPBY` arrange in order of cardinality, use `SELECT cols`

## https://aws.amazon.com/blogs/big-data/top-10-performance-tuning-tips-for-amazon-athena/

1. partition (but not too much that you get small files)
2. bucket data
3. compress
4. file sizes (128 MB minimum)
5. column data stored
6. query tuning
7. only include columns you need

---

