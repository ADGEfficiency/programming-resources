---
id: future-data-science-past
aliases: []
tags: []
---

The hype around algorithms ignored four truths:

1. algorithms are cogs in a system
2. don't understand problems
3. aren't creative solutions
4. live in a mess

ML for problem solving has two parts:

1. Predicting something
2. Acting on that prediction

Fact you can predict something doesn't mean you can act on it.

What is the real issue:
- We aren't using the correct algorithm
- We don't understand the business problem

[The Future of Data Science is Past | Vincent D. Warmerdam](https://koaning.io/posts/the-future-is-past/)

Algorithm's are only part of an analytics system

It takes a team a lot of time to realise what problem it is actually solving.

Getting this right is hard. It's even harder when the majority of the team consists of the same people. Worse; these people are trained in machine learning and prefer to keep themselves to the algorithmic part of their work.

Algorithms are not creative solutions
- hyper-parameter search is not a creative solution to a problem
- want effective, not efficient, algorithms

Allow ourselves to solve problems without algorithms for a change.

Businesses instead have dynamic situations that consist of complex systems of changing problems that interact with each other. To repeat what is said here; I call such situations messes

This is especially true when we consider that the world is a moving target.

 It consists of two parts: predicting the future and making a decision based on this. The effectiveness here depends on how well we can predict the future as well as our ability to act on it. The fact that you can predict something (churn, the weather) does not mean that you can act on it. The fact that you can act on it does not mean that it is predictable.

---

Overall thesis: data science hype created inflated expectations, mirroring an old operations research critique
- The hype around algorithms ignored four truths: algorithms are cogs in a system, don't understand problems, aren't creative solutions, and live in a mess
- Author admits sounding cynical but promises a hopeful ending
- The whole essay is framed as a modern translation of Russell L. Ackoff's 1979 paper "the future of operational research is past"
- commentary: the rhetorical move (reviving a 40-year-old warning) is itself the strongest argument — if the same critique applies verbatim, the field's problem is structural, not technological

Algorithms are merely cogs in a system
- A recommender for the Dutch BBC needed six parts: UI, A/B splitting, a recommendation cache DB, a scheduler/cluster, the algorithm, and a fallback/checker
- The fallback/checker (#6) is the most important part: it guarantees something is always served and enforces hard business rules
- Business rules (licensing windows, no mature content before 22:00, no violence after a kids' show) are unrealistic to learn as hard constraints, so they belong elsewhere in the system
- The notebook algorithm is the small investment; the surrounding system is where nearly all the work goes
- Therefore a recommender is an engineering investment more than an algorithmic one — you want solid engineers, not a pure-scientist team
- Simple heuristics often suffice: "watched together", "watched together unless too popular", "next episode"
- "Recommend the next episode" is not ML yet should compete with any deep learning model
- commentary: this is the "always build the dumb baseline first" principle; the strong baseline is also the thing you measure your fancy model against, and it usually wins on cost/maintenance
- → links to Goodhart-style risk: optimizing the algorithm in isolation ignores that the constraint layer (#6) is what actually protects the business

Algorithms don't understand problems
- Teams take a long time to discover which problem they are actually solving
- A homogeneous, ML-trained team makes this worse because they prefer to stay in the algorithmic part of the work
- Failure modes: bad translation of business into algorithm; business can't act on the output; the solution creates new problems; new problems get re-cast as algorithmic problems, creating a loop
- Algorithmic thinkers tackle problems in isolation from the system
- A better unit of analysis is the communication between two parts of the system, designed in from the start
- Concrete example: realising early you need a checking layer between algorithm and serving, rather than rewriting code later
- Cure: don't staff "a team of data people"; staff an interdisciplinary team that maybe contains a data person (UI specialist, backend engineer, algorithm person, content expert)
- Diverse backgrounds force discussion, a holistic view, and someone who can trigger a pivot — "hard to think outside the box if you're in it"
- commentary: this is the cross-functional "product trio" argument; the claim that you can't pivot from inside your own discipline is a humility point most ML writing skips
- against (unstated in text): interdisciplinary teams also raise coordination cost and can dilute deep technical ownership — the essay never weighs this tradeoff

Algorithms aren't creative solutions
- Creative solutions don't come from hyper-parameter search; aim for most effective, not most efficient
- Teams rarely ask whether the answer is even a machine learning model, or why an algorithm is a sensible starting point at all
- Condom-factory fable (1980s): demand was unpredictable, factory and warehouse both costly
- A consultancy declared it a statistics problem and brought in econometricians who, after two months and many billed hours, found no predictable pattern
- A factory worker reframed it: don't shut the factory down, find a product whose demand correlates negatively with condoms so the plant runs year-round — supposedly the origin of the latex pacifier
- The fable's truth is unverifiable, but the lesson is to try solving problems without algorithms sometimes
- commentary: this is constraint-reframing / Theory-of-Constraints thinking — the win came from changing the objective, not the model; econometricians answered the question asked rather than the question that mattered
- against: relying on an admittedly unverifiable anecdote weakens the section; it's a vibe, not evidence

Algorithms live in a mess
- The data scientist's world is easy: isolated historical data, a pre-built Jupyter setup, fit()/predict(), charts and metrics
- Businesses instead face "messes": dynamic, interacting systems of changing problems
- Problems are abstractions extracted from messes by analysis — "as atoms are to tables and chairs"; we experience messes, not problems
- The world is a moving target, so optimality is short-lived, worsened when fit()/predict() effects are poorly understood or the model is hard to change
- The deployed paradigm is two-part: predict the future, then decide based on it
- Being able to predict something doesn't mean you can act on it; being able to act doesn't mean it's predictable
- Acting well on predictions shifts the world and invalidates future predictions
- If predictive power doesn't degrade after acting, you may have a self-fulfilling prophecy — a worse problem
- Black-box objectivity is unjustified: if you understand the system well enough, why use a black box; if you don't understand the objective, how can you claim optimality
- commentary: this anticipates what's now called performativity / feedback loops in ML (predictive policing, recommender filter bubbles) and concept drift — the self-fulfilling-prophecy point is the sharpest idea in the piece
- → links to Goodhart's law and the "predict-vs-act" gap that later shows up in causal inference and reinforcement-learning critiques of supervised prediction

The real issues
- Stakeholders outside the practitioner bubble will resent the gap between hype and delivery
- The annual hype cycle is the tell: ApacheSpark (2016), DeepLearning (2018), AutoML (2019) — each framed as the missing ingredient
- The real missing ingredient is understanding the problem
- Diagnostic questions: do you talk to end-users, drink coffee with factory-floor workers, accept that a business is a mess rather than a notebook
- To survive a "winter" or downturn, worry less about the algorithm and more about its application in a system
- The field needs engineers, managers, UI designers, web programmers, domain experts and creative thinkers — not just "data scientists"
- The future of the applied field is remembering the old practices that predate the hype
- commentary: the yearly-tool list is dated but the pattern held — you could append "GenAI/LLMs (2024)" and the sentence still reads true, which is the essay's implicit prediction coming due

Conclusion: the argument is borrowed and that's the point
- An old paper triggered the essay, from an era when operations research occupied data science's hype slot
- Ackoff's 1979 paper was gloomy under identical conditions ("amazing things with computers, every process on the brink of optimisation")
- Every argument here is a modern translation of that 1979 article
- The author wishes he'd known Ackoff and suspects they'd have gotten along
- commentary: leaning entirely on Ackoff is both the essay's strength (credibility, recurrence) and its limit — it offers diagnosis and a staffing prescription but no mechanism for why each generation re-learns this the hard way
