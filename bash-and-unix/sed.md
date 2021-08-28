# sed

[sed - An Introduction and Tutorial by Bruce Barnett](https://www.grymoire.com/Unix/Sed.html)

[sed, a stream editor - GNU.org](https://www.gnu.org/software/sed/manual/html_node/index.html#SEC_Contents)

```
:s/pattern/replacement/flags
```

What does this mean?
    The pattern is the search you want to match.
    The replacement will replace the first match of the pattern on each line.
    The flag modify the behavior of the command.


## Print a line

Print second line:

```bash
$ sed -n '2p' file.data
```

Print matching lines:

```bash
$ sed -n '/parsing\ error/p' data/logger.log
```

Replace in Python files (need the extra `""` at the front on MacOS):

```bash
$ sed -i "" "s/climatedb.newspapers.utils/climatedb.utils/" newspapers/*.py
```

Remove:
```bash
$ sed -i "s/pattern//g"
```

Replace:

```bash
sed -i "" "s/from config import S3_BUCKET, S3_PREFIX/from emd.config import default_config/" *.py
```
