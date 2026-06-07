---
id: production-engineering-jane-street
aliases: []
tags:
  - devops
  - trading
---

[Production Engineering When Trading Billions of Dollars a Day - YouTube](https://www.youtube.com/watch?v=zR9PpXWsKFQ)

Order
- side
- quantity/volume
- instrument symbol ticker
- price
- currency

Possible to make mistakes like swapping price for quantity

Mistake 
- reusing a config flag to avoid a version upgrade

Trading = unique 
- competitors will pounce on mistakes (selling too cheap, buying too expensive etc)

Market open & close times drive traffic (number of orders)

- External services send data, which happens before market open
- If problem, need to scramble to fix before open

Event based monitoring & alerting mostly

- if this condition happens, raise error for human to look at
- have to think through edge cases
