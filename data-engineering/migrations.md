[Online migrations at scale](https://stripe.com/blog/online-migrations)

Four-phase approach: 

1. dual writing to old and new tables, 
2. switching read paths to the new table, 
3. updating write paths, 
4. removing old data

Why are migrations hard?

- scale,
- uptime,
- accuracy.

Offloaded backfilling to an offline process that has no impact on production.

[Migrating Messenger storage to optimize performance - Engineering at Meta](https://engineering.fb.com/2018/06/26/core-infra/migrating-messenger-storage-to-optimize-performance/)

[Changing Tires at 100mph: A Guide to Zero Downtime Migrations | Kiran Rao](https://kiranrao.ca/2022/05/04/zero-downtime-migrations.html)

    Create the new empty table
    Write to both old and new table
    Copy data (in chunks) from old to new
    Validate consistency
    Switch reads to new table
    Stop writes to the old table
    Cleanup old table

[Database Migrations](https://vadimkravcenko.com/shorts/database-migrations/)

Every migration that you’re implementing (and yes, you need to think of migrations as code, not just database changes) needs to work with three different scenarios:

## 1. Upgrading (Migrating up) 

New feature gets built, data model gets added/changed/removed. The new and old application versions are still expected to function as expected.

## 2. Downgrading (Migrating down) 

Something went wrong, there are data inconsistencies — you need a way to go back to the previous stable state in a controlled manner. Not with manual changes in the DB.

## 3. Everything in between 

Meaning all the data transformation logic needs to be taken care of. Though nowadays, there are many ways to do the data transformation over more extended periods of time with dual writes or a concept of “ghost tables” with the help of the gh-ost library from Github; we will talk about this later.

## Simple deployment

    Push your code to Bitbucket/Github/Gitlab.
    Deployment gets triggered.
    New docker containers get built
    Database migrations and all the related scripts are run
    Docker containers are restarted on the server

The approach above is absolutely valid if:

    You have a single application instance.
    You can allow yourself a few seconds of downtime.
    You’ve already tested the migrations on staging.

This is not a valid approach if:

    You’re running multiple app instances, which might result in a race condition for the migrations and an invalid database state.
    You have lots of data and need to transform it — which will block the deployment process or possibly timeout.
    Downtime is not an option.

## Scenarios

### Adding a new field

Easy

1. deploy migration
2. deploy new app

No-op from app perspective - shouldn't affect application

Provide default value if non-nullable

Default values can be particularly problematic for large datasets:

    Immediate update of all rows - once you add a new column with a default value, most DBs will need to update every row with that value. With billions of rows, that might take a while.
    The “ALTER TABLE” command requires a “LOCK” on each table as long as the migration operation is not finished. (Since the latest version of Postgres, this is no longer true for adding new fields with default, but still true for changing fields, as it updates the metadata.) This LOCK is exclusive and does not allow more writing on the relations being modified.
    If you have replicas and billions of rows - they will start lagging behind

### Removing a field

1. remove use from application
2. then deploy migration

### Changing a field with business logic attached

Changing a field intertwined with business logic is one of the most intricate migration scenarios. 

Dual-write migration means can be essentially split up into these steps:

    Add the new field to the database (Zero impact on the running code).
    Deploy new, refactored application code, where you start writing to both old and new fields, with the corresponding new business logic applied. Reading is still done from the old path. Writing to both fields must happen as part of a single Transaction.
    Compare the data and make sure it’s consistent.
    Write migration code that transforms the rest of the data from the old field into the new field in the correct format. (Or use gh-ost from Github)
    Deploy the migration and change the read path to the new field. The write path is still to both fields.
    Verify the application and the data consistency.
    Remove writing to the old field. At this point, reading/writing happens exclusively in the new field. The old field still exists in the database but should receive no writes.
    Verify the application and the data consistency.
    Remove any code related to the old field.
    Verify the application and the data consistency.
    Deploy migration script to drop the column from the database.
    Shake hands with your teammates.

[Online migrations at scale](https://stripe.com/blog/online-migrations)

4 step dual writing pattern that people often use to do large online migrations like this. Here’s how it works:

    Dual writing to the existing and new tables to keep them in sync.
    Changing all read paths in our codebase to read from the new table.
    Changing all write paths in our codebase to only write to the new table.
    Removing old data that relies on the outdated data model.

## Part 1: Dual writing

We begin the migration by creating a new database table. 

Start duplicating new information so that it’s written to both stores.

Backfill missing data to the new store so the two stores hold identical information.

## Part 2: Changing all read paths

Now that the old and new data stores are in sync, the next step is to begin using the new data store to read all our data.
