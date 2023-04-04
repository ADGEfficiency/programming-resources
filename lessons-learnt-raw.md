For my 20 years programming anniversary, I tried to list the top principles that have been accumulated over the years as my guiding principles through my career:

    Don’t fight the tools: libraries, language, platform, etc. Use as much native constructs as possible. Don’t bend the technology, but don’t bend the problem either. Pick the right tool for the job or you’ll have to find the right job for the tool you got.
    You don’t write the code for the machines, you write it for your colleagues and your future self (unless it’s a throw away project or you’re writing assembly). Write it for the junior ones as a reference.
    Any significant and rewarding piece of software is the result of collaboration. Communicate effectively and collaborate openly. Trust others and earn their trust. Respect people more than code. Lead by example. Convert your followers to leaders.
    Divide and conquer. Write isolated modules with separate concerns which are loosely coupled. Test each part separately and together. Keep the tests close to reality but test the edge cases too.
    Deprecate yourself. Don’t be the go-to person for the code. Optimize it for people to find their way fixing bugs and adding features to the code. Free yourself to move on to the next project/company. Don’t own the code or you’ll never grow beyond that.
    Security comes in layers: each layer needs to be assessed individually but also in relation to the whole. Risk is a business decision and has direct relation to vulnerability and probability. Each product/organization has a different risk appetite (the risk they are willing to take for a bigger win). Often these 3 concerns fight with each other: UX, Security, Performance.
    Realize that every code has a life cycle and will die. Sometimes it dies in its infancy before seeing the light of production. Be OK with letting go. Know the difference between 4 categories of features and where to put your time and energy:
    Core: like an engine in a car. The product is meaningless without it.
    Necessary: like a car’s spare wheel. It’s rarely used but when needed, its function decides the success of the system.
    Added value: like a car’s cup-holder. It’s nice to have but the product is perfectly usable without it.
    Unique Selling Point: the main reason people should buy your product instead of your rivals. For example, your car is the best off-road vehicle.
    Don’t attach your identity to your code. Don’t attach anyone’s identity to their code. Realize that people are separate from the artifacts they produce. Don’t take code criticism personally but be very careful when criticizing others’ code.
    Tech debt is like fast food. Occasionally it’s acceptable but if you get used to it, it’ll kill the product faster than you think (and in a painful way).
    When making decisions about the solution all things equal, go for this priority:
    Security > Reliability > Usability (Accessibility & UX) > Maintainability > Simplicity (Developer experience/DX) > Brevity (code length) > Finance > Performance
    But don’t follow that blindly because it is dependent on the nature of the product. Like any career, the more experience you earn, the more you can find the right balance for each given situation. For example, when designing a game engine, performance has the highest priority, but when creating a banking app, security is the most important factor.
    Bugs’ genitals are called copy & paste. That’s how they reproduce. Always read what you copy, always audit what you import. Bugs take shelter in complexity. “Magic” is fine in my dependency but not in my code.
    Don’t only write code for the happy scenario. Write good errors that answer why it happened, how it was detected and what can be done to resolve it. Validate all system input (including user input): fail early but recover from errors whenever possible. Assume the user hold a gun: put enough effort into your errors to convince them to shoot something other than your head!
    Don’t use dependencies unless the cost of importing, maintaining, dealing with their edge cases/bugs and refactoring when they don’t satisfy the needs is significantly less than the code that you own.
    Stay clear from hype-driven development. But learn all you can. Always have pet projects.
    Get out of your comfort zone. Learn every day. Teach what you learn. If you’re the master, you’re not learning. Expose yourself to other languages, technologies, culture and stay curious.
    Good code doesn’t need documentation, great code is well documented so that anyone who hasn’t been part of the evolution, trial & error process and requirements that led to the current status can be productive with it. An undocumented feature is a non-existing feature. A non-existing feature shouldn’t have code.
    Avoid overriding, inheritance and implicit smartness as much as possible. Write pure functions. They are easier to test and reason about. Any function that’s not pure should be a class. Any code construct that has a different function, should have a different name.
    Never start coding (making a solution) unless you fully understand the problem. It’s very normal to spend more time listening and reading than typing code. Understand the domain before starting to code. A problem is like a maze. You need to progressively go through the code-test-improve cycle and explore the problem space till you reach the end.
    Don’t solve a problem that doesn’t exist. Don’t do speculative programming. Only make the code extensible if it is a validated assumption that it’ll be extended. Chances are by the time it gets extended, the problem definition looks different from when you wrote the code. Don’t overengineer: focus on solving the problem at hand and an effective solution implemented in an efficient manner.
    Software is more fun when it’s made together. Build a sustainable community. Listen. Inspire. Learn. Share.

