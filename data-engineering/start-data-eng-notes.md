[Data Pipeline Design Patterns - #1. Data flow patterns · Start Data Engineering](https://www.startdataengineering.com/post/design-patterns/)

Replayable source.

Use `run_id` with full snapshots if you need to keep historical data.

Self healing pipeline = next pipeline run will catch up.

Staging tables
- stage / intermediate / marts (DBT)
- medallion (Databricks)
