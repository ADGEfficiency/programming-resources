[Schema.org - Schema.org](https://schema.org/)

[What is Data Mart in Data Warehouse? Types & Example](https://www.guru99.com/data-mart-tutorial.html)

[Data vault modeling - Wikipedia](https://en.wikipedia.org/wiki/Data_vault_modeling)

[Data Modeling for Private Markets: A Field Guide | by Arcesium engineering blog | Arcesium Engineering | Dec, 2025 | Medium](https://medium.com/arcesium-engineering-blog/data-modeling-for-private-markets-a-field-guide-1ef1c7642abe)

Data modeling is a defensive exercise against entropy, not an optimization for elegance
- Every table and relationship is a potential point of breakage when business needs evolve
- A data platform is only as simple as its most complex part
- Complexity is harder to remove later than to prevent upfront

Everything changes, so build for schema degradation
- Field names, IDs, and entity definitions will all change over time
- Upstream systems will rename fields, redefine entities, merge or split identifiers
- Design so that upstream changes require adjusting a mapping or view, not rewriting pipelines

Your data model should match how you think about the business (bidirectionally)
- If a query requires inconsistent join paths depending on data type, that's an opportunity to simplify
- Sometimes the fix is adding a unifying concept (e.g., "Entity"); sometimes it's merging tables describing the same object from different angles
- Let the data model teach you about the business—a modeling convenience often hints at a business truth
- This echoes Conway's Law in reverse: your data structures shape organizational understanding

Handling ID chaos across systems: four approaches
- Live with duplicates: denormalize everywhere; results in inconsistent data when updates only hit some records
- Brute force unification: "XYZ Master" table with source_a_id, source_b_id columns; merging records requires updating all foreign keys across many tables
- Mapping tables: one table tracking equivalences; adds read complexity with extra joins on every query
- Stable references (recommended): master table allows structured duplication; each record has a canonical_id pointing to the authoritative record; when duplicates are discovered, only the master table is updated, leaving all foreign keys intact
- Commentary: stable references trade some duplication for loose coupling—the right trade for private markets with complex but low-volume data

Extension tables for type hierarchies (Security → Equity, Debt, Fund Interest)
- Single wide table: fast to start, but collapses under growing nulls when new types are added
- Separate tables per subtype: loses ability to query "all securities" without constant UNIONs; adding types requires updating many places
- Recursive subtypes ("extension of extension"): creates unmaintainable dependency chains
- Extension tables (recommended): one narrow base table for common fields; one table per subtype for specific fields; all subtypes join via the base table ID
- Keep base tables small: aim for 10 fields, accept 15, tolerate 20, worry at 25—beyond 25, comprehension degrades significantly

Normalization vs. denormalization is about workflow, not correctness
- Private markets datasets are small enough that join performance is rarely the issue; maintainability is
- If analysts need documentation to query it, it's too normalized
- If you're reconciling duplicate fields, it's too denormalized
- 80% of queries should be one-hop joins (all joined datasets connect directly to the core dataset)
- Extension tables count as conceptually one-hop despite the extra physical join, as users understand them as representing the same concept
- Normalize when multiple datasets need the same concept or the property changes over time; keep inline otherwise; expose via views if needed elsewhere later

Domain models and loose coupling
- Standardize datasets into transactional (positions, valuations, cash flows) and reference (companies, securities, investors)
- Standard query shape: source → transactional → reference (or variations)
- Favor relation fields over hard joins: instead of "company.security_id joins to security.id", use "company.security_id represents a security"—this survives schema changes
- Use tagging notation like `relation:security` so automation can infer joins
- Litmus test: you should be able to add a new table knowing only which relations matter, not any existing table or column names
- Wrap everything in a logical alias layer (views, named references) to insulate reports from physical schema changes
- Commentary: this parallels interface-based programming—depend on abstractions, not concretions

Time series data handling: three patterns
- Date ranges (start + end): compact but fragile with off-by-one errors, overlapping periods, and slow inequality joins
- Start-only ranges: append new records with start time; later starts supersede earlier ones; avoids overlap bugs but requires inferring end dates at read time
- Point-in-time records (recommended): one record per object per date; highest storage cost and requires forward-filling gaps, but simplest and most robust querying
- For high-volume scenarios: hybrid approach—write as start-only, add a fixer pipeline to backfill end dates for lookup convenience while keeping start fields authoritative
- Commentary: this is the classic space-time tradeoff; for small datasets with complex joins, always trade storage for query simplicity

Overall principles
- Model around how the team thinks, but let modeling inform that thinking
- Design for change, not perfection
- Keep joins shallow, references stable
- Separate physical storage from logical models, but keep the separation thin
- Commentary: these principles apply beyond private markets—any domain with high schema churn and moderate data volumes benefits from this defensive posture

[Data Modeling Guide for Real-Time Analytics with ClickHouse | ssp.sh](https://www.ssp.sh/blog/practical-data-modeling-clickhouse/)

Data modeling is primarily a business conversation, not a technical one
- "shifting left" — structuring data well at the source reduces expensive downstream transformations
- real-time analytics is a freshness vs. accuracy tradeoff; pulling latest data risks inconsistency across related tables

Denormalization (One Big Table approach) moves joins from query time to insert time
- good for infrequently changing dimensions
- bad for high-cardinality or many-to-many relationships
- similar to the "OBT" pattern popularized in dbt circles

Incremental Materialized Views shift aggregation cost to insert time
- best for single-table aggregations or simple enrichments
- not ideal for complex multi-table joins

Refreshable Materialized Views handle complex joins on a schedule
- similar to traditional OLTP materialized views
- can integrate with dbt, Airflow, etc.
- breaks real-time freshness guarantees — batch ETL undermines streaming pipelines

MergeTree engine acts as a self-managing local ETL layer
- background merges maintain query performance without manual intervention
- partition_overwrite incremental strategy reprocesses only changed partitions, not full dataset

ClickHouse's S3 native function allows transformation during ingestion (no separate ETL tool)
- demonstrated with NOAA weather data: type conversion, null handling, derived fields all in SQL at load time
- TTL settings can automate data lifecycle/deletion

Deduplication options: ReplacingMergeTree (row-level during merges), insert_deduplicate block hashing, or application-level
- ReplacingMergeTree deduplicates during background merges, not immediately — query with FINAL modifier to force full merge before returning results
- FINAL has a performance cost

Partitioning strategy critically affects query pruning and parallel processing
- time-based (daily/monthly) is standard for time-series
- secondary partitioning on high-cardinality dimensions (e.g. region) adds further pruning
- partitions should match most common query patterns

Table Projections provide multiple sort orders / pre-aggregations on a single table
- query optimizer picks the projection with least data to scan automatically
- alternative to maintaining separate OLAP cubes for different access patterns
- analogous to covering indexes in OLTP, but more powerful

Data sketches (HLL, quantiles) trade exactness for dramatic efficiency gains
- ~99%+ accuracy at 1% of cost/storage
- uniqHLL12 uses ~1.5KB vs 8GB+ for exact distinct counts on 1B+ rows
- appropriate for most analytical workloads; inappropriate where exact counts are contractually required

Sampling strategies (random, time-based, stratified) can reduce data 90-99%
- consistent hash functions ensure reproducible samples
- stratified sampling preserves proportional representation across business dimensions

Store timestamps in UTC; keep original timezone as separate column
- mixed timezones cause incorrect aggregations across regions

The more you pre-aggregate, the faster queries are but the less flexible ad-hoc analysis becomes — classic OLAP cube tension that modern systems haven't fully resolved

[Your data model is your destiny - Matt Brown's Notes](https://notes.mtb.xyz/p/your-data-model-is-your-destiny)

Start with workflow, not technical implementation

Ask “what’s the atomic unit of work in this domain?”

The path to a differentiated data model depends on your market. The more horizontal you go, the more your moat comes from technical and interface innovation. The more vertical you go, the more your moat comes from elevating the right domain objects with the right attributes.

Horizontal tools serve broad use cases where underlying concepts are already familiar. Leverage comes from changing how the product is built or experienced. Notion reimagined documents as composable blocks. Figma rebuilt the foundation entirely as a multiplayer web canvas.

Vertical tools serve specific industries with deep domain complexity. Leverage comes from what you choose to emphasize. Toast elevated menu items—not transactions—with prep times and kitchen routing as first-class data. Klaviyo promoted order data to equal status alongside email metrics.

[Your data model is your destiny | Hacker News](https://news.ycombinator.com/item?id=45583786)

It's one of the core ideas of Domain-Driven Design. In the early stage of the process, engineers should work closely with stakeholders to align on the set of terms (primitives as another commenter has put it), define them and put them in neat little contextual boxes.

DDD suggests continuous two-way integration between domain experts <-> engineers, to create a model that makes sense for both groups. Terminology enters the language from both groups so that everyone can speak to each other with more precision, leading to the benefits you stated.

[Common data model mistakes made by startups | Metabase Learn](https://www.metabase.com/learn/grow-your-data-skills/analytics/data-model-mistakes)

Make it easy to get business metrics

Soft deletes
- remove performance hits of deletes/vacuuming
- can undelete
- require every read query to exclude deleted records
- place where users can make mistakes
