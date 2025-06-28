[Ruff users, what rules are using and what are you ignoring? : r/Python](https://www.reddit.com/r/Python/comments/1kttfst/ruff_users_what_rules_are_using_and_what_are_you/?share_id=NmsZRoF9QBytv9RE9NjpG&utm_name=androidcss)

```
[tool.ruff.lint]
extend-select = [
    "F",        # Pyflakes rules
    "W",        # PyCodeStyle warnings
    "E",        # PyCodeStyle errors
    "I",        # Sort imports properly
    "UP",       # Warn if certain things can changed due to newer Python versions
    "C4",       # Catch incorrect use of comprehensions, dict, list, etc
    "FA",       # Enforce from __future__ import annotations
    "ISC",      # Good use of string concatenation
    "ICN",      # Use common import conventions
    "RET",      # Good return practices
    "SIM",      # Common simplification rules
    "TID",      # Some good import practices
    "TC",       # Enforce importing certain types in a TYPE_CHECKING block
    "PTH",      # Use pathlib instead of os.path
    "TD",       # Be diligent with TODO comments
    "NPY",      # Some numpy-specific things
]
```

```
[lint]
select = ["ALL"]
preview = true
ignore = [
    "COM812",  # missing-trailing-comma
    "CPY001",  # Missing copyright notice at top of file
    "D100",    # Missing docstring in public module
    "D104",    # Missing docstring in public package
    "D203",    # blank line required before class docstring
    "D211",    # no-blank-line-before-class
    "D213",    # multi-line-summary-second-line
    "EM101",   # raw-string-in-exception
    "FIX002",  # line-contains-todo
    "ISC001",  # Conflicts with formatter ruff
    "PLR0904", # Too many public methods (... > 20)
    "TD002",   # Missing author in TODO `# TODO(<author_name>): ...`
    "TD003",   # missing-todo-link
    "TRY003",  # raise-vanilla-args
]
fixable = ["ALL"]
unfixable = [
    "D", # Dont fix docstyle from others
    "I", # we run isort separately
]
# Allow unused variables when underscore-prefixed.
dummy-variable-rgx = "^(_+|(_+[a-zA-Z0-9_]*[a-zA-Z0-9]+?))$"

[lint.pydocstyle]
convention = "google"

[lint.per-file-ignores]
"test_*.py" = [
    "S101",    # asserts allowed in tests...
    "ARG",     # Unused function args -> fixtures nevertheless are functionally relevant...
    "FBT",     # Don't care about booleans as positional arguments in tests, e.g. via @pytest.mark.parametrize()
    "PLR2004", # Magic value used in comparison, ...
    "S311",    # Standard pseudo-random generators are not suitable for cryptographic purposes
]
```

```
[tool.ruff]
indent-width = 4
line-length = 88
output-format = "grouped"
respect-gitignore = true
extend-exclude = [
    "doc/",
]
show-fixes = true

[tool.ruff.format]
indent-style = "space"
line-ending = "lf"
quote-style = "double"
docstring-code-format = true

[tool.ruff.lint]
select = ["ALL"]
ignore = [
    "YTT", # flake8-2020
    "CPY", # flake8-copyright
    "FA", # flake8-future-annotations
    "TD", # flake8-todos
    "C90", # mccabe
    "PGH", # pygrep-hooks

    # disable these rules to use the ruff formatter.
    "COM812", # missing-trailing-comma
    "COM819", # prohibited-trailing-comma
    "D206",   # docstring-tab-indentation
    "D300",   # triple-single-quotes
    "E111",   # indentation-with-invalid-multiple
    "E114",   # indentation-with-invalid-multiple-comment
    "E117",   # over-indented
    "E501",   # line-too-long
    "Q000",   # bad-quotes-inline-string
    "Q001",   # bad-quotes-multiline-string
    "Q002",   # bad-quotes-docstring
    "Q003",   # avoidable-escaped-quote
    "W191",   # tab-indentation
]
task-tags = ["TODO", "FIXME", "XXX", "HACK"]

[tool.ruff.lint.per-file-ignores]
# ignore unused imports in __init__.py files
"__init__.py" = ["F401"]
# Ignore missing type annotations in tests
"test_*.py" = ["ANN"]

[tool.ruff.lint.flake8-annotations]
# suppress ANN401 for *args and **kwargs
allow-star-arg-any = true

[tool.ruff.lint.pydocstyle]
# https://github.com/google/styleguide/blob/gh-pages/pyguide.md#38-comments-and-docstrings
convention = "google"
```
