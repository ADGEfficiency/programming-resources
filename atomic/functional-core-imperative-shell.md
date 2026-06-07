---
id: functional-core-imperative-shell
aliases: []
tags:
  - programming
  - testing
  - atomic
---

```
# shell
imperative(
    # core
    functional(
        functional(
            # shell
            imperative()
        )
    )
)
```

Functional core, imperative shell (FCIS)
- Side-effect code in a thin imperative boundary
- Bulk of logic pure and side-effect-free
- Functional core holds pure, side-effect-free business logic operating only on data it's given
- Imperative shell owns side effects (DB calls, sending email) and calls the core to do the actual logic
- Easy to test the core (stateless, side-effect-less)
- Deepest critique of FCIS — the purity boundary is exactly where performance pressure breaks down, so the core can't always stay pure

Could also be called
- generic code, specific shell (GCSS)
- GCSS risks violating KISS and YAGNI and causing overengineering

- FCIS is about verification ("does it do what it's supposed to") 
- GCSS is about validation ("is that what we actually need")

The orthogonality argument: FCIS and GCSS analyze the same program along different axes
- FCIS lens: a broad region with no side effects, a narrow region with them
- GCSS lens: broad regions solving general problems, narrow regions instantiating them specifically
- GCSS is applied recursively (specific shell wraps slightly-more-generic core, which decomposes again); FCIS doesn't recurse the same way

Over-exposing config variables creates cruft; knowing what to hardcode vs expose is an underappreciated skill

Code that chains many function calls on one line is hard to debug
- Named-intermediate-variables style won the room among enterprise devs (netdevphoenix: 5 functions on a line fails review in most .NET/Java shops); the pipe-operator fans are largely the functional crowd

Passing functions as arguments decouples the core from IO (dependency injection / inversion)

[Simplify your code: Functional core, imperative shell | Hacker News](https://news.ycombinator.com/item?id=45701901)

Functional core, imperative shell (FCIS) is the article's thesis
- Push side-effecting code to a thin imperative boundary, keep the bulk of logic pure and side-effect-free
- Benefit: the pure core is trivially unit-testable without mocks, fixtures, or external dependencies
- Benefit: bugs in the imperative shell have a small blast radius (one usage of the core)
- Counterpoint raised: it's basically a restatement of older ideas (hexagonal/ports-and-adapters architecture, Gary Bernhardt's 2012 "Boundaries" talk, onion/clean architecture)
- My commentary: the testability argument is the strongest and least contested part of the whole thread; almost everyone agrees pure logic is easier to test, they only disagree on what to call it and how far to take it

"Generic core, specific shell" (GCSS) is proposed as the real principle, with FCIS dismissed as a distraction
- Claim: business layer belongs "on top," generic reusable components belong underneath, like screws or electronic components reused across devices
- Argument for: generic foundations are stable, you avoid costly dependency churn, one module solves many domains via a simple interface
- Argument against (js8): this is the opposite of FCIS, which deliberately keeps the shell generic/simple (it handles DB quirks, network, language, display) and puts complex specific business logic in the core
- Counter-resolution (Twisol): they aren't opposed, they're orthogonal — FCIS is about verification ("does it do what it's supposed to"), GCSS is about validation ("is that what we actually need")
- My commentary: a lot of the thread's heat comes from "core" and "shell" meaning different parts of the program in each framework; the two camps were talking past each other until Twisol pointed out words can have contextual meanings

The orthogonality argument: FCIS and GCSS analyze the same program along different axes
- FCIS lens: a broad region with no side effects, a narrow region with them
- GCSS lens: broad regions solving general problems, narrow regions instantiating them specifically
- GCSS is applied recursively (specific shell wraps slightly-more-generic core, which decomposes again); FCIS doesn't recurse the same way
- Objection (js8): if you call the business logic the "core," then the core is the most specific part, contradicting GCSS — e.g. a game's rules engine is the core and is highly specific, while the UI could be generic
- My commentary: the game example is a genuinely good stress test; see ECS and engine reuse below for the rebuttal

