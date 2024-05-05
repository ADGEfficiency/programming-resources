.headers on
.echo on

/*
Want to have one-to-many relationships between bugs and comments, and features and comments.

One bug or feature can have many comments.
*/

CREATE TABLE IF NOT EXISTS bugs (
  bug_id INTEGER PRIMARY KEY,
  issue_id INTEGER NOT NULL,
  bug TEXT
);

CREATE TABLE IF NOT EXISTS features (
  feature_id INTEGER PRIMARY KEY,
  issue_id INTEGER NOT NULL,
  feature TEXT
);

CREATE TABLE IF NOT EXISTS comments (
  comment_id INTEGER PRIMARY KEY,
  issue_type TEXT NOT NULL,
  issue_id INTEGER NOT NULL,
  comment TEXT
);

INSERT INTO
  bugs (issue_id, bug)
VALUES
  (1, 'This is a bug'),
  (2, 'This is another bug');

INSERT INTO
  features (issue_id, feature)
VALUES
  (3, 'This is a feature'),
  (4, 'This is another feature');

INSERT INTO
  comments (issue_type, issue_id, comment)
VALUES
  ('bug', 1, 'This is a bug comment'),
  ('bug', 2, 'This is another bug comment'),
  ('feature', 3, 'This is a feature comment'),
  ('feature', 4, 'This is another feature comment');


/*
With this setup, we lack of referential integrity on issue_id, as we cannot have the issue_id refer to either the bugs table or features tables.

We can select comments for a given bug by id:
*/
.print "antipattern - select comment by id"
SELECT
  *
FROM
  bugs as b
  JOIN comments as c on (
    b.issue_id = c.issue_id
    AND c.issue_type = 'bug'
  )
WHERE
  b.issue_id = 1;

/*
If we want to select all bugs and features, we need to use an outer join:
*/
.print "\nantipattern - select all bug and feature comments"
SELECT
  *
FROM
  comments as c
  LEFT OUTER JOIN bugs as b ON (
    b.issue_id = c.issue_id
    AND c.issue_type = 'bug'
  )
  LEFT OUTER JOIN features as f ON (
    f.issue_id = c.issue_id
    AND c.issue_type = 'feature'
  );

/*
Spotting the antipattern:
- can associate a comment with any table in the database,
- can't declare foreign keys,
- a column `issue_type` that references different tables on different rows.

Should never use this anti-pattern.

# Reverse the relationship

Polymorphic associations are backwards - if we reverse the relationship, the problem goes away.

We can create an intersection table for each parent table, which includes:

- a foreign key to the parent table,
- a foreign key to the comment table.
*/

CREATE TABLE IF NOT EXISTS bugscomments (
  issue_id INTEGER NOT NULL,
  comment_id INTEGER NOT NULL,
  PRIMARY KEY (issue_id, comment_id),
  FOREIGN KEY (issue_id) REFERENCES bugs(issue_id),
  FOREIGN KEY (comment_id) REFERENCES comments(comment_id)
);

CREATE TABLE IF NOT EXISTS featurescomments (
  issue_id INTEGER NOT NULL,
  comment_id INTEGER NOT NULL,
  PRIMARY KEY (issue_id, comment_id),
  FOREIGN KEY (issue_id) REFERENCES features(issue_id),
  FOREIGN KEY (comment_id) REFERENCES comments(comment_id)
);

INSERT INTO
  bugscomments (issue_id, comment_id)
VALUES
  (1, 1),
  (2, 2)
;

INSERT INTO
  featurescomments (issue_id, comment_id)
VALUES
  (3, 3),
  (4, 4),

;

/*
Now we can query for comments by id:
*/

.print "\nsoln 1 - reverse relationship - select bug comment by id"
SELECT * FROM bugscomments as b JOIN comments AS c using (comment_id) WHERE b.issue_id = 1;

/*
We can now query for all bugs or features by comment id.

Still need to refer to each table by name:
*/
.print "\nsoln 1 - reverse relationship - select bugs or features comments by id"
SELECT * FROM comments as c
LEFT OUTER JOIN (bugscomments JOIN bugs as b USING (issue_id)) USING (comment_id)
LEFT OUTER JOIN (featurescomments JOIN features as f USING (issue_id)) USING (comment_id)
WHERE c.comment_id = 1
;

/*
Can make the result appear as it the parents were stored in a single table with a union:
*/

SELECT b.issue_id, b.bug, NULL AS feature FROM comments as c JOIN (bugscomments JOIN bugs as b USING (issue_id)) using (comment_id) WHERE comment_id = 1
UNION
SELECT f.issue_id, f.feature, NULL AS bug FROM comments as c JOIN (featurescomments JOIN features as f USING (issue_id)) using (comment_id) WHERE comment_id = 1;

/*
Another alternative is to use COALESCE to combine the results of the two queries.

This will return its first non-null argument
*/

SELECT c.*,
COALESCE(b.issue_id, f.issue_id) as issue_id
FROM comments as c
LEFT OUTER JOIN (bugscomments JOIN bugs as b USING (issue_id)) USING (comment_id)
LEFT OUTER JOIN (featurescomments JOIN features as f USING (issue_id)) USING (comment_id)
WHERE c.comment_id = 1;

/*
# Soln 2 - Common Super Table

By using an ascestor table issues, we can rely on the enforcement of foreign keys.

In each table relationship, there is one referencing and one referenced table.
*/

DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS issues;
DROP TABLE IF EXISTS bugs;
DROP TABLE IF EXISTS features;

CREATE TABLE IF NOT EXISTS issues (
  issue_id INTEGER PRIMARY KEY
);

CREATE TABLE bugs (
  issue_id INTEGER NOT NULL,
  bug TEXT,
  FOREIGN KEY (issue_id) REFERENCES issues(issue_id)
);

CREATE TABLE features (
  issue_id INTEGER NOT NULL,
  feature TEXT,
  FOREIGN KEY (issue_id) REFERENCES issues(issue_id)
);

CREATE TABLE comments (
  comment_id INTEGER PRIMARY KEY,
  issue_id INTEGER NOT NULL,
  comment TEXT,
  FOREIGN KEY (issue_id) REFERENCES issues(issue_id)
);

INSERT INTO
  comments (issue_id, comment)
VALUES
  (1, 'This is a bug comment'),
  (2, 'This is another bug comment'),
  (3, 'This is a feature comment'),
  ( 4, 'This is another feature comment');

INSERT INTO
  bugs (issue_id, bug)
VALUES
  (1, 'This is a bug'),
  (2, 'This is another bug');

INSERT INTO
  features (issue_id, feature)
VALUES
  (3, 'This is a feature'),
  (4, 'This is another feature');

.print "\nsoln2 - common super table - select comment by id"
SELECT *
FROM comments as c
LEFT OUTER JOIN bugs as b USING (issue_id)
LEFT OUTER JOIN features as f USING (issue_id)
WHERE c.comment_id = 1;
