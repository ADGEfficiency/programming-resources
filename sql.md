Learnt on the job

- SQL injection + prepared statements,
- indexing,
- less tables usually better ?


## ORMs

[Object-Relational Mapping is the Vietnam of Computer Science](https://blog.codinghorror.com/object-relational-mapping-is-the-vietnam-of-computer-science/)

- mismatch between relational database models and traditional object models, object/relational impedance mismatch,
- relational concepts are at heart, are set-based (ORM = object based),
- the only workable solution to the ORM problem is to pick one or the other: either abandon relational databases, or abandon objects. If you take the O or the R out of the equation, you no longer have a mapping problem.


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


## SQLite

https://sqlite.org/lpc2019/doc/trunk/briefing.md - a briefing on SQLite intended for Linux kernel hackers, and especially those working on Linux filesystems
- subroutine in same process
- same heap & stack

The Untold Story of SQLite - https://corecursive.com/066-sqlite-with-richard-hipp/


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


## SQL

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
