
# how data visualized = Encodings & Marks

`.mark_*` - all marks - https://altair-viz.github.io/user_guide/marks.html

```
import altair as alt

chart = alt.Chart(data).mark_point
```

# how data separated = Encoding Channels (aka Channels)

channels - https://altair-viz.github.io/user_guide/encoding.html

```
.encode(
  x='column-name'
)
```

encode builds a key-value mapping between encoding channels (x, y, color etc) and dataframe columns

mappings depend on data types (dataframe columns) - there are 5 data types - these are often inferred:

- quantitative Q - a continuous real-valued quantity
- ordinal O - a discrete ordered quantity
- nominal N - a discrete unordered category
- temporal T - a time or date value
- geojson G -  a geographic shape

you can specify type
```
alt.X('Acceleration', type='quantitative')
```

enocding channel options
- aggregate
- timeUnit
- scale
- sort
- stack
- 


## visual concatenation

make one chart and encode it many times .... wow

```
base = alt.Chart(cars).mark_point().encode(
    x='Horsepower:Q',
    y='Miles_per_Gallon:Q',
).properties(
    width=150,
    height=150
)

alt.vconcat(
   base.encode(color='Cylinders:Q').properties(title='quantitative'),
   base.encode(color='Cylinders:O').properties(title='ordinal'),
   base.encode(color='Cylinders:N').properties(title='nominal'),
)
```



## binning and aggregation
```
x=alt.X('col', bin=True)
y='count()'
```

[RnR]


# Interactivitiy - https://altair-viz.github.io/user_guide/interactions.html
