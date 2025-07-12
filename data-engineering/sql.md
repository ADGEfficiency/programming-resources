# SQL

## Learnt on the job

- SQL injection + prepared statements,
- indexing,
- less tables usually better
- see unique values with a groupby and count, rather than distinct (better info)
- always write the WHERE first before I write the DELETE FROM statement. 

## Relational Databases

Could be it's own file

Database relationship = associations created by joins

1. one to one,
2. one to many,
3. many to many.

Primary key = unique identifier for each row

Foreign key = column that creates relationships between tables
- references primary key of another table
- all relationships should be sorted by foreign keys

## Subqueries

A subquery is a query nested inside another query. It can perform operations in a step by step manner.

Subqueries can be used in SELECT, FROM, or WHERE clauses.

```sql
SELECT
  employee_name
FROM
  employees
WHERE
  department_id IN (
    SELECT
      department_id
    FROM
      departments
    WHERE
      department_name = 'Sales'
  );
```

A subquery is limited to being used within an expression.

## CTE

A CTE (Common Table Expression) defines a temporary result set that you can reference within another SELECT, INSERT, UPDATE, or DELETE statement. 

```sql
WITH
  Department_IDs AS (
    SELECT
      department_id
    FROM
      departments
    WHERE
      department_name = 'Sales'
  )
SELECT
  e.employee_name
FROM
  employees e
  JOIN Department_IDs d ON e.department_id = d.department_id;
```

A CTE is a like a temporary table. They can be easier to read than nested subqueries. They are also reusable, testable and you can run parts of them.

DBT encourages the use of CTEs:

```sql
WITH sales_dept_employees AS (
    SELECT employee_id
    FROM {{ ref('departments') }} d
    JOIN {{ ref('employees') }} e ON d.department_id = e.department_id
    WHERE d.department_name = 'Sales'
)

SELECT e.employee_name
FROM {{ ref('employees') }} e
JOIN sales_dept_employees sde ON e.employee_id = sde.employee_id;
```

## [Improve your SQL skills X2 in 5 minutes - by Anton Zaides](https://zaidesanton.substack.com/p/the-most-underrated-skill-sql-for)


```sql
CREATE TABLE deals (
deal_id INT PRIMARY KEY,
deal_amount DECIMAL(10, 2),
customer_name VARCHAR(255),
region VARCHAR(255),
deal_date DATE
);

INSERT INTO deals
(deal_id, deal_amount, customer_name, region, deal_date)
VALUES
(1, 2500.00, 'Acme Corporation', 'North America', '2023-01-15'),
(2, 25000.00, 'Globex Corporation', 'North America', '2023-01-20'),
(3, 1250.00, 'Acme Corporation', 'North America', '2023-02-11'),
(4, 3000.00, 'Initech', 'Europe', '2023-03-22'),
(5, 2000.00, 'Hooli', 'Europe', '2023-03-27'),
(6, 20000.00, 'Vehement Capital Partners', 'Europe', '2023-04-05'),
(7, 15000.00, 'Massive Dynamic', 'North America', '2023-04-15'),
(8, 15000.00, 'Soylent Corp', 'Asia', '2023-05-01'),
(9, 17000.00, 'Initech', 'Europe', '2023-05-20'),
(10, 15000.00, 'Pied Piper', 'Asia', '2023-06-03'),
(11, 7500.00, 'Globex Corporation', 'North America', '2023-06-25'),
(12, 8000.00, 'Pied Piper', 'Asia', '2023-07-12'),
(13, 17000.00, 'Hooli', 'Europe', '2023-07-18'),
(14, 12000.00, 'Soylent Corp', 'Asia', '2023-08-02'),
(15, 9000.00, 'Massive Dynamic', 'North America', '2023-08-21'),
(16, 23000.00, 'Vehement Capital Partners', 'Europe', '2023-09-11'),
(17, 3000.00, 'Pied Piper', 'Asia', '2023-09-30'),
(18, 4900.00, 'E Corp', 'North America', '2023-10-05'),
(19, 35000.00, 'E Corp', 'North America', '2023-10-20'),
(20, 6000.00, 'Hooli', 'Europe', '2023-11-04');
```

## Get Max in each Region

Get max in each region with a subquery:

```sql
SELECT * 
FROM deals d1
WHERE d1.deal_amount = (
    SELECT MAX(deal_amount)
    FROM deals d2
    WHERE d1.region = d2.region
);
```

Problem with subqeery - typically requires subquery to be run for each row in the outer query/table.

Get max in each region with an CTE:

