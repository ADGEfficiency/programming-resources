---
id: agents
aliases: []
tags: []
---

[Home | GitHub Agentic Workflows](https://github.github.com/gh-aw/)

Use GitHub Copilot, Claude by Anthropic or OpenAI Codex for event-triggered and scheduled jobs to improve your repository. GitHub Agentic Workflows augment your existing, deterministic CI/CD with Continuous AI capabilities.

[I replaced chaotic solo Claude coding with a simple 3-agent team (Architect + Builder + Reviewer) — it's stupidly effective and token-efficient : r/ClaudeAI](https://www.reddit.com/r/ClaudeAI/comments/1sa7ju4/i_replaced_chaotic_solo_claude_coding_with_a/?utm_name=mweb3xcss)

How the Three-Man Team Works

It’s deliberately rigid (that’s the point):

*Architect (the planner): Arch

Takes your high-level request, breaks it down into a tight, scoped brief, and hands it off. No vague wandering. They own the big picture and only sign off on deployment.

*Builder (the implementer): Bob

Gets the Architect’s brief, makes a short plan, then codes exactly what’s asked. No adding random features, no reading the entire codebase unless instructed.

-*Reviewer (the quality gate): Richard

Checks the output strictly against the brief. Approves it or sends it back for fixes. Nothing ships without this step. Very tough on scope and what was built.

The handoffs are all done via simple markdown files in a handoff/ folder. Super transparent and easy to follow. Everything is controlled through context files (CLAUDE.md, agent prompts, token rules) so it works with Claude Code, Cursor, VS Code + any LLM that can read project context. 

[(19) Building pi in a World of Slop — Mario Zechner - YouTube](https://www.youtube.com/watch?v=RjfbvDXpFls)

Properties of good agent tasks

- small scope
- closed loop - can evaluate it's own work
- not mission critical (dashboards, debugging tools)
- boring stuff OR stuff you don't have time to try
- rubber duck
- evaluate, take what is reasonable, finalize
