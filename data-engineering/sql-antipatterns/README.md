# 2 - Multicolumn Attributes

Use an intersection table to model many-to-many relationships.

```sql
CREATE TABLE relationships (
    a_id INTEGER,
    b_id INTEGER,
    PRIMARY KEY (a_id, b_id),
    FOREIGN KEY (a_id) REFERENCES a(a_id),
    FOREIGN KEY (b_id) REFERENCES b(b_id),
);
```

# 3 - Trees

Nested relationships.

# 4 - Ids

Primary keys do three things:
- prevent duplicates,
- allow reference of individual rows,
- support foreign keys to create associations between tables.

Don't use a column called `id` - use `account_id` or `bug_id`.

Can use `JOIN ... USING (col)` rather than `JOIN ... ON (col = col)`.

# 5 - Keyless Entry

Foreign keys ensure that values in one table exist in another.

TODO - write out in SQL

# 7 - Polymorphic Associations

Demonstrates how to setup one-to-many relationships for two models (features or bugs):

- a bug can have many comments,
- a feature can have many comments.

```shell-session
$ rm db.sqlite
$ sqlite3 db.sqlite < 7-polymorphic-associations.sql
```

The anti-pattern occurs when we have bugs, features and comments table, without any referential integrity between the comments table and the bugs and features tables.

Solutions to the anti-pattern are:

- intersection tables,
- ancestor table.

# 8 - Multicolumn Attributes

TODO - copy lessons from the SQL into here