```sql
with max_deals_by_region AS (
    SELECT region, MAX(deal_amount) AS max_deal_amount
    from DEALS
    GROUP BY region
)

select d.*
from deals d
JOIN max_deals_by_region mdr
    on d.region = mdr.region
    AND d.deal_amount = mdr.max_deal_amount;
```

## Get Top 3 in each Region

Can use partitions:

```sql
WITH ranked_deals AS (
    SELECT
        deal_id,
        deal_amount,
        customer_name,
        region,
        deal_date,
        RANK() OVER (
            PARTITION BY region
            ORDER BY deal_amount DESC
        ) AS deal_rank
    FROM deals
)

SELECT
    deal_id,
    deal_amount,
    customer_name,
    region,
    deal_date
FROM ranked_deals
WHERE deal_rank <= 3
ORDER BY region, deal_rank;
```

`RANK` is a window function - allows us to perform calculations across a set of rows that are related to the current row.

We create those rows with `PARTITION BY` - the `PARTITION` divides the dataset into groups.

`ORDER BY` sorts the rows in each partition.

`RANK() OVER (PARTITION BY region)` assigns a rank within each region.

### Window Functions

Four main types:

1. ranking,
2. aggregate,
3. positional,
4. cumulative.

#### Ranking Window Functions

Main ranking functions are:

- `ROW_NUMBER()` - sequential numbers to rows,
- `RANK()` sequential numbers to rows, with same number for ties,
- `DENSE_RANK` - sequential numbers to rows, with same number for ties, no compensation for ties in next rows.

```sql
SELECT deal_id, deal_amount, customer_name, region, deal_date,
    ROW_NUMBER() OVER (
        PARTITION BY region ORDER BY deal_amount DESC
    ) AS row_number,
    RANK() OVER (
        PARTITION BY region ORDER BY deal_amount DESC
    ) AS rank,
    DENSE_RANK() OVER (
        PARTITION BY region ORDER BY deal_amount DESC
    ) AS dense_rank
FROM deals
ORDER BY region, deal_amount DESC;
```

#### Aggregation Window Functions

Similar to `GROUP BY`, but you can keep the data for the full row.

```sql
SELECT
    deal_id,
    deal_amount,
    customer_name,
    region,
    deal_date,
    ROUND((deal_amount / SUM(deal_amount) OVER
        (PARTITION BY region)) * 100, 2) AS deal_amount_pct
FROM deals
ORDER BY region, deal_date DESC;
```

#### Positional Window Functions

- `LEAD()` - returns value from row that follows current row,
- `LAG()` - returns row that preceeds current row.
- `FIRST_VALUE()` - returns first value in partition,
- `LAST_VALUE()` - returns last value in partition.

```sql
SELECT deal_id, deal_amount, customer_name, region, deal_date,
    deal_amount - LAG(deal_amount) OVER (
        PARTITION BY customer_name, region
        ORDER BY deal_date
    ) AS deal_change_from_previous
FROM deals
ORDER BY customer_name, region, deal_date;
```

## Slowly Changing Dimensions

