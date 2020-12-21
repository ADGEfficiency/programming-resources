# sed

[sed - An Introduction and Tutorial by Bruce Barnett](https://www.grymoire.com/Unix/Sed.html)

[sed, a stream editor - GNU.org](https://www.gnu.org/software/sed/manual/html_node/index.html#SEC_Contents)

## Print a line

Print second line:

```bash
$ sed -n '2p' file.data
```


Replace in Python files:
```bash
$ sed -i '' "s/climatedb.newspapers.utils/climatedb.utils/" newspapers/*.py
```
