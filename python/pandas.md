# Pandas

If you need to iteratively add rows, it's better to maintain a Python list/dict and only convert to a dataframe in the end. It's definitely 20-30 times faster!

`.loc` for labels
`.iloc` for positions

Explicitly designate both rows and columns (even if its just with a `:`)

[Offset aliases](https://pandas.pydata.org/docs/user_guide/timeseries.html#timeseries-offset-aliases)

[pandas and friends - Marc Garcia](https://youtu.be/PQPv_4rOWe4)

What is SQL not good at:
- interactive
- data not in a database (CSV etc)
- managing complexity
- unstructured or schemaless data
- complex / nested data structures
- specalized functionality (custom filling of missing values etc)

Marc Garcia - Towards Pandas 1.0 - [youtube](https://www.youtube.com/watch?v=hK6o_TDXXN8)

Jeff Reback - What is the Future of Pandas (2017) - [youtube](https://www.youtube.com/watch?v=_-gJtO0XR48)

[Ian Ozsvald - Making Pandas Fly | PyData Fest Amsterdam 2020](https://youtu.be/N4pj3CS857c)

`df.memory_usage(deep=True)`

Saving RAM

- categories data type (rather than strings)
- smaller dtypes (float32 vs 64)

Speed

- do stuff (like `.sum`) in numpy

[Modern Pandas (Part 1) - datas-frame](https://tomaugspurger.github.io/modern-1-intro.html)

[Thinking like a Panda: Everything you need to know to use pandas the right way. - Hannah Stepanek - Pycon 2019](https://www.youtube.com/watch?v=ObUcgEO4N8w)

Index = columns in the underlying code

Levels = names of the indicies in multi index

Labels = integers that refer to labels -> Multi indexing reduces memory usage

inplace=True = avoids duplication

Outer merge = avoids duplication of data in common

Try not to use apply (like a map)


