/*
Want to have a bugs table that allows tags.
*/
DROP TABLE IF EXISTS bugs;

CREATE TABLE IF NOT EXISTS bugs (
    bug_id INTEGER PRIMARY KEY,
    bug TEXT,
    tag1 TEXT,
    tag2 TEXT
);

INSERT INTO bugs (bug, tag1, tag2) VALUES (
    'This is a bug', 'important', 'urgent'
);
INSERT INTO bugs (bug, tag1) VALUES (
    'This is another bug', 'important'
);

/*
To search for bugs with a tag, we need to search in all tag columns:
*/
SELECT
    bug,
    tag1,
    tag2
FROM bugs WHERE tag1 = 'important' OR tag2 = 'important';

/*
To search for two tags, we can use an IN clause:
*/

SELECT
    bug,
    tag1,
    tag2
FROM bugs
WHERE
    'important' IN (tag1, tag2)
    AND 'urgent' IN (tag1, tag2);

/*
Updating requires reading the row, as you don't know which column it could be in.

The update below will not work if none of the two tags columns are null:
*/

UPDATE bugs
SET
tag1 = COALESCE(tag1, 'not urgent'),
tag2 = COALESCE(tag2, 'not urgent')
WHERE bug_id = 2;

SELECT
    bug,
    tag1,
    tag2
FROM bugs
WHERE
    'not urgent' IN (tag1, tag2);

/*
Hard to prevent duplicate tags.

Can be expensive to add tags4:
- might require locking the entire table,
- could required duplicating the table (which can be slow),
- might require revisiting every query that uses the table.

Recognizing the anti-pattern:

- what is the greatest number of tags you will ever need?
- how can I search multiple columns at once?

# Solution 1 - Dependent Table

Create a table for tags:
*/

DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS bugs;

CREATE TABLE IF NOT EXISTS bugs (
    bug_id INTEGER PRIMARY KEY,
    bug TEXT
);

CREATE TABLE IF NOT EXISTS tags (
    bug_id INTEGER,
    tag TEXT,
    PRIMARY KEY (bug_id, tag),
    FOREIGN KEY (bug_id) REFERENCES bugs(bug_id)
);

INSERT INTO bugs (bug) VALUES ('This is a bug');
INSERT INTO bugs (bug) VALUES ('This is another bug');
INSERT INTO tags (bug_id, tag) VALUES (1, 'important');
INSERT INTO tags (bug_id, tag) VALUES (2, 'important');
INSERT INTO tags (bug_id, tag) VALUES (2, 'urgent');

SELECT * FROM bugs JOIN tags USING (bug_id) WHERE tag = 'important';

/*
Can also query for multiple tags:
*/

SELECT * FROM bugs
JOIN tags as t1 USING (bug_id)
JOIN tags as t2 USING (bug_id)
WHERE t1.tag = 'important' AND t2.tag = 'urgent';

/*
Can easily delete tags - just delete the one row.

The primary key ensures no duplication is allowed.

Now no limit on number of tags per bug
*/
