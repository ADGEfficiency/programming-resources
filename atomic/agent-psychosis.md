---
id: agent-psychosis
aliases: []
tags:
  - artificial-intelligence
---

Maintainers drowning in low quality PRs

The asymmetry between generating and reviewing code is brutal
- Minutes to generate, hours to honestly review

Cognitive surrender

Agent loop is addictive
- ease of building decoupled from should this be built

[Agent Psychosis: Are We Going Insane? | Armin Ronacher's Thoughts and Writings](https://lucumr.pocoo.org/2026/1/18/agent-psychosis/)

Maintainers are drowning in low-quality AI-generated PRs and issues
- Contributors feel they helped; maintainers see an insult to their time
- Pushback confuses contributors, who don't see what they did wrong

People are forming parasocial, dependent relationships with their AI agents
- Analogy to dæmons in His Dark Materials: external companions tied to identity
- Separation (rate limits, downtime) feels painful; users lose their "powers"
- Non-programmers wield large capabilities entirely mediated by the agent
- The "collaboration" is one-sided — the AI just goes along with the user

How people prompt dramatically shapes output quality
- Good results require context, tradeoffs, and domain knowledge
- Common bad patterns: unclear instructions, role-play, slang, swearing, ritualistic behavior, forcing the agent down narrow paths
- Users unfamiliar with the system accept whatever the AI says and think they understand it

Agent coding produces a real dopamine loop / addiction
- Author's own experience: two months of sleepless overuse, building tools he never used
- "You can just do things" — but ease of building decouples from whether it's worth using
- Without outside review, users spiral deeper into believing it all makes sense
- Outsiders poking at the output reveal how flimsy it often is
- Example: Cursor's AI-written browser is an impressive demo but slop underneath

Token consumption of hands-off loops is enormous and likely unsustainable
- Disciplined sessions are efficient (MiniJinja → Go port: 2.2M tokens)
- "Ralph"-style restart-from-scratch loops waste cached context
- Current pricing is probably subsidized; cheap coding plans may not last
- My addition: this mirrors VC-subsidized rides/food delivery — behavior built on subsidy tends to collapse when prices normalize

"Slop loop cults" form around tools like Steve Yegge's Beads and Gas Town
- Beads: 240k LOC to manage markdown files in GitHub repos, with poor code quality
- Mad Max-themed jargon (polecats, refineries, mayors, convoys) reads like cult vocabulary to outsiders
- Real dysfunction: version checks spawn 7 subprocesses, doctor command times out, almost impossible to uninstall, components don't integrate well
- Similar dynamics in AI-builder Discord/X circles: mutual hype, no critical review

The asymmetry between generating and reviewing code is brutal
- Minutes to generate, hours to honestly review
- Maintainers can't easily distinguish careful AI use from careless AI use
- Rejecting contributions feels harsh because the contributor felt good about it

Some projects are adapting in awkward ways
- Vetting human contributors before accepting code
- Requiring prompts alongside code, or preferring prompts over code
- Trust shifts toward running the agent yourself rather than trusting someone else's run

The author's uncertainty: is this psychosis real or is he just behind the times?
- He uses AI himself, isn't a luddite, but is frustrated
- Possible answers: better tooling for quality signals and context sharing, cultural self-correction, or an awkward transition phase
- Or some people are genuinely losing the plot and won't know until later
- Closing image: someone at 3am running ten parallel agents claiming peak productivity — author sees something else

My commentary
- The dæmon framing maps onto existing literature on parasocial relationships with chatbots (Replika communities, character.ai) — coding agents may just be the developer-flavored version
- The maintainer asymmetry is a classic Brandolini's law / bullshit asymmetry problem applied to code review
- "Prompts as the real artifact" echoes older debates about whether source code or specifications are the true source of truth — and resembles literate programming inverted
- Missing from the piece: discussion of whether better agent tooling (stronger evals, type checks, test gates before PR submission) could shift the asymmetry, rather than relying on cultural norms
