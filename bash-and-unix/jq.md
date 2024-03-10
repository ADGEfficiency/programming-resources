'.key[0].key'

https://cuddly-octo-palm-tree.com/posts/2021-09-26-tyska-jq/

jq can also be used to create brand new JSON values. The advantage here is that it will automatically "JSON-escape" given values from the command-line. For example:

```
$ jq -n --arg argName 'this has a " in it!' '{"title": $argName}'
{
  "title": "this has a \" in it!"
}
```

---

[The BEST CLI Tool](https://youtu.be/n8sOmEe2SDg?si=UZN9QNHTgT6Fs0e-)

[Cookbook · jqlang/jq Wiki](https://github.com/jqlang/jq/wiki/Cookbook)

[Tools You Should Know About: jq](https://cuddly-octo-palm-tree.com/posts/2021-09-26-tyska-jq/)
