## Assign columns

```python
df.with_columns([
    (pl.col("value") * 10).alias("tenXValue"),
    (pl.col("value") * 100).alias("hundredXValue"),
])
```


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
