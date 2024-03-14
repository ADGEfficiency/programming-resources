# poetry

Make poetry project without a directory structure

```
$ poetry init
```

Or make with opinionated directory:
```
$ poetry new climate-news-db
```

Then add packages interactively after `poetry new` (never again).

You can add packages later on with:

```shell-session
$ poetry add mypy
$ poetry add ipython --group develop
```

Turn off Poetry using it's own venv:

```
$ poetry config virtualenvs.create false --local
```

poetry.toml versus pyproject.toml versus poetry.lock file

https://python-poetry.org/docs/dependency-specification/

https://stackoverflow.com/questions/53835198/integrating-python-poetry-with-docker

[How to create a Python package in 2022](https://mathspp.com/blog/how-to-create-a-python-package-in-2022)

Poetry, pre-commit.
