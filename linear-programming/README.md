Use Gurobi if you can

[MS&E 111/ENGR 62. Introduction to Optimization](https://web.stanford.edu/~ashishg/msande111/)

[cvxgrp/cvxpylayers: Differentiable convex optimization layers](https://github.com/cvxgrp/cvxpylayers)

[A Comprehensive Guide to Modeling Techniques in Mixed-Integer Linear Programming](https://towardsdatascience.com/a-comprehensive-guide-to-modeling-techniques-in-mixed-integer-linear-programming-3e96cc1bc03d#5120)

[Last fifty years of integer linear programming: Recent practical advances (2024) | Hacker News](https://news.ycombinator.com/item?id=44274567)

I think a big part is that the OSS solvers are somewhat hamstrung by the combination of several issues: (1) the barrier to entry in SoTA optimizer development is very high, meaning that there are very few researchers/developers capable of usefully contributing both the mathematical and programming needed in the first place, (2) if you are capable of (1), the career paths that make lots money lead you away from OSS contribution, and (3) the nature of OSS projects means that "customers" are unlikely to contribute back to kind of examples, performance data, and/or profiling that is really needed to improve the solvers.

---

It's substantially harder than linear programming: it's equivalent to SAT, whereas linear programming is merely polynomial-time (and in practice weakly polynomial-time with current algorithms).
