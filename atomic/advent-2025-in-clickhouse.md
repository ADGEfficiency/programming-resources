---
id: advent-2025-in-clickhouse
aliases: []
tags:
  - sql
  - advent-of-code
---

[Solving the "Impossible" in ClickHouse: Advent of Code 2025 | ClickHouse](https://clickhouse.com/blog/clickhouse-advent-of-code-2025)

sum(x) OVER (ORDER BY id) turns a simulation whose state is a running total into a single vectorised pass (Day 1's dial position)
- Works only when state is associative and history-independent; the moment state depends on a branch, they fall back to arrayFold
- Related: this is the classic "gaps and islands" toolkit applied to simulation rather than to reporting

---

https://claude.ai/chat/9bb46b4b-9b80-4293-9e20-6712d8acb50a

## Key SQL Techniques

arrayFold as a general-purpose reduce with a tuple accumulator
- The workhorse of the whole post: Days 3, 7 and 8 all encode a state machine as (field1, field2, ...) carried through a fold
- Day 3 carries (digits_remaining, current_position, accumulated_value) to run a greedy digit selection
- Day 7 carries (left_boundary, right_boundary, worlds_map, counter) to run a row-by-row wave propagation
- Day 8 carries an Array(Array(point)) to do union-find by merging component lists
- Commentary: this is where the "abused bent" joke earns itself — Day 3 recomputes arrayMax over the same slice three separate times inside one fold step because there is no let-binding inside a lambda, so the code is roughly 3x more work than needed and unreadable
- Alternative worth considering: many of these folds could be expressed as recursive CTEs instead, which would at least allow naming intermediates per step

Recursive CTEs for fixed-point iteration and graph traversal
- Day 4 runs Game-of-Life-style erosion until the population stops changing; Day 11 walks a DAG counting paths; Day 10 implements a recursive halving solver
- Crucially, ClickHouse allows GROUP BY and aggregates inside the recursive term, which standard SQL and Postgres forbid
- That is what makes Day 11 tractable: they collapse identical (generation, node, flags) states with sum(paths_count) each step, turning exponential path enumeration into polynomial DP
- Every recursion has a hard depth guard (depth < 256, < 100, < 628) rather than a natural termination condition
- Commentary: the depth guards are the tell that these are tuned to one specific input; 628 is not a number you arrive at by reasoning about the problem

Carrying boolean flags through recursion to encode path constraints
- Day 11 part 2 needs paths that visit both dac and fft, solved by adding visited_dac/visited_fft columns updated with OR at each hop
- Filtering on both flags at the end avoids any post-processing or path materialisation
- This generalises: any "must satisfy predicate along the way" constraint becomes extra state columns, at the cost of multiplying the DP state space by 2^k

Self-join inside the recursive term for neighbour counting
- Day 4 does CROSS JOIN of the point set against itself with a BETWEEN box filter and HAVING countIf(...) >= 4
- Commentary: this is O(n²) per iteration for up to 256 iterations with no spatial index, which is the least defensible thing in the post; a grid-cell join key or an array-of-rows representation would be dramatically cheaper
- They also lean on the query cache (use_query_cache, 80,000,000s TTL) on exactly the two slowest days, which reads as papering over the runtime

arrayJoin to explode compact representations into rows
- Day 2 turns range bounds like 11-22 into one row per integer, then filters with a WHERE clause
- ARRAY JOIN range(0, 2^n) on Day 10 generates the entire button-press powerset as rows for brute force
- The tradeoff is explicit: Day 5 deliberately does not explode, because the ranges would produce billions of rows, and uses arrayExists instead

Specialised aggregate functions that replace whole algorithms
- intervalLengthSum collapses the merge-overlapping-intervals problem into one call (Day 5 part 2)
- L2Distance computes 3D Euclidean distance over array literals (Day 8)
- polygonAreaCartesian and polygonsWithinCartesian do the geometry on Day 9, with Ring as a first-class type
- Commentary: this is the strongest argument in the post — the win is not SQL as a language, it is the size of ClickHouse's standard library; in Postgres you would reach for PostGIS and the same trick works

sumMap and arrayReduce for merging keyed counts
- Day 7 models "how many timelines are at each column" as Map(UInt8, UInt64) and merges converging branches with arrayReduce('sumMap', ...)
- This is a sparse vector, and the row-by-row update is a sparse vector-by-transfer-matrix multiply, i.e. the same structure as Pascal's triangle or a Markov chain step
- Using a map rather than an array keeps the state sparse and avoids materialising empty columns

Bitmask enumeration for small search spaces
- Day 10 part 1 treats each button combination as an integer, uses bitTest to check membership and bitCount as the cost function
- Feasible only because n is small; part 2 explicitly abandons brute force for the halving recursion
- Related idea: the parity/effect pattern split in part 2 is essentially solving the low bit first and recursing on (target - pattern) / 2, which is binary long division generalised to vectors

Hashing strings to integers to make joins cheap
- Day 11 maps node names through cityHash64 before joining, on the stated grounds that string comparison in a large recursive join is slow
- Uncertainty: collision risk is negligible at this scale but non-zero, and there is no verification step; for a puzzle that is fine, for production it is a silent correctness hazard
- LowCardinality(String) would likely have given most of the benefit without the hash

Character-level grid handling via ngrams(s, 1)
- ngrams is a text-analysis function repurposed as "split string into array of characters", used on Days 3, 4, 6, 10 and 12
- Transposition is done by arrayMap over a range of column indices, indexing into each row array — a manual matrix transpose (Days 6 and 12)
- ASCII art becomes numbers via nested replaceRegexpAll turning # into 1 and . into 0, then toUInt8 per character (Days 10 and 12)
- arraySplit chunks an array on a predicate, used to group digit columns into expressions separated by operator columns

Array functions filling gaps in the SQL aggregate vocabulary
- arrayProduct substitutes for the product() aggregate that SQL simply lacks
- arraySum with a lambda over two parallel arrays gives a dot product in one expression (Day 12)
- arrayZip pairs operators with their operand groups (Day 6)
- Commentary: the recurring pattern is aggregate-to-array-to-lambda; when the row model does not fit, they collapse into arrays and use functional programming instead

Approximate sketches used as a running counter
- Day 8 part 2 builds uniqCombinedState per edge and uses runningAccumulate to get a running distinct-point count without repeated DISTINCT
- Uncertainty and pushback: uniqCombined is HyperLogLog-based and approximate; using it as an exact threshold trigger (>= 1000) to pick the single answer row is genuinely risky, and could pick the wrong edge
- The query also needs allow_deprecated_error_prone_window_functions = 1, and ClickHouse's own naming there is warning you off
- A safer construction is groupUniqArray-based counting or an ordered running count over deduplicated first-appearances

Epsilon perturbation to work around geometric edge cases
- Day 9 shrinks the candidate rectangle by 0.01 units before the containment test so that shared edges do not break polygonsWithinCartesian
- It also inflates the bounding box by 0.5 units before computing area, converting cell-centre coordinates into cell-covering coordinates
- Commentary: the magic numbers are the standard robustness hack in computational geometry, but they are input-dependent; exact rational or integer-grid reasoning avoids the problem entirely
