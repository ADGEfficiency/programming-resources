---
id: oral-history-bank-python
aliases: []
tags:
  - python
  - software-development
---

[An oral history of Bank Python](https://calpaterson.com/bank-python.html)

Minerva = entire system

Barbara = Global database of Python objects

Based on rings (you connect to a/multiple rings)

```
import barbara
db = barbara.open()
guilt = db['/Instruments/AAAA']
current_value = guilt.value()
```


[An oral history of Bank Python (2021) | Hacker News](https://news.ycombinator.com/item?id=48678645)

You tend to see old but performant and battle tested systems get retired in favor of shiny, new systems with lots of bugs. Why? It looks better on a resume to say "I retired old, crufty legacy system and rolled out a new system" instead of "I refactored old system to be better"

Dagger = keeps data dependencies straight

Position = instrument + how many of it

Book = set of positions

Books can contain other books

Walpole = general purpose job runner
- jenkins + systemd
- restarts, alerting, logs, depenedencies, etc.

In order to deploy your app outside of Minerva you now need to know something about k8s, or Cloud Formation, or Terraform. This is a skillset so distinct from that of a normal programmer (let alone a financial modeller) that there is no overlap. Conversely, anyone can work out an ini-file.

skipped over things like:

    the proprietary timeseries data-structure
    the "vouch" system for getting your changes into prod
    time travel in Dagger
    the semi-bespoke (non-git) version control system
    the Prolog-based permission system
    replay-oriented financial message buses
    existential ennui arising from prolonged exposure to Windows 7 and MS Outlook 2010
