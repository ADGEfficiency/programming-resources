# Pandas

If you need to iteratively add rows, it's better to maintain a Python list/dict and only convert to a dataframe in the end. It's definitely 20-30 times faster!

`.loc` for labels
`.iloc` for positions

Explicitly designate both rows and columns (even if its just with a `:`)

Marc Garcia - Towards Pandas 1.0 - [youtube](https://www.youtube.com/watch?v=hK6o_TDXXN8)

Jeff Reback - What is the Future of Pandas (2017) - [youtube](https://www.youtube.com/watch?v=_-gJtO0XR48)

[Modern Pandas (Part 1) - datas-frame](https://tomaugspurger.github.io/modern-1-intro.html)

[Thinking like a Panda: Everything you need to know to use pandas the right way. - Hannah Stepanek - Pycon 2019](https://www.youtube.com/watch?v=ObUcgEO4N8w)

Index = columns in the underlying code

Levels = names of the indicies in multi index

Labels = integers that refer to labels -> Multi indexing reduces memory usage

inplace=True = avoids duplication

Outer merge = avoids duplication of data in common

Try not to use apply (like a map)


