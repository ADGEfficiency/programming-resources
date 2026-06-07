---
id: three-constraints-before-building
aliases: []
tags: []
---

Constraints enable creativity
- constraints collapse the search space and push you toward innovative solutions
- the most elegant solutions arise from building with a constraint, not from unbounded freedom
- all three constraints are filters for what NOT to build, not generators of ideas
- if an idea fails any of the three constraints, the author doesn't build it
- complexity is conserved, so the goal isn't fewest primitives but primitives best fit to the goal and a clear language for combining them

Three constraints:

1. write down the whole thing in one document exactly one page long
2. the core tech must be separable from the product
3. one defining constraint must shape the product (limits feature creep, forces identity)

1. One page or it doesn't get built (limits complexity and ambiguity)
- write a one pager for every idea; it captures your north star and is non-negotiable, precise, ambitious, and lean

2. The core tech must be separable from the product (limits you to ideas with real leverage and originality)
- build a core technology — a method, skill, tool, or even product — that supports your product but is not the product and must survive without it; reusable IP
- you don't need big-tech resources — it can be a library extracted from your codebase or a refined methodology

3. One defining constraint must shape the product (limits feature creep and forces identity)
- define a single constraint that is front and centre — the user sees and interacts with it constantly; it's obvious and gives the product identity and "feel," permeating the whole UX
- the constraint must also be front and centre in the one pager
- this is the richest idea and maps onto the HN "product primitives" / "concept count" / "nouns and verbs" discussion — the block, the cell, the tweet

Product primitives: good design uses a small number of powerful, composable primitives
- a bad product doesn't know what its primitives are, or has too many, so everything is a unique thing with its own behavior — confusing, intimidating, hard to teach
- ideally one to three main primitives; power/depth comes from choosing primitives that are deep and composable
- "concept count" / the "nouns and verbs" of a product
- a product's interface is a language the user learns; good products give a small powerful vocabulary, bad ones lack coherence so simple tasks need many "words" or words don't compose

Rebuttal: the principle applies to design software, not agents
- in design software the user creates durable things and must understand them, so primitive count matters

Alexander's "Centers," not patterns (gavmor)
- references Christopher Alexander's Pattern Language, which inspired the Gang of Four Design Patterns
- Alexander later argued the true building block is a Center: a localized focal point of utility and coherence (a courtyard, window seat, fireplace) that resolves local tension, is made of smaller centers, composes into larger ones
- products feel bloated not from bad intent but because user needs are empirically discoverable while the true underlying centers are subtle and hard to find

