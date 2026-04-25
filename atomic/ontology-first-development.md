---
id: ontology-first-development
aliases: []
tags:
  - llm-wiki
  - ontology
  - llms
---

raw sources → wiki → code

[Karpathy's new "LLM Wiki" pattern is converging on exactly what this community has been building : r/OntologyEngineering](https://www.reddit.com/r/OntologyEngineering/comments/1shks1y/karpathys_new_llm_wiki_pattern_is_converging_on/?utm_name=mweb3xcss)

Karpathy's "LLM Wiki" pattern matches ontology-first development
- He published a gist describing a workflow: raw sources → wiki → code
- The wiki is the durable artifact; code is downstream/disposable
- His five rules: compile-first, writeback mandatory, wiki before RAG, platform agnostic, ideas outrank code

The post author (dlthub) claims they've been doing this under the name "ontology-first development"
- Inject an explicit domain model into workflows to constrain LLM behavior
- LLM handles procedure; humans provide the domain model
- They build an ontology upfront and generate code from it

Notably, Karpathy uses markdown files, not OWL/SPARQL
- Seen as evidence the core insight of ontology engineering is universal
- Formal tooling without justification may be actively harmful
- The author frames this charitably: the principle transfers even if the tooling doesn't

Concepts from formal ontology the author thinks map cleanly
- Competency questions → scoping wiki page content
- Modular ontology patterns → "one page per concept"
- Ontology evolution → handling writeback when domain knowledge changes
- Taxonomy-first → resolving synonyms/disambiguation before building relationships (called the most common agentic failure mode)

Open question raised: how to bridge the gap without triggering the AI community's allergic reaction to formal ontology (referencing a "2008 identity crisis")
- Commenters note the same pain point: teams debug prompts, not the underlying world model

My commentary: the "wiki before RAG" rule is the most interesting and underappreciated point — it implies that retrieval over unstructured sources is a downstream optimization, not a foundation. The unresolved "junk drawer" problem (how to keep the wiki coherent as it grows) is the real hard problem here, and nobody in the thread has a good answer yet.
