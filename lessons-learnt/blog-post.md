how were summaries created - separated out into actionable and non-actionable

non-actionable are things like `do the work correctly` or `use the right tool`

Use the right tool for the job. (NA)

Communication is important (NA).

Security is layered and context dependent (NA).

structure post like

- all posts mentioned,
- some,
- one,
- disagreements

---

## Writing Code

favour reability over cleverness

You should write code for junior engineers.

Keep ego & identity out of code.

Take care copy and pasting.

Write and handle errors.

Fail early and recover from errors.

Great code is documented.

Avoid inheritance, overriding and implicit smartness.

Use pure functions.

Be conservative on APIs and liberal with implementations.  Plan to iterate at least three implementations.

Avoid using real-time for correctness guarantees.

tradeoffs - not as good versus bad choices

Soft versus hard interfaces

don't share state

use toy problems

## seniority

Seniority not just aobut programming

curse of knowledge

## PR Reviews

Good enough in PR reviews

keep PRs to single feature

don't comment the obvious stuff

Be OK with long PR reviews.

## Maintenance

always suspect bugs

You should be able to detect problems in your service before your customer does.

Code has a lifecycle.

Tech debt is occassionally acceptable, but can be fatal.

Anything that can’t be measured easily (e.g., consistency) is often forgotten; pay particular attention to attributes that are difficult to measure.

three components make up monitoring - logging, metrics, and alarms

## Design

design for maintenance

favour stable over state of the art

Encourage rough prototyping in the critical path of binding to a design.

UX, security and performance often fight against each other.

Features come in four categories - core, necessary, added value and unique selling points.

Value old technology (sharks).

objective criticism

## Working with others

communication harder than technical

Don’t go it alone.

take breaks

Have fun.

Socalize design. Design as team, implement as individual.

Create a culture where ICs are constantly thinking about radically different designs.


Socalize task esitmates.

Road map (plans) are means, not ends.

Fuck ups happen. Nobody is to blame even when somebody is responsible. Use it as an opportunity to see where the process didn’t work. And if you don’t have a process—well, that’s what’s wrong. Right?

Prefer structured communications tools like an in-house blog, a wiki, Basecamp, Notion, or GitHub over unstructured messaging platforms like email or Slack. Your work has structure; so should your communications.

Give ownership.

Interviews don't work.

## Customers

Customers are the most important thing.

There is an optimal number and type of customer.

Don't take customer requests at face value.

The buyer is quite often wrong. That fact never changes their mind.

Think about the user experience.

customer / tech support is a powerful form of research

## Read

Read code of libraries you depend on

## Write

Write papers. Writing for an audience that has zero context on what you are doing will force you to examine and clarify your assumptions.

## Teach.

teach - documentation is teaching

## Be explicit

## Iterating

Sturgeon’s law applies to your work as well. Don’t linger on one project forever. Make new things. That’s the only way to learn.
## Making mistakes

## Picking/choosing what to work on

Develop Your Personal Brand

Take on big projects. Get uncomfortable.

Don't solve problems that don't exist.

The hardest part of software is building the right thing

## Tension between learning through doing or planning

Don't start coding until you fully understand the problem. HN Fully understanding requires attempting to code a solution.

6. Sometimes you have to stop sharpening the saw, and just start cutting shit

Some people tend to jump into problems and just start writing code. Other people tend to want to research and research and get caught in analysis paralysis. In those cases, set a deadline for yourself and just start exploring solutions. You’ll quickly learn more as you start solving the problem, and that will lead you to iterate into a better solution.

plan before writing code

but don't plan too much

## Regularization - simplicity, small system, no code etc

remove bad code

write less code - more code = more bugs

Best code is no-code, or code you don't maintain.

10% of code causes 90% of bugs.

Don't try to be perfect - Worry less about elegance and perfection; instead strive for continuous improvement and creating a livable system that your team enjoys working in and sustainably delivers value.

Strive for smaller system.

## Web Development

A visitor to your site begins by building a map of it in their heads. Because without that internal map, nothing they will ever do on your site will fully make sense to them because it has no context.

Visible context is always preferable to the context that has been shuffled off into a hidey-hole somewhere.

## Data Science

Data is important.

visualization is a spectrum from exploratory to explanatory. Exploratory graphics you make for yourself to find new insights in data. Explanatory graphics in contrast communicate some already-known insight to an audience. 

working with data should be 80% of the work of visualization.

Model performance != business performance

## Business

business impact

manage expectations

Innovation isn't important.

Any field with multiple successful competitors is good news. It means that there is demand, which you can tap in by addressing the problem in your way. In a sector with solid margins, this is an opportunity for design innovation to shine.

Any field where all of the other competitors are free services, outdated desktop apps, open-source communities with no revenue, or wannabe startup cults burning through cash is a lethal minefield covered in a cloud of mustard gas.

Never go up against a free service from a multinational. At least, never directly.