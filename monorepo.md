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
