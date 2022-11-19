[Shell Script Best Practices](https://sharats.me/posts/shell-script-best-practices/) - [HN Discussion](https://news.ycombinator.com/item?id=33354286)


set -o pipefail

- pipeline command is treated as failed, even if one command in the pipeline fails.

set -o errexit

- exit when one command fail, rather than continuing on

Template

```
#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./script.sh arg-one arg-two

This is an awesome bash script to make your life better.

'
    exit
fi

cd "$(dirname "$0")"

main() {
    echo do awesome stuff
}

main "$@"
```
