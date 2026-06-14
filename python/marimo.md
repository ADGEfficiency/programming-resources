---
id: marimo
aliases: []
tags: []
---

[Reinventing notebooks as reusable Python programs | marimo](https://marimo.io/blog/python-not-json)

Header. The notebook file starts with a header that imports marimo, notes the version of marimo that created the file, and instantiates an App object to which cells are added.

Cells. Cells are stored in notebook presentation order. Each cell is serialized as a function that accepts its variable references and return its definitions; cells are added to the notebook via the app.cell decorator. Users can optionally name their cells, which become the names of the decorated functions.

This serialization strategy departs from Jupytext-style (or Databricks-style) flat scripts, which demarcate cells with comments instead of wrapping them in functions. Importing Jupytext or Databricks notebook files runs all their cells, which is expensive and almost never what you want. In contrast, in our file format, cells are not executed on import because they are wrapped in functions.

## testing

Testing cells. Any cell named as test_* is automatically discoverable and testable by pytest. The same goes for any cell that contains only test_ functions and Test classes.

Importantly, because cells are wrapped in functions, running pytest test_notebook.py doesn’t execute the entire notebook — just its tests.

## setup

```python
import marimo

__generated_with = "0.11.17"
app = marimo.App()

with app.setup:
  import numpy as np
```

[meps/mep-0001.md at main · marimo-team/meps](https://github.com/marimo-team/meps/blob/main/mep-0001.md)

## thoughts on structure

https://claude.ai/public/artifacts/c3ef7af9-4c19-4684-b332-cb15fdee547c

```python
# --- assembly cell (can sit anywhere; runs last by dataflow) ---
mo.ui.tabs({
    "Overview": tab_overview,
    "Explorer": tab_explorer,
    "Settings": tab_settings,
})

# --- tab 1: built in its own cell ---
tab_overview = mo.vstack([
    mo.md("## Overview"),
    mo.hstack([stat_card_a, stat_card_b], justify="start"),
    overview_chart,
])

# --- tab 2, tab 3: each in their own cell(s) the same way ---
```

Anything interacitev = must be across multiple cells (ie the tab_overview):
- You can't define a UI element and read its .value in the same cell

By default tab contents render eagerly — all three tabs are computed up front even though only one is visible. If a tab holds something expensive (a big plot, a heavy query), wrap it so it only computes when viewed:

```python
tab_settings = mo.lazy(build_settings)   # build_settings is a zero-arg function
```
