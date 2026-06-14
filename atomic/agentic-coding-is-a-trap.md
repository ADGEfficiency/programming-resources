---
id: agentic-coding-is-a-trap
aliases: []
tags:
  - artificial-intelligence
  - programming
  - software-development
---

[Agentic Coding is a Trap | Lars Faye](https://larsfaye.com/articles/agentic-coding-is-a-trap)

Atrophying skills for a wide swath of the population.

AI tooling has now been proven to impact negatively individual's critical thinking skills and cognitive clarity.

The atrophy of coding skills is concerning is the “paradox of supervision”:

- effectively using Claude requires supervision
- supervising Claude requires the very coding skills that may atrophy from AI overuse.

---

Before AI, a (good) developer's priority list might look like:

- Understanding of the code and its relation to the codebase
- If the code is aligned with the documented and efficient standards
- As few lines of code as needed to accomplish the goal (while maintaining readability)
- Turnaround time

AI inverts this list

---

AI being fast can be bad

an impressive force multiplier, but there has to be some force to multiply

review cost asymmetry

---

Solution = demote AI's role

- lean on them to brainstorm the planning parts of the process while staying actively engaged throughout implementation, - delegating to them on an as-needed basis. 
- You can leverage the productivity gains, and mitigate the comprehension debt.

[Agentic Coding Is a Trap | Hacker News](https://news.ycombinator.com/item?id=48002442)

The article's core claim: writing code and reading code are intrinsically linked, so abandoning hands-on coding atrophies the skill needed to review and architect
- The author (larsfaye) clarifies in comments he never claimed you must "know everything about everything" — that was a misreading by fnordpiglet
- He points to a movement (started by Karpathy's "vibe coding" tweet) toward "LGTM"-level reviews where teams stop reading code at all
- "Thinking in code" is presented as a distinct cognitive mode that is interdependent with higher-level planning and architecture
- Counterpoint raised by danenania: none of thinking/abstracting/designing requires coding by hand; agents can do those faster, including in unfamiliar domains
- My view: the strongest version of this claim is the "tactile discovery" point (see below), not the generic "use it or lose it" framing, which is harder to defend against tool-abstraction history

The tactile/discovery argument — coding as the act of figuring out what to build
- keyle's coding-as-planning insight, komali2's validation: typing the code is how many devs reason through the problem and discover the design
- abalashov calls this a "keen insight" — the man-machine typing process is a discovery pathway that natural-language specs skip
- Counterpoint (socketcluster): coding-as-planning is actually bad planning — it maximizes sunk-cost fallacy, locks in the first idea, and turns a prototype into the foundation before you understand the problem (the "wooden house in cyclone country" analogy)
- These two are in genuine, interesting tension: is early code a discovery tool or a premature commitment? Probably depends on whether the domain is familiar
- Related external idea: Naur's "Programming as Theory Building" (1985), cited by Terr_ — the program is a shared mental model in people's heads, and code is a lossy representation you can't reconstruct from

Generated code is harder to review than human code
- lgrapenthin: LLM code is linguistically plausible but incoherently imitates idioms, disguising bugs in ways no human (even a bad one) would produce; with no internal evaluation, the reviewer must rebuild rationale line by line — often deeper work than writing from scratch
- WorldMaker's framing: LLMs are "legacy code as a service" — trained on others' legacy code, producing "Day 1 Legacy Code" with no human owner and no theory-of-mind to reverse-engineer
- abalashov: the verbose, brute-force, circuitous output carries a higher cognitive metabolizing cost than a competent human's terser approach
- Open question (djmips): would training on only "good code" fix this? WorldMaker says no — the "human poetry" / metaphorical layer can't be reached regardless; dilyevsky counters that high-quality C++ looks the same as it did six years ago and innovation doesn't come from code tricks
- The "poetry" framing is evocative but slippery; the concrete, testable claim is the review-cost asymmetry, which is the more useful part

Reviewers won't actually do the work — the "checked out" problem
- enigmoid: finding issues requires the dev to care, and many (especially at big firms) are already checked out, just closing tickets; capable devs won't put in the effort during speed mania
- awakeasleep: in big firms, many devs are actively punished for caring
- This compounds the review-cost problem above: even if careful review is possible, incentives push against it

Writing code was never the bottleneck — optimizing the wrong thing
- ryandrake's detailed breakdown: planning, design docs, cross-team buy-in, code review, legal/privacy/QA reviews, staged rollout — a 2-month feature where coding is 1 day, and we're optimizing the 1 day down to 5 minutes
- mempko (30 yrs): writing code is the EASY part; LLMs solved the easiest part; the hard parts (domain modeling, user mental models, architecture, data structures, having a point of view) remain
- Counterpoint (ytoawwhra92): all that process exists because engineers were expensive; make them cheap and the process evaporates; startups will gain advantage by eliminating it; legal/QA reviews are "in the firing line"
- Counterpoint (dilyevsky): models give ~50x speedup on tedious work (dependency updates, build scripts, unit tests); "platform engineering is dead"
- SpicyLemonZest's lived rebuttal: platform engineers are treading water against higher code velocity, not freed by it
- otabdeveloper4's sharp line: "it's always the case where you think LLMs are great at doing whatever it is that you don't understand or value" — directed at the claim that PE is just bash scripts
- mempko/lelanthran's reframe is worth pulling out: the "spec writer who doesn't code" role already exists (Business Analyst), it always paid less, and flooding the supply will depress that pay further — a deflating counter to the "I'll just do architecture" optimism

The "you can iterate until quality matches yours" claim
- ex-aws-dude/sibeliuss: nothing stops you from iterating with the agent until the code matches your own standards; these articles are case studies in laziness
- Counterpoints converge: kelnos/leptons/bigstrat2003/habinero say it's as fast or faster to just write it yourself; habinero's timed experiments came out on-par-or-slower and more frustrating
- larsfaye (author) concedes models can hit the bar with enough guardrails/examples/system-prompt work, but it's a "sliding scale of ambiguity to chaos" and producing the guidance can be as arduous as writing the code; he mostly interacts in pseudo-code
- thedevilslawyer issues a concrete challenge: put up a repo and SOTA agents will match the quality in a fraction of the hand-coded time — notably no one took it up in-thread
- The "Jevons Paradox" exchange (abalashov vs danenania): does robust building now cost roughly the same as quick-and-dirty? danenania says implementation time is decoupled from quality now; abalashov says you can't build robustness purely a priori

Vendor lock-in is weaker than the article claims
- est31/einsteinx2/fnordpiglet: harnesses aren't tied to one vendor — CC can point at DeepSeek via env vars, you can transpile configs between Claude Code and Codex, and converting an implementation between stacks is near-trivial with an LLM because the spec is canonical
- The article's lock-in worry is partly answered, though the systemic cost worry (if hardware costs rise, all vendors rise together) is not

The economic/market-pressure trap (the most pessimistic and, I think, most underrated thread)
- intrinsicallee's recurring thesis: software is a knowledge business, and orgs are trading their core asset (knowledge) for short-term speed, playing into the hands of the soon-to-IPO vendors selling the tools
- jdw64's long, anguished comment: freelance rates and deadlines are now calibrated around LLM output, so even "don't vibe code" clients set impossible deadlines; those with status/credentials can refuse AI, those lower in the market can't
- hunterpayne's blunt answer ("stop using it, period") collides with jdw64's survival reality — a stark illustration that the principled and the practical answers diverge by economic position
- Saline9515's analogy: like GPS-assisted driving eroding navigation skills (and roadsigns disappearing so you're stuck with GPS), the market realigns and handcrafters get outcompeted on speed
- tmvnty's cynical capitalism take: companies are sold junk AI, then will be sold "solutions" to the problems it created
- This is the thread's real center of gravity, and it's barely about code quality — it's about who captures the value and who bears the deskilling

The "AI exposes the worst of business-driven development" thread
- monksy: AI makes people too fast — fast output without understanding; rewards business-value talkers over deep-knowledge builders; no reputational punishment for bad decisions
- zbentley's sharp reframe: businesses always prioritized slipshod business-driven development; the human engineering process only coincidentally checked its worst outcomes, never intentionally
- Terr_: AI reorders problems — "is this what we should build" and "what could go wrong" get deferred to "we'll see if anyone complains later"
- Counterpoint hope (wiieee): disciplined firms will destroy undisciplined ones (Apple analogy); rebutted by ehnto/WorldMaker — markets are irrational, many firms succeed despite poor execution, and the "last 3 months" measuring stick rewards fast-and-broken

The "if AI can do it, it's not hard" position
- mikert89: none of the complicated software he works on can be reliably written by AI yet
- slopinthebag's vivid version: AI handles mechanical drudgery (divs, boilerplate, generic SaaS, Next.js apps) but craps the bed on the slightest novelty (multithreaded real-time MMO networking); "people need a reality check"
- Partial counter (helloplanets): SOTA models have cracked some research-level math problems with the right harness (limit context, deep-research loop, not the default CC style)
- habinero's skepticism: the math results are usually the easy/trivial-once-attempted ones; distrusts arxiv corroboration; even the cited paper admits its problem was unsolved only because no one tried hard
- throwaway894345's middle path: narrow ticket scope, minimal context, TDD with small changes and constant testing — there's real craft to using agents well
- This is probably the most defensible practical synthesis in the whole thread

Two useful seat/cockpit metaphors for the human-agent relationship
- doginasuit: driver's seat vs. back seat vs. passenger seat — always taking the back seat and you forget how to drive; always insisting on the front seat and you miss domains the LLM knows well; the future belongs to those who default to the driver's seat but recognize when not to
- bartread: like two airline pilots — one flying, one monitoring; if you're monitoring, you read and understand every proposed change
- Both are more actionable than the article's binary framing

The spec-driven-development-is-just-waterfall observation
- ivolimmen: SDD is technically what we did under Waterfall, and he misses the good documentation; jira tickets are now one-liners
- rDr4g0n's detailed practitioner counter: write specs at component/module level, define API contracts and types, decompose into ~100-line units, trace bugs back to the spec, lean on the type system to keep specs terse — claims a modest 2x speedup without losing touch with the system
- The interesting nuance: rDr4g0n is doing SDD but deliberately at small granularity to preserve the mental model, which is almost a direct answer to the article's atrophy worry

The "this is just the next abstraction layer" framing and its rebuttals
- slopinthebag/phendrenad2: generating code isn't a new abstraction, it's a codegen machine for the same abstraction; the same skills matter whether you type it or the machine produces it
- bitwize's mechanical-engineering analogy: removing machining from the mech-eng curriculum produced grads who can't design parts because they don't know how parts are made; CNC doesn't save you — someone who understands machining still designs cheaper/better parts with fewer revisions
- The "did the assembly→Fortran transition feel like atrophy?" question (raised against the author): illiac786 suspects identical complaints were made then, and notes nobody learns assembler anymore "and that's a problem" — predicts coders who can actually code become very valuable rather than disappearing

Inverting control — code as runtime, LLM only for judgment
- dbrecht_: rather than LLM-as-runtime doing everything, write deterministic control flows (LangGraph) and call the LLM only where judgment is genuinely required ("if it's deterministic, write it in code; if it requires judgement, use the LLM")
- This directly addresses determinism, vendor independence, cost-capping, and skill-preservation in one architectural stance — the most constructive engineering proposal in the comments