I don’t claim to be an authority in software development. These are just the wisdom I earned along the way. I’m sure this list will be more mature after another 20 years.

 > Never start coding (making a solution) unless you fully understand the problem.

While I agree with this in general, I find that to reall fully understand a problem, I need to attempt to code, or at least formulate, a solution to it.

a) because when I break down a problem into its code-able component parts, I learn a lot about it

b) because in the process of then actually implementing these parts I often discover edge cases or undefined cases (especially in naturally grown business-logic)

c) because what the problem actually IS, is often not that clear at the start of the problem. Yes, in an ideal world, changing requirements would wait until the next version, however, sadly that's not what happens in the wild.

Yeah, it could just be me, but I prefer to make two false starts, toss them, and then get it right on the third attempt rather than attempting to whiteboard the problem for two weeks.

Not only is it more interesting to me to try three different ways to tackle a problem, but I have been burned when the two weeks of whiteboarding missed something and I'm back to having to iterate anyway.

To be sure, I do a little whiteboarding, but generally it might be about 2 hours or so of sketching out ideas, major structures, code flow ideas.

I generally was nodding along to most of the author's points though.

I definitely have grown to divorce myself from my ego and always try to not only try to shine the spotlight on my younger coworkers (new engineers) but try to give them "ownership" of key pieces to allow them not only some sense of autonomy/ownership but a sense of pride as well.

That does go slightly against some of the author's points about collaboratively working on a project. Engineers need a part of the code (let's say an image cache manager, as an example) that they can "own" though in order to grow. You don't want an engineer to always have "training wheels" on. (And frankly, I think this is one of the things I dislike about code reviews, I think it dis-incentivises autonomy.)

The team though, let me be clear, is the most important part of any project, not the individual luminaries. The "team" though, to a degree, needs to have engineers who feel an ownership stake in pieces of the product.

---

42 things I learned from building a production database

Customers:

[1] Keep your customers happy; else the rest of this document doesn’t matter.

[2] Be careful to have the right number of customers (in the beginning, just one) and the right customers (whose requirements allow you to build out key technology); and grow that number carefully.

[3] Interface directly with customer ICs. A lot of intra-team conflict can be resolved by saying “I talked to the customer just now and they said…”. In infra we often don’t need to speculate about what customers want; we can just ask them.

[4] But realize that customers may not express what they really need; don’t take requirements at face-value, instead spend the time to understand their use case in detail. Read their code.
Project Management:

[5] Have a simple, crisp mission statement that expresses your raison d’etre. For Delos it was: we will be a reliable foundation for FB infra.

[6] Socialize estimates of task difficulty repeatedly; decision-makers may not have the time, inclination, context, or training to generate these estimates, and may get them wrong (literally) by orders of magnitude.

[7] Task allocation to ICs is critical; ask to be in the critical path of any decision, because you typically have a much better understanding of the problem, the codebase, and the IC’s strengths than the manager. Most managers are thrilled if you and the other IC figure out the task allocation on your own.

[8] A road-map is a means, not an end.

[9] If you get good and/or aligned managers, be as understanding, supportive, and accommodating as you can. If you don’t get such managers… well, I haven’t figured this one out, let me know if you do.

[10] Make your project robust to re-orgs. A company management hierarchy is inherently fragile (a tree is a 1-connected graph, after all); socialize the project continuously with managers who might take over in the future. Do whatever it takes to make sure that manager churn does not result in unfair career outcomes for ICs.

[11] Keep track of how long similar features took in other projects in your space and use this as evidence for task difficulty estimates (e.g., “feature X took three years in system Y; it’s not a one-half job for one IC.”).
Design:

[12] Be conservative on APIs and liberal with implementations.

[13] But insist on careful process around rolling out new implementations (shadowing, staged roll-out).

[14] When designing APIs, write code for one implementation; plan actively for the second implementation; and hope/pray that things will work for a third implementation.

[15] Design APIs with migration to new implementations as a first-class consideration; custom migrations are huge time-sinks and sources of unreliability. Every major API should have a single CLI-driven call for switching implementations.

[16] Design as a team; implement as individuals. This will make design the bottleneck, but it’s worth it: push back on impulses to parallelize design.

