---
id: medallion-dtyped
aliases: []
tags:
  - data-engineering
  - data-modelling
  - databricks
  - cloud
---

Pattern, not architecture

Lakehouse fuses lake openness (Parquet) with warehouse management (ACID, schema enforcement) via open table formats like Delta Lake, Hudi, Iceberg

Names don't matter:
- Bronze/Silver/Gold are just shorthand
- "Raw/Refined/Curated" or domain-specific names work equally well

Medallion is "multi-hop" reborn for diverse data
- Multi-hop (staging→integration→DWH→presentation, or raw→processed→curated) has existed for decades

Bronze = landing
- raw
- Capture full history, allow schema evolution, ensure resilient ingestion

Silver = cleaned & standardized
- Cleans errors, enforces datatypes/ranges, masks PII, deduplicates, builds timelines
- Performance optimizations: Z-ordering, partitioning, liquid clustering
- Goal: queryable, consistent, trustworthy — but not yet over-integrated across domains

Gold layer: curated for business consumption
- Where data models live: Kimball star schema, Codd 3NF, or One Big Table (OBT) trading flexibility for speed
- "Pinnacle of refinement" (per Strengholt) — directly optimized for BI/dashboards/ML
- Applies KPIs, business rules, derived metrics (margins, churn, growth rates)
- Where reusable data products emerge to reduce duplication across teams
- Often produces multiple curated outputs per audience (finance, marketing, ops)

Medallion is orthogonal to Data Mesh
- can have layers inside a data product

[The Medallion Architecture - Data Lakehouse - Dtyped](https://dtyped.com/demystifying-the-medallion-architecture/)

The Medallion Architecture is a design pattern, not an architecture
- Coined by Databricks in 2019 alongside Delta Lake as part of its Lakehouse vision
- Organizes data into progressive quality layers (commonly Bronze, Silver, Gold)
- Author argues it's a reference pattern for organizing data assets, not a true architecture
- Not cloud-specific, not a data model (models live in Gold)
- No single "right" way to implement it

Context: evolution from warehouses to lakes to lakehouses
- Data warehouses: reliable and governed but proprietary, SQL-only, poor for ML
- Data lakes: cheap, flexible, open formats but lacked transactions/schema/governance, often became "swamps"
- Running both together created costly two-system duplication with ETL between them
- Lakehouse fuses lake openness (Parquet) with warehouse management (ACID, schema enforcement) via open table formats like Delta Lake, Hudi, Iceberg
- Medallion is the day-to-day operating blueprint for a lakehouse, especially on Databricks

Misconception: the layer names matter
- Bronze/Silver/Gold are just shorthand
- "Raw/Refined/Curated" or domain-specific names work equally well
- Consistency across the org matters more than the metallic naming
- You can add layers (e.g., Platinum)

Misconception: it's a data architecture
- It's a high-level concept for progressive refinement toward business value
- Not tied to cloud, not a data model
- Flexible: polish in Bronze, add business logic in Silver, etc. — all acceptable

Medallion is "multi-hop" reborn for diverse data
- Multi-hop (staging→integration→DWH→presentation, or raw→processed→curated) has existed for decades
- Critics call Medallion "old wine in new bottles" and the author partly agrees
- Key difference: traditional multi-hop only handled structured tabular data; unstructured data ended up in blob columns or separate silos
- Lakehouse + Medallion treats structured, semi-structured, and unstructured (JSON, IoT, PDFs, audio, video) as first-class citizens through the same pipeline
- Enables BI, ML, real-time, and GenAI on the same layered data

Bronze layer: the landing zone
- Purpose: preserve raw data as a faithful single source of truth
- Capture full history, allow schema evolution, ensure resilient ingestion
- Databricks tooling: Delta Lake tables, Auto Loader, Structured Streaming
- Author's preference: often write Bronze directly as Delta, but always keep a copy of source data in original format (cloud storage is cheap)

Silver layer: cleaned and standardized
- Cleans errors, enforces datatypes/ranges, masks PII, deduplicates, builds timelines
- Performance optimizations: Z-ordering, partitioning, liquid clustering
- Starts emphasizing common denominators to prepare for Gold
- Goal: queryable, consistent, trustworthy — but not yet over-integrated across domains
- Exception: with Data Vault (Linstedt), Raw Vault often sits in Silver and Business Vault in Gold

Gold layer: curated for business consumption
- "Pinnacle of refinement" (per Strengholt) — directly optimized for BI/dashboards/ML
- Where data models live: Kimball star schema, Codd 3NF, or One Big Table (OBT) trading flexibility for speed
- Applies KPIs, business rules, derived metrics (margins, churn, growth rates)
- Where reusable data products emerge to reduce duplication across teams
- Often produces multiple curated outputs per audience (finance, marketing, ops)

Common denominators bridge structured and unstructured data
- The author claims most Medallion articles ignore this, but it's the whole point in the lakehouse era
- Structured data has built-in keys; text/IoT data does not
- "Universal connectors" — concepts that exist regardless of format — let you join across types
- Time: timestamps align JSON logs, DB extracts, video chronologically
- Location: GPS/city links customer records to sensor or social data
- Identifier: customer ID, product number, doc ID anchor unstructured sources to CRM
- Events: purchases, check-ins, sensor readings provide a narrative thread
- Monetary values: link financial transactions to PDFs/invoices/receipts

My commentary
- The article is essentially a Databricks-friendly explainer written by a Databricks consultancy (Dtyped), so it leans toward Delta Lake framing — Iceberg and Hudi get one mention and then disappear, even though the same pattern works on either
- The "old wine in new bottles" defense is the weakest section: handling unstructured data in layered pipelines isn't unique to Delta Lake, it's a property of any lakehouse table format on object storage
- Worth linking mentally to Data Mesh — Medallion is orthogonal to it; you can layer Bronze/Silver/Gold inside each domain's data product, and the article hints at this with "data products" in Gold but doesn't develop it
- The "common denominators" section is the most interesting and least commonly discussed part — it's essentially entity resolution / conformed dimensions repackaged for unstructured data, and connects to ideas like Kimball's conformed dimensions and modern entity resolution tooling
- Missing: any discussion of cost, of when Medallion is overkill (small orgs with one source rarely need three layers), or of the operational pain of keeping three copies of data in sync
- Missing: governance/lineage tooling (Unity Catalog would be the obvious Databricks plug here and it's oddly absent)
- The Data Vault aside is interesting but underdeveloped — placing Raw Vault in Silver and Business Vault in Gold is a real pattern but has tradeoffs the article doesn't explore
