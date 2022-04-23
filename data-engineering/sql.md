# SQL

## Learnt on the job

- SQL injection + prepared statements,
- indexing,
- less tables usually better

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

[Thoughts on Foreign Keys?](https://github.com/github/gh-ost/issues/331)

[How slow is SELECT * ?](https://vettabase.com/blog/how-slow-is-select/)

[fredbenenson/kickstarter_sql_style_guide](https://gist.github.com/fredbenenson/7bb92718e19138c20591)

[SQL Zoo](https://sqlzoo.net/)

[10 minute SQL test as part of an interview for a ‘Senior Research Data Scientist’](https://www.reddit.com/r/datascience/comments/cpe76y/10_minute_sql_test_as_part_of_an_interview_for_a/)

[An Easy Introduction to SQL for Data Scientists](https://towardsdatascience.com/an-easy-introduction-to-sql-for-data-scientists-83363ae004b9)

[Three must know SQL questions to pass your data science interview](https://medium.com/@jayfeng/three-must-know-sql-questions-to-pass-your-data-science-interview-463311c7eaea)

[Modern Data Practice and the SQL Tradition](Modern Data Practice and the SQL Tradition)

[Mastery with SQL](https://www.masterywithsql.com/) - a hands-on practical course for anyone who wants to learn modern SQL

[We Can Do Better Than SQL](https://edgedb.com/blog/we-can-do-better-than-sql/)

[What exactly does being proficient in SQL entail?](https://www.reddit.com/r/dataengineering/comments/k3ygzc/what_exactly_does_being_proficient_in_sql_entail/?utm_medium=android_app&utm_source=share)

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


## Code tutorials

[Practical SQL for Data Analysis](https://hakibenita.com/sql-for-data-analysis) - [HN Discussion](https://news.ycombinator.com/item?id=27025829)


## Code exercises

[SQLBolt](https://sqlbolt.com/) - [HN Discussion](https://news.ycombinator.com/item?id=27842067) - interactive lessons and exercises designed to help you quickly learn SQL right in your browser.

[SQL Challenge - Mode](https://mode.com/sql-challenge/)


## Books

[The Art of PostgreSQL](https://theartofpostgresql.com/)
