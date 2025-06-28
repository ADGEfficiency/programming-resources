[How we built ngrok's data platform - ngrok](https://ngrok.com/blog-post/how-we-built-ngroks-data-platform)

[A battle-tested analytics stack for teams who need speed, clarity, and control](https://www.datagibberish.com/p/analytics-stack-for-speed-clarity-control)

Extraction: Isolate from everything else. Make it pluggable.

Loading: Store raw. Don’t transform early.

Transformation: Centralised, versioned, testable.

Orchestration: Flexible, decoupled from infrastructure.

Storage: Scalable and replaceable without panic.

BI: Accessible and trustable, especially by non-technical users.

## Transforms

Transformations to be transparent. Versioned in Git. Easy to test. Easy to roll back. If someone new joins, they should be able to follow the logic without asking ten questions.

dbt helps the team grow without the logic falling apart. It sets a standard right away: tests live next to the models, docs get generated automatically, models build on each other in a clear way.

It works well with most warehouses. Works locally. Works in CI. And most importantly, it forces some discipline.

[DAG DBT structure Intermediate vs Marts](https://www.reddit.com/r/dataengineering/comments/1k5w1hx/dag_dbt_structure_intermediate_vs_marts/?share_id=PbC-Ex77qTnOc7cVcEfg0&utm_name=androidcss)

I use marts for anything complex (joins of other tables, the end state after some intermediates, business process specific combinations of data, etc) that end users will most likely draw on in a singular fashion. Things like reports, dashboard or any of the exposure options.

Intermediates are like you said, a great place to put complex models chunked up for readability or performance reasons.

Stage is simple models (they can even contain a join or two), they certainly might be used by end users all the time and in dashboards but that doesn’t make them mart worthy in my opinion. They’re simple building blocks that can also be useful on their own

My experience is that dbt is an odd duck in that there is a ton of flexibility and overall has more recommendations than rules. The most important thing to do is be consistent within and across projects for your organization.