[What is Data Engineering? - The Pragmatic Engineer](https://blog.pragmaticengineer.com/what-is-data-engineering/)

The traditional way to track historical changes in data was to use what we call Slowly Changing Dimensions (SCD). There are several different types of SCD, but one of the simplest to implement is SCD type 2 which has a start and end date, as well as an “is_current” flag.

An example of an SCD is a customer changing their address when they move home. Instead of just updating the current row which stores the address for said customer or employee, you will:

    Insert a new row with the new information.
    Update the old row, so it is no longer marked current.
    Ensure the end date represents the last date when the information was accurate.

This way, when someone asks, “how many customers did we have per region over the last 3 years,” you can answer accurately.

---

[ben-nour/SQL-tips-and-tricks: SQL tips and tricks](https://github.com/ben-nour/SQL-tips-and-tricks)

[Thoughts on Foreign Keys?](https://github.com/github/gh-ost/issues/331)

[How slow is SELECT * ?](https://vettabase.com/blog/how-slow-is-select/)

[fredbenenson/kickstarter_sql_style_guide](https://gist.github.com/fredbenenson/7bb92718e19138c20591)

[SQL Zoo](https://sqlzoo.net/)

[PostgreSQL Exercises](https://pgexercises.com/)

[10 minute SQL test as part of an interview for a ‘Senior Research Data Scientist’](https://www.reddit.com/r/datascience/comments/cpe76y/10_minute_sql_test_as_part_of_an_interview_for_a/)

[An Easy Introduction to SQL for Data Scientists](https://towardsdatascience.com/an-easy-introduction-to-sql-for-data-scientists-83363ae004b9)

[Three must know SQL questions to pass your data science interview](https://medium.com/@jayfeng/three-must-know-sql-questions-to-pass-your-data-science-interview-463311c7eaea)

[Modern Data Practice and the SQL Tradition](Modern Data Practice and the SQL Tradition)

[Mastery with SQL](https://www.masterywithsql.com/) - a hands-on practical course for anyone who wants to learn modern SQL

[We Can Do Better Than SQL](https://edgedb.com/blog/we-can-do-better-than-sql/)

[What exactly does being proficient in SQL entail?](https://www.reddit.com/r/dataengineering/comments/k3ygzc/what_exactly_does_being_proficient_in_sql_entail/?utm_medium=android_app&utm_source=share)

## [SQL join flavors](https://antonz.org/sql-join/)

## [SQL Join Flavors | Hacker News](https://news.ycombinator.com/item?id=37583197)

Having a deeper understanding of the different JOIN flavors is critical. For example, I don't think many people realize how deceptively dangerous OUTER joins are:

```sql
SELECT
  user.user_id
FROM
  users
  RIGHT JOIN purchases ON purchases.user_id = user.user_id
  AND user.user_id = 123
```

By leaving the user_id=123 constraint in the JOIN instead of putting it in the WHERE, you've just exposed everyone's purchase data to the user. 

---

 Outer joins are inherently risky because they make it very easy to put conditions in a place that looks correct (read: passes review) but isn't, and the results are disastrous (information leak). 

## [SQL Cheat Sheet](https://antonz.org/sql-cheatsheet/)

## https://www.linkedin.com/posts/eric-weber-060397b7_data-statistics-datascience-activity-6667857833138229248-mg_6

### Basic

SELECT and WHERE for filtering and selection

COUNT, SUM, MAX, GROUP BY, HAVING for aggregating data"

DISTINCT, COUNT DISTINCT for producing useful distinct lists and distinct aggregates

OUTER (e.g. LEFT) and INNER JOIN when/where to use them

Strings and time conversions

UNION and UNION ALL.

### Intermediate

DML/DDL/DCL concepts

Handling NULLs creatively (e.g. with COALESCE)

Using LEFT AND INNER JOIN as a means of filtering without using the WHERE statements.

Subqueries and the impact of subqueries on efficiency of the query. Some basic ability to tune the query.

Temporary tables

Self joins for leveraging a table against itself.

Window functions like PARTITION, LEAD, LAG, NTILE

UDFs (user defined functions)

Use of indexes in querying to make operations faster.

### Advanced

Recursive CTEs

Dynamic SQL generation

Query optimization

Materialized views

Intermediate:

Advanced:
1. Use of indexes in querying to make operations faster.
2. Window functions like RANK and DENSE RANK.
3. Stored procedures.
4. UDFs (user defined functions)
5. Triggers
6. PIVOT and UNPIVOT

## Why SQL

[Modern Data Practice and the SQL Tradition](https://tselai.com/modern-data-practice-and-the-sql-tradition.html)

NoSQL gives you freedom
modern sql databases handle JSON well with JSON columns
SQL can be cheaper

Bring ETL closer to the data

database validations fail early
modern sql db can handle complex functionality to work with text, dates and geolocational data
triggers, stored procedures

"NoSQL" DBs are usually used for serving fast, targeted queries. Often this is sold with the additional promises of horizontal scalability (see note 2). However, "NoSQL" is an unfortunate catch-all industry slang for "a database that isn't relational":

    it doesn't model the data as rows and columns

    it might not be queryable by SQL (see note 3)

Some examples are ElasticSearch, Cassandra, MongoDB, and Redis, whose main common trait is that they don't store or access data using the relational concept of rows and columns. 

## ORMs

[Object-Relational Mapping is the Vietnam of Computer Science](https://blog.codinghorror.com/object-relational-mapping-is-the-vietnam-of-computer-science/)

- mismatch between relational database models and traditional object models, object/relational impedance mismatch,
- relational concepts are at heart, are set-based (ORM = object based),
- the only workable solution to the ORM problem is to pick one or the other: either abandon relational databases, or abandon objects. If you take the O or the R out of the equation, you no longer have a mapping problem.

[Relational Databases Aren’t Dinosaurs, They’re Sharks](https://www.simplethread.com/relational-databases-arent-dinosaurs-theyre-sharks/)

Most relational databases come with four primary guarantees:

- Atomicity – The guarantee that any series of operations within a transaction are treated as a single unit. The entire thing either succeeds or fails, and won’t leave you in an invalid state.
- Consistency – The guarantee that any operation against the database will leave it in a valid state.
- Isolation – The guarantee that any operations executed concurrently will leave the database in the same state as they would have if they were executed sequentially. Generally this means that transactions can’t see data being modified by other transactions.
- Durability – The guarantee that once a transaction is committed, it will stay committed, regardless of whether the system crashes or power fails.

NoSQL makes tradeoffs - BASE:

- Basically Available – The system can guarantee availability, as defined by the CAP theorem, but by potentially trading off consistency.
- Soft State – The database doesn’t enforce data consistency, and values may change without interaction, due to eventual consistency.
- Eventual Consistency – When data is written, it isn’t guaranteed to be immediately consistent to all database consumers. Generally speaking, it has to be replicated across all nodes in the database, which means that any reads occurring during that time could be inconsistent.

NoSQL advantages:

- High Write Performance – Many NoSQL databases advertise having incredible write performance. Relational databases have spent years optimizing the speed of writes, but their speed is limited by their durability and consistency guarantees. Relational databases can only write as fast as their persistent memory will allow them to. Or as fast as they can process transactions, indexes, and foreign keys (especially if they have to block). Throwing out guaranteed immediate persistence, not allowing transactions, not enforcing foreign keys, etc… can immediately enable huge gains in write performance.
- High Read Performance – Many NoSQL databases have incredible read performance. This is often enabled due to balancing reads across a number of instances in a cluster, which provides high write performance, but generally gives up consistency due to eventual consistency. Many NoSQL databases also increase read performance by having simpler query syntaxes that don’t allow complex joins or queries across multiple “tables”, or whatever grouping mechanism they use.
- Easy Horizontal Sharding – Sharding historically has been a huge pain point for relational databases. The primary reason is that by sharding data across a number of remote instances, you end up having to give up a lot of the consistency guarantees that relational databases provide. For example, what if you had a foreign key between two tables that are sharded across a number of different instances. In order to enforce that foreign key, you would have to scan every instance in the cluster to find the related data. By getting rid of these kinds of data consistency checks, you can much more easily shard data across large numbers of instances without running into huge performance bottlenecks.
- Easy Schema Updates – Many NoSQL databases make database modifications much easier by being “schemaless”. This usually means that whatever structure you put data into the system, it is simply stored in that way. So if you need to add a new field, you simply start saving data with that new field. If you want that field across all of your data, then you write a job to update every record and add that field. Relational databases, on the other hand, usually have strict schemas and require more complex operations to update schemas. Particularly when a database is under heavy load.
- More Reliable, and Predictable, Performance – NoSQL databases often have much more reliable and predictable performance. Most relational databases provide a lot of opportunities to degrade performance, usually by poorly performing queries. SQL is an incredibly powerful language, but knowing the pitfalls of it, and how your particular relational database performs under different circumstances can be challenging. I’ve seen many instances where small changes to a SQL query can increase its performance by a hundred fold. Many NoSQL databases dramatically simplify data access (sometimes by only allowing key based access), and instead choose to duplicate data in order to make it more easily queryable or export data to dedicated reporting databases.

---

[Herding elephants: Lessons learned from sharding Postgres at Notion](https://www.notion.so/blog/sharding-postgres-at-notion)

[The data model behind Notion's flexibility](https://www.notion.so/blog/data-model-behind-notion)

- Changing the type of a block doesn’t change the block’s properties or content — it only changes the type attribute. The information is just rendered differently, or even ignored if the property isn’t used by that block type.
- Decoupling property storage from block type allows for efficient transformation and changes to our rendering logic. But it’s also essential for collaboration, because we preserve as much user intention as possible.
- ID, properties, type, content (children), parent,
-  In Notion, indentation is structural: it’s a reflection of the structure of the render tree. In other words, when you indent something in Notion, you are manipulating relationships between blocks and their content, not just adding a style.
-  

[The Next 50 Years of Databases - 2015](http://www.cs.cmu.edu/~pavlo/blog/2015/09/the-next-50-years-of-databases.html)

[Practical SQL for Data Analysis](https://hakibenita.com/sql-for-data-analysis) - What you can do without Pandas

[Things I Wished More Developers Knew About Databases](https://medium.com/@rakyll/things-i-wished-more-developers-knew-about-databases-2d0178464f78)

[Modern Data Lakes Overview](https://developer.sh/posts/delta-lake-and-iceberg)

[Terrifically Simple JSON](https://github.com/mpnally/Terrifically-Simple-JSON)

## https://en.wikipedia.org/wiki/Data_definition_language

Data description language (DDL) is a syntax for creating and modifying database objects (tables, indices, and users). 

DDL statements are similar to a computer programming language for defining data structures, especially database schemas. 

Common examples of DDL statements include CREATE, ALTER, and DROP. 

## From HN

https://news.ycombinator.com/item?id=27025829

resist the temptation to 'SELECT *' into a data frame and break the problem up into stages where you get the database to do the maximum work before it gets to the data frame. 


## Working with SQL

[Best practice for SQL statements in Python](https://www.btelligent.com/en/blog/best-practice-for-sql-statements-in-python/)

- don't use string concatenation,
- use parameterized queries.

[A terrible schema from a clueless programmer](https://rachelbythebay.com/w/2021/11/06/sql/)

Storing raw strings in databases = heavy.  Instead it should be normalized.

## Under the Hood

[A Beginner’s Guide to the True Order of SQL Operations – Java, SQL and jOOQ.](https://blog.jooq.org/a-beginners-guide-to-the-true-order-of-sql-operations/)

## Advice

1) As opposed to application programming languages that are coded either top-down or bottom-up, SQL is coded from the inside out. It's like constructing an onion; you code and test the innermost query first, then layer another query over that one and test it, then layer another query over that one and test it, etc.

2) Eliminate unneeded records as early as possible in your query (preferably in the innermost query), before you start joining sets of records together.

3) Learn to think in terms of sets of records and set operations; avoid "one-record-at-a-time" processing as much as possible!

4) Understand how the SQL query optimizer works, so you can write better and more efficient SQL code.

5) Test each query before writing the next one. Test-Driven Development (TDD) principles should be followed when writing SQL.

6) Do as much of the data work as possible on the database server, making use of the DBMS's resources and the query optimizer. Return to the calling process only the data it actually needs.

7) Make use of views and table-valued functions to simplify complex table joins and encapsulate complex functionality.


## Code tutorials

[Practical SQL for Data Analysis](https://hakibenita.com/sql-for-data-analysis) - [HN Discussion](https://news.ycombinator.com/item?id=27025829)


## Code exercises

[SQLBolt](https://sqlbolt.com/) - [HN Discussion](https://news.ycombinator.com/item?id=27842067) - interactive lessons and exercises designed to help you quickly learn SQL right in your browser.

[SQL Challenge - Mode](https://mode.com/sql-challenge/)


## Books

[The Art of PostgreSQL](https://theartofpostgresql.com/)

---

---

SQL has levels to it:

- level 1
SELECT, FROM, WHERE, GROUP BY, HAVING, LIMIT 

Master these basic keywords and you’ll be well on your way to mastering SQL. 

- level 2
Mastering JOINs:
Most common JOINs: INNER and LEFT 
Less common JOINs: FULL OUTER 
Joins you should avoid almost always: RIGHT and CROSS JOIN

Mastering common table expressions (CTEs). 

The WITH keyword defines a CTE which you can imagine as a “variable” that you can query later. 

Using variables like this you can master algorithm techniques like recursion, breadth first search and more! 

CTEs also make your SQL much more readable and make your coworkers hate you less compared to nested sub queries. 

- level 3
Mastering window functions 

Window functions have 3 pieces:

The function (i.e. SUM, RANK, AVG) 
The over clause to start the window 
The window definition which has 3 pieces:
- how to split the window up with PARTITION BY 
- how to order the window with ORDER BY 
- how to restrict the window size with ROWS clause (useful for rolling monthly averages)

Understand RANK vs DENSE_RANK vs ROW_NUMBER, I have been asked this in interviews a million times. 

- level 4
You understand table scans, b-tree indexes, and partitioning schemes to increase performance. 

Doing something like COUNT(CASE WHEN) is much better than doing multiple queries with a UNION ALL. UNION ALL is terrible for all sorts of reasons that I don’t want to get into in this post. 

B-trees indexes allow for efficient scanning of data in the WHERE clause. 

Use explain plans to understand if an index is actually being used or not! 

Partitioning is similar to indexes except it’s a “poor mans” index. It just keeps data in specific folders and skips the folders that don’t include the data I question. 

What else did I miss for mastering SQL?

[The Three Levels of SQL Comprehension: What they are and why you need to know about them | dbt Developer Blog](https://docs.getdbt.com/blog/the-levels-of-sql-comprehension)