Some problems cannot be meaningfully decomposed into reusable generic pieces
- Example (js8): tax calculation is just a list of rules and exceptions; splitting into "part 1" and "part 2" is meaningless; game rules only exist in the context of other rules
- Rebuttal (Izkata): the generic core is the thing doing the math (spreadsheet/DB); tax rules are the specific shell imposed on top
- Counter (js8): then the "core" is just the programming language, which isn't a useful distinction for how to write programs
- Rebuttal (Twisol): the tax code across years is a more general problem; companies like Intuit get good at changing only the parts that update each year
- Supporting example (Izkata): python's requests library has a simple "specific shell" plus documented "lower-level / lower-lower-level classes" as the generic core
- Related example (Twisol): Git's "porcelain vs plumbing" split, porcelain implemented in terms of plumbing
- My commentary: the requests and git examples are the most concrete in the thread and worth remembering; they show the pattern emerging organically rather than being designed up front. Relates to the Unix philosophy of layered tools

GCSS risks violating KISS and YAGNI and causing overengineering
- Claim (netdevphoenix): "understand the wider context" invites premature abstraction, e.g. stereotypical enterprise Java
- Rebuttal (Twisol): every principle including KISS/YAGNI causes harm if applied without care; there's no context-free rule
- Defense via example (gf000): for a business app, an experienced dev foreseeing multi-currency support may rightly prepare for it
- Counter (netdevphoenix): real business requirements are far more complex than a currency list; the example is oversimplified
- My commentary: this is the eternal abstraction tension; the disagreement is really about prediction skill, i.e. how well you can foresee which axes of change will actually materialize. Connects to "speculative generality" as a named code smell

Haskell is suggested as the way to internalize FCIS
- Haskell forces FCIS: IO code can call pure functions but pure functions can't call IO
- It doesn't restrict what you can do, only how you structure it (pure function computes an effectful program to run, etc.)
- Real-world testimonial (ynhatex): a Python refactor splitting pure from impure made unit testing trivial and surfaced real bugs; later swapping files for a DB was easy because IO was encapsulated
- Nuance: full algebraic data types weren't needed; product types sufficed; the core wasn't strictly pure (RNG, logging) but "pure enough" still paid off
- My commentary: the honest "pure enough" admission is more useful than purist dogma — informal FCIS in a non-functional language captures most of the value

Code quality, not "functional," may be the real lever
- Claim (QuadmasterXLII): the key is having a distinct core/shell and holding the core to a higher quality standard; "functional" is just a proxy for quality
- Rebuttal (ccortes): no, the article is specific about meaning side-effect-free, not a vague proxy
- My commentary: I lean toward ccortes here — "functional" has a precise testability payoff that "high quality" doesn't capture

There is no such thing as objectively "good code"
- Claim (motorest): "good code" is people passing off subjective taste as universal law; like claiming your regional cuisine is the one true definition of good food
- Supporting point: DDD is heavily documented as the way to write good code yet has a near-purist OO core, contradicting the "core must be functional" claim
- Rebuttal (bccdee): DDD's underlying ideas (entity/value object distinction) aren't married to OO and fit FCIS fine; the original 2003 book is just dated
- Escalation (motorest): "underlying ideas" is cherry-picking; rejecting anemic domain models as an anti-pattern is enough to reject FP-DDD compatibility
- Rebuttal (bccdee): there's no one true way to build a "good bridge" either, but a beam bridge still collapses under an 18-wheeler where a suspension bridge holds — judgment isn't pure taste
- My commentary: motorest's stance collapses into self-refutation — if all code judgment is mere taste, the claim "there's no good code" is itself just taste. The bridge analogy is the better epistemics: constraints make some designs objectively wrong even if many remain valid

Methodology can't substitute for experience ("Programming as Theory Building")
- Claim (quietbritishjim): you can't transfer decades of experience in a few articles; good advice is a fragment of a diligent dev's day, not a fix for all companies
- References Naur's "Programming as Theory Building" and Joel Spolsky's chef-vs-McDonald's analogy
- My commentary: this is the most quietly important point in the thread — it reframes every "one weird trick" architecture post, including the article itself, as necessarily incomplete

