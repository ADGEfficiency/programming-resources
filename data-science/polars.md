#  Is Polars the Pandas Killer?

## Pandas versus Polars

## Selecting rows and columns

row


# Assign columns

```python
df.with_columns([
    (pl.col("value") * 10).alias("tenXValue"),
    (pl.col("value") * 100).alias("hundredXValue"),
])
```

## Group by


```
    regions = ds.groupby("region").agg([pl.mean("npv")])
```

Use of `pl.mean(col)` versus `pl.col(col).mean()`


## Group by with conditional

```python
import polars as pl

from .dataset import dataset

q = (
    dataset.lazy()
    .groupby("state")
    .agg(
        [
            (pl.col("party") == "Anti-Administration").sum().alias("anti"),
            (pl.col("party") == "Pro-Administration").sum().alias("pro"),
        ]
    )
    .sort("pro", reverse=True)
    .limit(5)
)

df = q.collect()
```


## First time I enjoy polars

    """
    #  naive
    data = data.with_column(pl.datetime(year=2020, month=1, day=1).alias("datetime"))

    query = data.lazy().with_columns(
        [
            pl.col("start_date").str.strptime(pl.Date, "%d/%m/%Y"),
            pl.col("end_date").str.strptime(pl.Date, "%d/%m/%Y"),
        ]
    )
    query.collect()
    """

    #  no concept of timezone in `pl.datetime` - but there is in `pl.Datetime`
    query = data.lazy().with_columns(
        [
            pl.datetime(
                year=pl.col("start_date").str.strptime(pl.Date, "%d/%m/%Y").dt.year(),
                month=pl.col("start_date").str.strptime(pl.Date, "%d/%m/%Y").dt.month(),
                day=pl.col("start_date").str.strptime(pl.Date, "%d/%m/%Y").dt.day(),
                hour=pl.col("hour"),
                minute=pl.col("minute"),
            ).alias("datetime"),
        ]
    )
    data = query.collect()
    print(data[["start_date", "hour", "minute", "datetime"]].sample(4))

###

df.to_numpy
df.to_list

## Masking / Replacing Values 

```
    interval_data = interval_data.with_column(
        pl.when(
            pl.col('charge_energy_kw') > top,
        ).then(
            None
        ).otherwise(
            pl.col('charge_energy_kw')
        ).alias(
            'charge_energy_kw'
        )
    )
```

## Lazy read multiple files

```

    queries = []
    for file in glob.glob("~/nem-data/data/unit-scada/2019-01/clean.parquet")
        q = pl.scan_csv(file).groupby("bar").agg([pl.count(), pl.sum("foo")])
        queries.append(q)

    dataframes = pl.collect_all(queries)
```

---

[Extending the API — Polars documentation](https://docs.pola.rs/py-polars/html/reference/api.html)

```python
@pl.api.register_expr_namespace("greetings")
class Greetings:
    def __init__(self, expr: pl.Expr):
        self._expr = expr

    def hello(self) -> pl.Expr:
        return (pl.lit("Hello ") + self._expr).alias("hi there")

    def goodbye(self) -> pl.Expr:
        return (pl.lit("Sayōnara ") + self._expr).alias("bye")


pl.DataFrame(data=["world", "world!", "world!!"]).select(
    [
        pl.all().greetings.hello(),
        pl.all().greetings.goodbye(),
    ]
)
```

[Calmcode - polars: Introduction](https://calmcode.io/course/polars/introduction)

[Modern Polars](https://kevinheavey.github.io/modern-polars/)