[17] For storage systems, bias heavily in the beginning towards consistency and durability rather than availability; these are harder to measure and harder to fix if broken. Because availability is easier to measure, there will be external pressure to prioritize it first; push back.

[18] Maintain multiple implementations in test for APIs; compare results between them. The cost is worth it (it will help with correctness, and also prevent leakage of implementation detail).

[19] Late-bind to designs: encourage the team to think about the entire design space without committing to a particular point solution. Running brainstorming meetings with a bunch of high-IQ, opinionated ICs is an art worth mastering. Encourage rough prototyping in the critical path of binding to a design.

[20] Late-bind to implementers: once design is done, any IC should be able to write the code.

[21] Have the right number of abstractions (this is hard). Too few and you end up with a messy monolith; too many and the team will be overwhelmed by the cognitive overhead of understanding each abstraction’s semantics.

[22] Avoid using real-time for correctness guarantees or comparing clocks across machines unless you have (and understand) error bounds on the clock.

[23] Have a single source of truth. Establish simple invariants between various types of state.

[24] Create a culture where ICs are constantly thinking about radically different designs; do not shut down conversations about hypothetical alternative designs. Encourage curiosity.

[25] Know your SKUs. Cloud infra makes it easy to ignore hardware; but an understanding of hardware (and hardware trends) is critical for design.
Code Review:

[26] In a transparent codebase with quick review cycles, APIs will leak implementation details unless you gate-keep.

[27] Encourage ICs to think critically about diffs and create an environment where people feel free to express concerns. Your response as a diff writer to someone pointing out a problem with a diff should be gratitude, not dismay.

[28] For critical components, consider informal rules such as requiring two accepts or even unanimous accept from some subset of ICs.

[29] For critical components, time to landing a diff is not a metric of importance: push back against impulses to measure this metric and optimize it. Create a culture where ICs are okay with diffs not landing quickly (creative endeavors – books, papers, etc. – typically involve long review cycles due to the cost of high-quality reviewing; why should code be different?).

[30] Sometimes you realize the right design for something only after an IC has written up a candidate design as a diff. Fight the impulse to say “oh well, let’s land it and then fix it later”; you are not helping either the IC or the project by doing this. Create a culture where ICs feel comfortable throwing away code if it’s not the right solution (lead by example).
Strategy:

[31] Ask yourself on some cadence: why does the team/project exist? If it didn’t exist, what would happen (which other team / system would fill the gap)? How is the team adding value to the company and how can it continue doing so in the future?

[32] Keep track of every other major project in your space within the company: you should be able to explain their technical design better than their own ICs. Grab any opportunities to debate scope with the leads of other similar projects: you should be able to articulate how your project fits into the larger ecosystem of options. Inter-team competition is healthy and necessary. Make friends with ICs in these projects: they understand your technical challenges better than anyone else in the company.

[33] Do not compete on raw performance or efficiency with other teams; this will escalate into an arms race where both teams waste time optimizing their systems for point workloads, generating apples-to-oranges comparisons, etc. Compete on fundamental design characteristics.

[34] If someone objectively has a better system for your use case and wants to take it on, go find something else to do.
Observability:

[35] Measurement is a means, not an end.

[36] You should be able to detect problems in your service before your customer does.

[37] As much as humanly possible, observability should be above APIs and external to implementations. This ensures that you can switch implementations and compare performance without introducing bugs in the measurement code. It also de-clutters implementations; and lowers the bar for new implementations.

[38] Anything that can’t be measured easily (e.g., consistency) is often forgotten; pay particular attention to attributes that are difficult to measure.

[39] Push critical checks (e.g. for consistency) into the deployment itself whenever possible; minimize reliance on external services for checks (else you now have two things to track instead of one).
Research:

[40] Keep track of research in your space. Soon you’ll have a shorthand with your ICs that enables super-fast communication: “what if we try that thing from projectX? And combine it with the technique in projectY?”.

[41] Try new things. Bias towards novelty within the space of feasible solutions. Fight the impulse to copy designs verbatim. Every major system was just a half-baked idea in someone’s head at some point.

[42] Write papers. Writing for an audience that has zero context on what you are doing will force you to examine and clarify your assumptions. Papers make it easier to hire good people and to on-board them. Grad students should be able to explain your design back to you (and find bugs!). Try to say yes when asked to give talks. They are fun, and you get to meet new people.