Extreme specificity at the edges can outperform clever abstraction (the PTO test)
- Claim (frank_nitti): leaving teammates dumb single-purpose scripts (run-config-a-for-client-x.ps1, edit line 8) means no emergency calls during vacation; slick flexible utilities generate "can you hop on?" texts
- Principle: put the slick reusable stuff in core libraries, keep the executables dumb
- Supporting point (zdc1): over-exposing config variables creates cruft; knowing what to hardcode vs expose is an underappreciated skill
- My commentary: this is GCSS in practice — generic core, maximally specific (even copy-pasted) shell. It also quietly endorses some duplication at the edges over the wrong abstraction (relates to Sandi Metz's "duplication is cheaper than the wrong abstraction")

Code that chains many function calls on one line is hard to debug
- Complaint (hackthemack): nested calls like email.bulkSend(generateExpiryEmails(getExpiredUsers(db.getUsers(), Date.now()))) confuse colleagues about where errors originate
- Suggestion: revive Pascal's function (returns a value) vs procedure (side effects, no return) distinction
- Rebuttal (HiPhish): the problem is one-dimensional code; decompose into general functions composed with filter/map so the "what" and "how" separate; pipes and generator expressions read better
- Rebuttal (sfn42): just bind each step to a named variable on its own line — easier to read, debug, and follow in a stack trace; also push filtering into the DB query
- Author concedes (ajusa): the first draft did use multiple lines; single-line was for fitting on one page, and "db" was a regrettable choice that distracted from the point
- My commentary: the named-intermediate-variables style won the room among enterprise devs (netdevphoenix: 5 functions on a line fails review in most .NET/Java shops); the pipe-operator fans are largely the functional crowd

Pipe operators / threading macros make chains readable
- Elixir |>, Clojure ->>, proposed JS pipeline operator, Python's Pipe library all thread output into the next call
- Benefit (whichdan): easy to tap/inspect mid-pipeline, insert steps, reuse steps, collect {:ok, _}/{:error, _} results
- Objection (netdevphoenix): exceptions in a pipeline obscure their origin without a stack trace
- Rebuttal (MarkMarine): hasn't seen that problem in real Clojure use; FP isn't for everyone
- My commentary: the objection is weaker than it sounds — pipelines still produce stack traces; the real readability cost is for readers unfamiliar with the idiom

The article's example (db.getUsers() then filter in app) is widely criticized as unrealistic
- Objection (many): nobody should load all users into memory then filter; it should be db.getExpiredUsers(Date.now()); it won't scale
- Rebuttal (several): with lazy query builders / ORMs (Django QuerySet, SQLAlchemy, LINQ, the proposed Typegres), getUsers() returns a query object and getExpiredUsers adds criteria, deferring execution to SQL
- Rebuttal (doix): it's a real and common bug, likely to increase with vibe coding
- Author concedes (ajusa): had to fit one page, picked something familiar; regrets "db"
- My commentary: the LINQ/QuerySet rebuttals are the most illuminating — they show the leaky-abstraction tension where performance forces the "shell" (DB) to penetrate the "core," which bad_username argues is a self-counterexample to the article

Performance is a top cause of abstraction leaks
- Claim (bad_username): on an infinite machine you'd code in pure business abstractions; real machines force you to speak "the machine's language" at scale
- The programmer's skill is speaking both languages and knowing when to switch; ORMs are messy footguns because they try to bridge this and fail
- My commentary: this is the deepest critique of FCIS in the thread — the purity boundary is exactly where performance pressure breaks down, so the core can't always stay pure

Command-Query Separation (CQS) as a related lens
- Bertrand Meyer's idea: separate code that asks a question (pure, cheap unit tests) from code that acts (imperative, expensive tests)
- Weakness raised (hinkley): functions that "do things" without verifying preconditions are exploitable and easy to accidentally expose (Java had this)
- Clarification debate (Jtsummers): CQS doesn't require commands to always succeed or skip validation; commands can run internal queries, branch, and set queryable state — they just don't return values
- Distinction (jakewins): CQS/CQRS is different from FCIS; CQRS "query" code can still hit DBs and grab locks, whereas FCIS is about a lower-level pure core useful on both command and query sides
- Async wrinkle (layen8): in async environments you can't always repeat a query for the same result, so a command often must return info, making it also a query
- My commentary: the thread never fully resolves whether void-only commands are practical; codebje's verdict that purity is "presentation fodder, not practicality" is the pragmatic landing spot

Distinguishing pure functions from effectful procedures at the language level
- Idea: a language with func (pure) and proc (side-effecting) keywords, as Nim and Ada have
- Objection (lmm): Rust tried this early; nobody agrees what makes a function impure, so you pay effect-system costs for partial benefits
- One workable definition offered (cestith): impure = touches anything outside the function or outliving it (no IO, local mutation OK if it doesn't escape, same input → same output, no calling impure from pure)
- Stronger position (lmm): use higher-kinded types and monads so functions can have effects and return values while keeping the distinction explicit
- My commentary: the "colored functions" link surfaces here — Haskell's IO and JS's async/await are both function-coloring schemes; the disagreement is whether coloring is a feature or a tax

Passing functions as arguments decouples the core from IO (dependency injection / inversion)
- Concrete pattern (CharlieDigital): bulkSend takes userFn, filterFn, emailProducerFn, senderFn; the inner logic is fully decoupled from IO so you unit-test by swapping functions, no mocks or spies
- Used in production for LLM agents to avoid slow/costly integration tests; reported zero core-runtime production errors, all fragility at integrations
- Observation: surprisingly many devs never write code that passes a function down
- Naming debate: is this DI? (globular-toast yes; zdragnar closer to the OO Template Method pattern; CharlieDigital: injecting a function exposes a smaller surface than injecting an object)
- My commentary: the object-vs-function surface-area point is the sharpest practical insight here and explains why FCIS feels lighter than classic DI containers

Time should be injected, not read globally (Date.now vs clock.now)
- Claim (time4tea): never use global time; pass a clock () -> Instant so you can test; setting a global mock clock is "too evil"
- Rebuttals: Date.now() is fine (POiNTx); use UTC to dodge daylight savings; libraries like freezegun control time without classic mock pitfalls (Izkata)
- Counter (ruszki): "Date.now is fine" is why tests break every 3 months and waste research time; IoC clocks and freezegun solve the same problem, freezegun is itself a mock
- Pitfall noted (Izkata): freezegun applied to the wrong module is a common Python import mistake
- My commentary: this is a clean microcosm of FCIS — time is an effect, and the disagreement is purely about injection vs library-level mocking, not whether to isolate it

Result/Either monads vs exceptions for error handling
- Claim (shortrounddev2): nested chaining invites exceptions as control flow; prefer Result types that short-circuit on error
- Shows the pattern across C++ (std::expected, C++23), Java (Optional.map), and a custom pipe helper
- My commentary: this connects FCIS to railway-oriented programming (Scott Wlodarkowski's term in the F# DDD link); errors-as-values keep the core pure where exceptions would smuggle in control-flow effects

Transactions and resource lifecycles resist a pure core (the hardest objection)
- Claim (taeric): open/close/acquire/release are imperative by nature; RAII implies functional shell over imperative core, the opposite of FCIS
- Stronger claim (mrkeen): a transaction must roll back ("all or nothing"); side effects make that impossible; style/flavour/niceness are irrelevant to this
- Further (taeric): transactions can fail at the very last commit step, and commit may be far removed in time from the open, so any style forcing open/close close together is brittle; some transactions fail partway and need a reconciliation process
- Rebuttal (garethrowlands, whstl): this is exactly where FCIS helps — don't do arbitrary side effects inside a transaction; Haskell's STM is the example; the monadic part is the functional core, the runtime is the imperative shell; long-lived or unserializable handles are managed explicitly the same way you would in any paradigm
- My commentary: this is the most substantive unresolved tension in the whole thread; the honest synthesis is that FCIS handles short serializable transactions cleanly but long-running, partially-completable, cross-time transactions (POS terminals, payment reconciliation) genuinely strain the model, and you fall back to explicit state machines

Tell-Don't-Ask appears to conflict with FCIS
- Question (smusamashah): FCIS asks for data and acts on it externally, which seems opposed to Tell-Don't-Ask (co-locate data and behavior)
- Resolution (crymer11, quoting Fowler): Fowler himself doesn't use Tell-Don't-Ask and warns it can turn people into "GetterEradicators"
- My commentary: these two principles really do point in opposite directions; FCIS/CQS favor separating query from action, OO favors fusing them — you can't fully satisfy both at once

The pattern is old, rediscovered repeatedly
- Bernhardt's "Boundaries" talk (~2012) popularized the exact phrase; the original screencast predates it; commenters note it reads like a 2007 post
- bitwize claims independent invention in a Scheme ecommerce system in the early 2000s, while noting smarter people surely did it earlier
- Parallels drawn to null being a "billion-dollar mistake" (2009) — good ideas take decades to gain traction
- My commentary: the recurring independent rediscovery is itself evidence the pattern is a natural attractor, not a fashion; relates to Naur's theory-building point about why it can't just be transmitted via blog posts

Meta-observation about the article's origin and reception
- It's a Google one-page bathroom "Testing on the Toilet"–style tip, deliberately short and therefore using a contrived example (fsmv)
- This context explains nearly every complaint about the db.getUsers() example
- My commentary: a striking amount of the thread is people critiquing an example the format forced to be unrealistic; the underlying principle drew far less disagreement than its illustration

[Google Testing Blog: Simplify Your Code: Functional Core, Imperative Shell](https://testing.googleblog.com/2025/10/simplify-your-code-functional-core.html)

The problem: mixing business logic with side effects produces code that's hard to test, reuse, and understand
- Database calls, network requests, and I/O tangled directly into core logic are the named culprits
- My commentary: the article asserts this rather than demonstrating the pain; the cost is mostly felt at test time, where mixed I/O forces mocks and fixtures

The solution: a functional core called from an imperative shell (FCIS)
- Functional core holds pure, side-effect-free business logic operating only on data it's given
- Imperative shell owns side effects (DB calls, sending email) and calls the core to do the actual logic
- My commentary: this is Gary Bernhardt's 2012 "Boundaries" pattern, itself a relabeling of hexagonal / ports-and-adapters architecture

Claimed benefits: testability, maintainability, adaptability
- Core can be tested in isolation (pure functions, no mocks)
- Shell can be swapped or modified independently
- Counterpoint (from the wider discussion, not the article): purity breaks down exactly where performance and long-lived transactions force the shell to penetrate the core
- My commentary: the testability claim is the durable one; "maintainability/adaptability" are softer and depend on whether your domain has a clean pure/impure seam at all

The refactor splits one mixed function into getExpiredUsers, generateExpiryEmails, and a one-line shell
- Core functions filter and map over a User[] with no I/O
- Shell composes them: email.bulkSend(generateExpiryEmails(getExpiredUsers(db.getUsers(), Date.now())))
- Criticism (widely raised elsewhere): db.getUsers() loads all users into memory then filters in app, which doesn't scale and should be a DB query
- Defense: the author conceded the example was constrained to fit a one-page format and that "db" was a distracting choice
- My commentary: the single-line composition is also the part most enterprise reviewers reject; binding each step to a named variable reads better and gives cleaner stack traces

Extensibility payoff: new email types reuse the existing core
- Adding reminder emails is just a new pure generateReminderEmails plus reusing getExpiredUsers with a different cutoff
- My commentary: this demonstrates reuse of the filter, but note getExpiredUsers is doing double duty as "users past an arbitrary cutoff," so the name lies slightly in the reminder case — a small hint that the abstraction is already being stretched

Format and provenance
- This is a Google "Testing on the Toilet" one-page tip, deliberately short, which explains the contrived example
- Links out to Bernhardt's original talk for depth
- My commentary: the brevity is the whole reason the example invited so much critique; the principle drew far less disagreement than its illustration
