# poetry

Make poetry project without a directory structure

```
$ poetry init
```

Or make with opinionated directory:
```
$ poetry new climate-news-db
```

Then add packages interactively.

You can add packages later on with:

```shell-session
$ poetry add mypy
```

Turn off Poetry using it's own venv:

```
$ poetry config virtualenvs.create false --local
```

poetry.toml versus pyproject.toml versus poetry.lock file

https://python-poetry.org/docs/dependency-specification/

https://stackoverflow.com/questions/53835198/integrating-python-poetry-with-docker

Development dependecies:

```
$ poetry add pkg -D
$ poetry install --no-dev
```

