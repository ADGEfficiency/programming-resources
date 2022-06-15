Working with mypy:

- mypy cares about `__init__.py` in submodules (like `feeds.utils` )- will complain otherwise,
- mypy by default won’t throw many errors, you need to turn them on in `mypy.ini`
- use `py.typed` to turn on typing at feeds package level,
- turn off the warnings for libraries such as `pandas` in the `mypy.ini`

---

Ignore a line:

```
ignore_line() # type: ignore
```

Ignore a func:

```python
import typing

@typing.no_type_check
def some_function():
    pass
```
