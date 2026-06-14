Use Gurobi if you can

[MS&E 111/ENGR 62. Introduction to Optimization](https://web.stanford.edu/~ashishg/msande111/)

[cvxgrp/cvxpylayers: Differentiable convex optimization layers](https://github.com/cvxgrp/cvxpylayers)

[A Comprehensive Guide to Modeling Techniques in Mixed-Integer Linear Programming](https://towardsdatascience.com/a-comprehensive-guide-to-modeling-techniques-in-mixed-integer-linear-programming-3e96cc1bc03d#5120)

[Last fifty years of integer linear programming: Recent practical advances (2024) | Hacker News](https://news.ycombinator.com/item?id=44274567)

I think a big part is that the OSS solvers are somewhat hamstrung by the combination of several issues: (1) the barrier to entry in SoTA optimizer development is very high, meaning that there are very few researchers/developers capable of usefully contributing both the mathematical and programming needed in the first place, (2) if you are capable of (1), the career paths that make lots money lead you away from OSS contribution, and (3) the nature of OSS projects means that "customers" are unlikely to contribute back to kind of examples, performance data, and/or profiling that is really needed to improve the solvers.

---

It's substantially harder than linear programming: it's equivalent to SAT, whereas linear programming is merely polynomial-time (and in practice weakly polynomial-time with current algorithms).

[Solving Mixed Integer Programs Using Neural Networks 2012.13349v3.pdf](https://arxiv.org/pdf/2012.13349)

Mixed Integer Programs (MIPs) are a class of NP-hard problems where the goal is to minimize a linear objective subject to linear constraints, with some or all of the variables constrained to be integer-valued

These solvers use sophisticated heuristics to direct the search process for solving a MIP. A solver’s performance on a given application depends crucially on how well its heuristics suit that application

Our approach applies learning to the two key sub-tasks of a MIP solver:

a) output an assignment of values to all variables that satisfy the constraints (if such an assignment exists),
b) prove a bound for the gap in objective value between that assignment and an optimal one.

"learning to optimize" / "amortized optimization" bet — pay a large upfront training cost to make per-instance solving cheaper. It only makes economic sense for repeated, structurally-similar workloads, which is exactly the two Google production use cases they target
