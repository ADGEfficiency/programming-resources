[Changing Tires at 100mph: A Guide to Zero Downtime Migrations | Kiran Rao](https://kiranrao.ca/2022/05/04/zero-downtime-migrations.html)

    Create the new empty table
    Write to both old and new table
    Copy data (in chunks) from old to new
    Validate consistency
    Switch reads to new table
    Stop writes to the old table
    Cleanup old table