[3 constraints before I build anything | Jordan Lord](https://jordanlord.co.uk/blog/3-constraints/)

Premise: constraints enable creativity
- constraints collapse the search space and push you toward innovative solutions
- author has 10 years building; products failed by being too complex or having no identity, and these three constraints are the lesson learned
- the "creativity from constraints" claim is widely held (e.g. Stravinsky, the Oulipo writers, the "fewer choices" design literature) but is asserted here from personal experience, not evidence
- note the framing is negative/defensive: all three are filters for what NOT to build, not generators of ideas — the closing rule confirms this

Constraint 1: one page or it doesn't get built (limits complexity and ambiguity)
- write a one pager for every idea; it captures your north star and is non-negotiable, precise, ambitious, and lean
- it doubles as your communication artifact — the same memo serves investors, contributors, team, friends, family
- it resolves conflict: if a contention point isn't in the one pager it's either not worth fighting over or the pager should be amended to include it
- it organizes your own thinking; if you can't fill a page, don't pad it — you're not ready, so research, plan, prototype, then rewrite and iterate
- if it needs more than one page it's too complex, don't build it
- tension: using one document as both internal thinking tool AND external investor pitch is convenient but those audiences want different things; the conflict-resolution rule is the strongest part (it makes the doc a live decision authority, not a dead spec)
- the hard "exactly one page" cutoff is the most questioned point downstream — HN commenter jll29 argued it should scale with project complexity (a Mars control system can't fit on one page)
- relates to the Amazon six-pager / one-pager memo culture and to "if you can't explain it simply you don't understand it"

Constraint 2: the core tech must be separable from the product (limits you to ideas with real leverage and originality)
- build a core technology — a method, skill, tool, or even product — that supports your product but is not the product and must survive without it; reusable IP
- rationale: separation forces thinking beyond the current product; products pivot constantly while core tech is constant and compounding, and compounding gives non-linear gains over long horizons
- examples: Torvalds built git to improve Linux kernel workflow; HashiCorp has HCL; Google has Kubernetes
- you don't need big-tech resources — it can be a library extracted from your codebase or a refined methodology
- core tech is a long-term commitment, independent of product direction but aligned with your/your company's long-term vision
- if the idea doesn't enable core tech, it isn't high-enough leverage
- this is the weakest-defended tenet and drew the most pushback: HN noted Google's actual core/origin was PageRank not Kubernetes, and that LLMs ARE the product, so tech isn't always separable
- the examples are also survivorship-selected — git and Kubernetes are famous precisely because they succeeded; countless extracted libraries went nowhere
- it conflates two different goods: engineering separation (clean seams, reuse) and strategic optionality (IP that outlives the product); the Skype case (P2P backend kept separate from the sold app) is a cleaner illustration of the second than any in the article
- counter-risk raised on HN (codethief): mandating separability everywhere invites premature abstraction; the domain layer is unavoidably tied to the product

Constraint 3: one defining constraint must shape the product (limits feature creep and forces identity)
- define a single constraint that is front and centre — the user sees and interacts with it constantly; it's obvious and gives the product identity and "feel," permeating the whole UX
- examples: Minecraft is entirely blocks; IKEA is flat-pack self-assembly furniture
- choosing the constraint reduces your decision space so you focus on the problems that matter; the design "falls out" of a well-designed constraint
- no constraint or a bad one yields a bloated product that tries to do everything
- the constraint must also be front and centre in the one pager
- this is the richest idea and maps onto the HN "product primitives" / "concept count" / "nouns and verbs" discussion — the block, the cell, the tweet
- unresolved gap (flagged by HN): no worked example of how you derive the constraint, only finished exemplars; "the design falls out of a good constraint" is asserted, and the hard part — discovering the right constraint — is skipped (cf. Alexander's "Centers" being discovered, not declared)
- counter-evidence the article ignores: a single ruthless constraint can still produce devastating complexity (Tana's two primitives), and a goal-fit larger set can beat a minimal one (Hangul vs a single-stroke system)
- also a strategic risk: treating the defining constraint as immutable identity can block the pivot that finds product-market fit (Twitter came out of Odeo as a side project)

Closing rule
- if an idea fails any of the three constraints, the author doesn't build it
- honest as a personal heuristic, but as stated it's three independent gates, which is strict — many successful products would fail at least one (esp. constraint 2), as a HN commenter noted: the set of successful non-conforming products is not empty
- also note constraints 1 and 3 are coupled (the defining constraint must live in the one pager), so they aren't fully independent filters

My overall read
- constraint 1 is the most broadly defensible and immediately actionable; constraint 3 is the most intellectually interesting but underspecified on the crucial step of finding the constraint; constraint 2 is the most contestable and arguably a heuristic for app/tool builders that breaks for foundational-tech companies
- the article is short, confident, and example-light on the hard parts (how to derive a constraint, how to know your tech is "real" core tech); it reads as distilled personal doctrine rather than an argued framework
- its real value is as a forcing function — three sharp questions to ask before building — not as laws; the comment thread is where the ideas get stress-tested into something more nuanced

[Three constraints before I build anything | Hacker News](https://news.ycombinator.com/item?id=47903541)

The three constraints from the article (tenets)
- 1: write down the whole thing in one document exactly one page long
- 2: the core tech must be separable from the product
- 3: one defining constraint must shape the product (limits feature creep, forces identity)
- the comments engage far more with the underlying ideas than the article itself, which several found thin

Product primitives: good design uses a small number of powerful, composable primitives (csallen)
- examples: Notion blocks, Telegram messages/conversations, Figma frames/layers, tweets, Excel cells, Photoshop tools/layers, CLI commands, Minecraft blocks
- a bad product doesn't know what its primitives are, or has too many, so everything is a unique thing with its own behavior — confusing, intimidating, hard to teach
- ideally one to three main primitives; power/depth comes from choosing primitives that are deep and composable
- this is essentially the article's tenet 3 restated; the primitive IS the defining constraint
- relates to Unix philosophy and orthogonality — small composable parts (pipes, "everything is a file") combine to do a lot

This is just "concept count" / the "nouns and verbs" of a product (azhenley)
- minimize the number of core concepts
- lioeters extends it: a product's interface is a language the user learns; good products give a small powerful vocabulary, bad ones lack coherence so simple tasks need many "words" or words don't compose
- the language framing is the strongest reframe in the thread — it makes "learnability" the real metric, not minimalism for its own sake

Counterargument: minimizing primitives can be oversimplified (argee)
- Tana has ~two primitives (bullets and supertags) yet is devastatingly complex, needing hours of tutorials for simple tasks
- Google Maps has many primitives but tight UX for 90% of use cases
- so few primitives does not guarantee simplicity, and many primitives does not guarantee complexity
- this is the sharpest pushback in the thread and exposes the real failure mode: low primitive count can just push complexity into how you combine them (Tana) rather than removing it — complexity is conserved, not eliminated

Rebuttal: the principle applies to design software, not agents (unholiness)
- in design software the user creates durable things and must understand them, so primitive count matters
- Google Maps is more an agent: it understands its own complexity and answers queries, so the user need not learn primitives
- a useful distinction — AI agents now blur this line, since they absorb complexity on the user's behalf (see the maximalist comment below)

Counter-rebuttal via writing systems analogy (argee)
- picking the lowest-common-denominator "noun" as your primitive can be worse than a larger, purpose-fit set
- Hangul: primitives designed to serve a goal, no ruthless minimization, learnable in minutes to a day
- Chinese: a single stroke primitive looks elegant for 1, 2, 3 but is overwhelmed by real needs, producing an unwieldy system no one fully masters
- lesson: optimize primitives for the goal, not for minimal count — a counter-intuitive design point
- the analogy is imperfect (Chinese characters aren't really "built from one stroke primitive" in a compositional sense) but the directional point stands

Does Jira have only one primitive, the ticket? (ffsm8)
- everything else just augments the ticket; but if augmentations count as primitives, the same applies to Photoshop etc.
- surfaces the definitional problem: "what counts as a primitive" is slippery, which weakens the whole framework's predictive power
- evnc: Tana is a programming environment disguised as a text editor (in the emacs tradition) — which is why two primitives still yield huge complexity

Maybe these are Alexander's "Centers," not patterns (gavmor)
- references Christopher Alexander's Pattern Language, which inspired the Gang of Four Design Patterns
- Alexander later argued the true building block is a Center: a localized focal point of utility and coherence (a courtyard, window seat, fireplace) that resolves local tension, is made of smaller centers, composes into larger ones
- products feel bloated not from bad intent but because user needs are empirically discoverable while the true underlying centers are subtle and hard to find
- path of least resistance is a rigid bespoke interface per need; discovering a primitive that absorbs many needs is hard architectural work
- "so maybe that's why we build so many faster horses" — the deep, almost philosophical comment of the thread; reframes primitive discovery as genuinely hard rather than just neglected
- connects to the idea that good abstractions are discovered, not invented

The same metric applies to programming languages (noufalibrahim)
- a language can be large in surface but should be conceptually small, so experience compounds
- conceptually large languages (cited: Perl) impose a barrier
- supports the "minimize concepts" thesis but in a different domain — though Scheme (tiny) vs Common Lisp (large) shows small-concept languages aren't automatically more productive

Small but not too small — the shell counterexample (boris)
- POSIX/bash modeled scripting as commands to avoid new concepts, producing a "hot, slow mess"
- shows under-minimizing (forcing everything through one primitive) is also a failure, mirroring argee's Chinese point

Defense of bash (dhamidi)
- bash is a victim of its own success: extremely low barrier to entry means most learn 1% and stop
- few read the manual or know what zsh adds; the "mess" is what you get anywhere the entry barrier is very low (early PHP, early JS/frontend, click-around game engines)
- skydhash: shell is for automating interactive work, not for in-memory data structures; using it like Python is frustrating
- jamesfinlayson: a uni assignment to build a spreadsheet in bash existed precisely to teach "don't use bash for complicated things"
- the defense is partly fair but dodges boris's actual point — the language design itself (everything-is-a-command) creates the footguns, independent of user skill

Products with too many primitives (gzread)
- Snapchat and Instagram named as worst offenders
- anecdotal, no analysis, but a data point that feature/primitive sprawl is felt by users

A practitioner says the article matches how they built a business (kianN)
- core tech was a sampler for arbitrary hierarchical Bayesian graph models on sparse data; constraint was CPU-bound tractable compute (tenet 3)
- hardest lesson was that end products must be separate from the underlying technology (tenet 2)
- "some lessons need to be lived to be learned" — they had been told this in advance and still had to learn it the hard way
- a real-world endorsement of tenets 2 and 3, though n=1 and survivorship-biased

Constraints are underrated (CharlieDigital, perrygeo, zuzuleinen)
- the most elegant solutions arise from building with a constraint, not from unbounded freedom
- writing the one-pager helps define the constraints (ties tenet 1 to tenet 3)
- perrygeo: without a page of constraints you flail and discover them late, and those aren't bugs but "we're building the wrong thing" flaws; teams that get on the same page conceptually succeed more often (admittedly no hard data)
- the "creativity from constraints" claim is widely believed and has some support (e.g. studies on constrained creative tasks), but the thread offers only intuition

Critique: tenet 3 lacks a worked example (Synthetic7346)
- reader is lost on how the single defining constraint looks in practice
- globalnode: feels like a made-up hook; suggests "everything's a file" in Linux as a strong unifying concept you can go far with
- igorkrasnik: Obsidian's "file over app" is a real constraint that shapes product decisions
- a fair criticism — the article asserts the principle but the commenters, not the author, supply the convincing examples

Critique: tenet 2's examples don't hold up (raincole, esafak, codethief)
- raincole: "Google has Kubernetes" makes no sense; Google was a product built around PageRank, the core tech
- frotis: it didn't matter to users what it was built around, only that search was faster and more relevant
- esafak: the biggest product of the century, LLMs, ARE the core tech — so tech isn't always separable from product
- danielheath: reframes it — the product is automation, the tech is LLMs
- 1659447091: LLMs aren't products yet; still early-adopter stage; a tech waiting for a product, like the internet before the web browser; Copilot is close because it bundles LLM tech onto GitHub
- the LLM debate is the most interesting tension: tenet 2 may be a heuristic for app builders that breaks down for foundational-technology companies

Apple's "we never ship technology, we ship products" (1659447091 quoting new Apple CEO)
- offered as evidence for the tech/product separation
- jrowen pushes back: what about teams shipping SDKs, GPUs, internal tools? "leverage" makes it sound like they only use others' tech, which is false; why throw "shipping technology" under the bus?
- 1659447091: likely just different internal language; end goal is shipping an end-user product that orchestrates tech in ways the components couldn't alone
- exposes that "separate tech from product" can be marketing framing rather than an architectural law

The Skype example for tenet 2 (jll29)
- P2P backend tech and the calling front-end were split into two companies; when Microsoft bought the Skype app, the founders kept the core P2P IP company
- the cleanest concrete example of separable tech in the thread, and a business/IP argument rather than a pure design one

The one-pager should scale with project complexity (jll29)
- one page suffices for small-to-medium projects; a Mars flight-control system's one-pager would need to hyperlink to many sub-specs
- gyan and gyan-style jabs ("how big is the page, what font size?") make the same point as snark
- a reasonable softening of tenet 1; "one page" is really "one page of top-level intent," not one page total

Tenet 3 shouldn't be treated as immutable doctrine (jll29)
- consider a ranked list of major and minor constraints instead of one
- if the top constraint is hard to commercialize, treating it as doctrine drives you to bankruptcy; a pivot may make it sellable
- Twitter began as a side project of the podcasting tool Odeo; the public-status-update idea was almost incidental
- strong pushback — rigid identity can prevent the pivot that actually finds product-market fit; tension between "forces identity" and "stay adaptable"

Missing constraint: distribution / can I find one beta user this week (Abby_101)
- time, scope, and tech can all pass the one-pager filters and the project still dies because no one shows up
- a distribution constraint forces audience validation before going deep on features
- tonyedgecombe: that's a target/goal, not a constraint
- the most actionable addition in the thread; the founder graveyard is full of well-built products with no demand, so this arguably belongs above the original three

Missing constraint: time (quredec)
- most founders moonlight; the experiment must survive a year with only you in the critical path, which kills many feature ideas before they start
- frames time pressure as a passive filter that weeds out ideas so you don't have to
- complements Abby_101 and tonyedgecombe's "tighter money forces more creative solutions"

Applying the constraints outside software (wanderingbit, globalnode)
- a kitchen renovation could use the three constraints; globalnode riffs: people space / storage space / operations space, or flow of people / light / food / transitions
- tonyedgecombe: cost is the primary constraint for most people, and tighter money forces more creative solutions
- shows the framework is general-purpose, which is both its appeal and a sign it may be too vague to be falsifiable

Does codethief's worry about premature abstraction (separating tech from product)
- forcing separation everywhere risks premature abstraction and pattern-application; the domain layer is still inevitably tied to the product
- skydhash: the point is there's a veneer that attracts buyers and internals that need not be the buyer's concern; a few interface concepts connect the layers but each evolves independently
- a legitimate engineering caution — "separable" should mean clean seams, not speculative generality (cf. YAGNI)

What are Hacker News's own constraints? (disciplined, answered by several)
- mkl: built in Arc, a small Lisp dialect that long had poor performance — an invisible constraint with visible effects
- Grosvenor: HTML 4.0
- aryehof: just submitted links + threaded comments, an advanced ranking algorithm, moderated contribution
- globalnode: the social constraint — stay thoughtful and nerdy, don't get emotional or snarky or you get downvoted/shadowbanned
- a nice meta moment: HN itself exemplifies few primitives (links, comments, votes) plus one strong ranking/moderation constraint

With AI agents, be a maximalist instead (sayYayToLife)
- the "one defining constraint" advice is a bit outdated; now tell people to be maximalist
- asserted without argument, but worth flagging: if agents absorb complexity (per unholiness), the case for minimal user-facing primitives weakens, while the case for minimal core concepts may not

Skeptical closers (satisfice)
- every successful product that doesn't fit these constraints will just be built by someone else, and that's not an empty set
- the honest limitation: these are heuristics that describe some winners, not necessary conditions; survivorship bias looms over the whole thread

My overall read
- the article is a serviceable heuristic but the thread does the real work, and it converges on a sharper thesis than the post: complexity is conserved, so the goal isn't fewest primitives but primitives best fit to the goal and a clear language for combining them
- tenet 1 (one page) is widely endorsed and easy to defend; tenet 3 (one constraint) is endorsed but needs the "don't make it doctrine" and "add distribution/time" caveats; tenet 2 (separate tech from product) is the most contested and clearly breaks for foundational-tech companies like LLM labs
- the strongest single contribution is gavmor's Alexandrian "Centers" framing, because it explains WHY good primitives are rare: they must be discovered, not declared
