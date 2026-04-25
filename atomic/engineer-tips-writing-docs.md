---
id: engineer-tips-writing-docs
aliases: []
tags:
  - documentation
---

State clearly what documentation will achieve for the reader

Write inclusively
- Avoid "noob", "simple", "easy" — what's easy to one person may not be to another, and labeling it so alienates people who struggle
- Aim for a low reading level (Egger targets third grade)
- Avoid jargon, figures of speech, pop culture references, and memes — these don't translate globally
- Spell out acronyms on first use; consider a glossary — acronyms intimidate newcomers
- Assume a beginner audience unless you know otherwise

Documentation as marketing

Editing is the real secret to good writing

User-testing docs with junior developers
- Watch a new junior use docs silently while narrating their thoughts
- Must use someone unfamiliar with the docs each time

[An Engineer's Best Tips for Writing Documentation Devs Love - The New Stack](https://thenewstack.io/an-engineers-best-tips-for-writing-documentation-devs-love/)

State a clear goal upfront that the documentation will help readers achieve
- Developers want to get things done, not read marketing copy
- Grandiose product descriptions will be skipped anyway
- Analogous to Vonnegut's advice that every character should want something

Code examples should use real-world problems
- Readers jump straight to code, skipping explanatory text (Stack Overflow behavior)
- Foo/Bar variable names are meaningless; use descriptive names

Verify instructions before publishing
- Incorrect documentation is worse than no documentation — it wastes time rather than just redirecting
- Test in a fresh environment, not just the author's machine
- Have someone else work through the docs

Structure documents for scanning, not linear reading
- Use headings, subheadings, bold library names
- Include a table of contents
- Users have ~6 seconds before they leave; if they can't find what they need, they go to Stack Overflow

Write inclusively
- Avoid "noob", "simple", "easy" — what's easy to one person may not be to another, and labeling it so alienates people who struggle
- Avoid gendered language; use "you" or "y'all"
- Aim for a low reading level (Egger targets third grade)
- Avoid jargon, figures of speech, pop culture references, and memes — these don't translate globally
- Spell out acronyms on first use; consider a glossary — acronyms intimidate newcomers
- Assume a beginner audience unless you know otherwise

Write the way people speak
- Conversational prose makes docs more accessible
- Avoid "SAT words" — obscure vocabulary used in tests but not everyday speech

[An engineer’s tips for writing documentation devs love | Hacker News](https://news.ycombinator.com/item?id=31945863)

Documentation as marketing (DigitalOcean approach)
- Good docs signal engineering competence to potential customers
- DO employs professional editors, which is unusual and explains quality
- Cloudflare's postmortems cited as another example of excellent technical writing

Editing is the real secret to good writing
- David Sedaris reportedly rewrites each sentence 19-20 times
- Analogy: ballroom champions still drill basic steps; mastery looks effortless
- Most documentation is bad because there's no editing process or editor involvement

User-testing docs with junior developers
- Watch a new junior use docs silently while narrating their thoughts
- Must use someone unfamiliar with the docs each time
- Must involve real tasks, not proofreading
- Google and Salesforce docs cited as failing this basic test
- Several commenters confirm this works well in practice

Examples-only documentation is insufficient
- Examples help beginners but are useless for reference or edge cases
- Kubernetes docs criticised for being example-heavy with poor discoverability
- GitHub Actions similarly criticised; CircleCI contrasted favourably
- Real API/parameter references should exist alongside tutorials
- Examples that omit return values or use underscores are actively harmful

Basic writing hygiene rules (from comments, not the article itself)
- Define terms before using them (linear reading)
- Expand all acronyms on first use; consider a glossary
- No marketing language ("fast", "reliable", "secure") — show, don't claim
- No humor in technical docs — it's annoying at 3am during an incident
- No ego or personal anecdotes
- Prefer plain English over idioms and slang
- Structure for skimmability, not just linear reading
- Format code as code, math as math

Incorrect documentation is worse than no documentation
- No docs sends you elsewhere; bad docs wastes time and misleads
- Docs that don't identify their target audience waste readers' time
- Introduces trust problems: once you get burned, you distrust the whole source
- StackOverflow and DO solve this with comment sections and datestamps

Documentation rot over time
- Valid docs become invalid as code evolves
- Some engineers write less because every line is a liability
- A dependency graph from code to docs (to flag what needs updating) is a desired but unsolved tool
- Authors need to be rewarded for revisiting and reverifying old docs

Hire tech writers and have them verify, not just polish
- Engineers provide rough content quickly; polishing takes expertise they lack
- Tech writers should follow instructions to verify correctness, not just edit prose
