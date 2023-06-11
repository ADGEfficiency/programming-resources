[Advantages of monorepos](https://danluu.com/monorepo/)

- projects can be organized how they should, not how the VCS wants
- reduces overhead from dependency management
- repository is always in a consistent state

[Why Google Stores Billions of Lines of Code in a Single Repository](https://cacm.acm.org/magazines/2016/7/204032-why-google-stores-billions-of-lines-of-code-in-a-single-repository/fulltext)

Benefits

- unified versioning
- code sharing
- simplified dependency management
- team collaboration
- flexbile code ownership
- code visibility

Drawbacks

- tools to scale development, execution & code health
- codebase complexity
- unecessary dependencies

Trunk based development + release branches

Feature flagging

Avoids the `diamond dependency` problem

- A depends on B and C, 
- both B and C depend on D, 
- B requires version D.1 and C requires version D.2. 
- It is now impossible to build A

For the base library D, it can become very difficult to release a new version without causing breakage, since all its callers must be updated at the same time. 

[Monorepo, is it worth considering?](https://www.reddit.com/r/ExperiencedDevs/comments/tmca5u/monorepo_is_it_worth_considering/)

Tips:
- Can use git sparse checkout to not get every folder in repo.

Good
- Single commit history.

Criticism:
- breaks disrupt multiple places of work,
- npm packages is better bet,
- CICD takes longer to run.

[Advantages of monorepos](https://danluu.com/monorepo/)

[Don't ask if a monorepo is good for you – ask if you're good enough for a monorepo](http://yosefk.com/blog/dont-ask-if-a-monorepo-is-good-for-you-ask-if-youre-good-enough-for-a-monorepo.html)
