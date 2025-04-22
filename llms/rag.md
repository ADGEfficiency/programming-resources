## Implementations

[RLAMA](https://rlama.dev/)

[Open source conversational RAG on local files](https://www.reddit.com/r/ollama/comments/1h1q4n9/open_source_conversational_rag_on_local_files/?share_id=73QeDKAeaHjhxxHZZkPho&utm_name=androidcss)

[Plug and Play RAG](https://www.reddit.com/r/LocalLLaMA/comments/1g19wm6/plug_and_play_rag/?share_id=4Bpot6xQokxU8CSK1lb6f&utm_name=androidcss)

[The Limitations of Text Embeddings in RAG Applications](https://neo4j.com/developer-blog/rag-text-embeddings-limitations/)

Combining structured data approaches and unstructured text search techniques can deliver more accurate and relevant responses, ultimately enhancing the user experience in RAG applications.

[Modular RAG: Transforming RAG Systems into LEGO-like Reconfigurable Frameworks](https://arxiv.org/abs/2407.21059)

[Implementing “Modular RAG” with Haystack and Hypster | by Gilad Rubin | Towards Data Science](https://towardsdatascience.com/implementing-modular-rag-with-haystack-and-hypster-d2f0ecc88b8f)

Six components:

1. Indexing: Organize your data for efficient search.
2. Pre-Retrieval: Process the user’s query before searching.
3. Retrieval: Find the most relevant information.
4. Post-Retrieval: Refine the retrieved information.
5. Generation: Use an LLM to generate a response.
6. Orchestration: Control the overall flow of the system.

## Vector Databases

[marqo-ai/marqo](https://github.com/marqo-ai/marqo) - Unified embedding generation and search engine. Also available on cloud - cloud.marqo.ai.

---

We retrieve specific knowledge, like code snippets and documentation, from any external knowledge source (which may or may not be included in the model training set) and use it to guide the generative process. 

If I point you to an arbitrary file in an arbitrary codebase and ask you to “write some code”, you’d also appreciate some context about that codebase. RAG is about automating this process.

[Anthropic’s Contextual Retrieval Explained](https://youtu.be/tmiBae2goJM?si=MUrrxwOn4FVeprqk)

[Stanford CS25: V3 I Retrieval Augmented Language Models - YouTube](https://www.youtube.com/watch?v=mE7IDf2SmJg)

[Text splitting (chunking) for RAG applications](https://medium.com/@hadiazouni/text-splitting-chunking-for-rag-applications-7ccbb6dcc9f9)

Semantic Chunking

The following are some strategies for more useful text splitting.
Sentence clustering-based chunking (needs a better name!):

The idea is to build your semantic chunks from the ground up.

    Start with splitting your document into sentences. A sentence is usually a semantic unit as it contains a single idea about a single topic.
    Embed the sentences.
    Cluster close sentences together forming chunks, while respecting sentence order.

---

Propositional chunking

The idea is to iteratively build chunks with the help of an external LLM.

    Start with a syntactic chunking iteration; Paragraph-based for example.
    For each paragraph, generate standalone statements (propositions) using an LLM, with a prompt like “What are topics discussed in this text?” Propositions must be semantically self-contained and distinct statements.
    Remove redundant propositions.
    Index and store the generated propositions.
    At query time, retrieve from the propositions corpus instead of the original documents corpus.

# 2024-09-17 - CHCH AI Meetup

Inference costs higher on fine tuned - is this only for APIs?

Vectors -> emebeddings -> similarity (cosine similarity or distance, nearest neighbour)

Uses an `embedding model` concept as separate from an LLM
- can use different embedding models with different LLMs
- but need to use the same embedding model with the same other embedding model

Semantic search (meaning) versus lexical (`where summary LIKE %match%`)

Best to combine semantic and lexical searching

RAG
- higher accuracy + relevance
- reduced hallucination
- domain expertise
- provide references to sources
- no model retraining - real time data updates (both adding and deletes)

Chunks should overlap

vector_doc = [doc_id, raw_text, embedding, metadata]

query -> extract chunks -> feed in chunks + query into prompt template -> llm -> response

Just uses a single prompt

Chunking can get complex
- fixed size
- content aware - sentences
- content aware - recursize chunking
- content aware - semantic chunking (done by an LLM)

Agentic RAG - metadata extraction, finding inconsistencies, reviewing the user query (ie for prompt injection), reviewing the final output

Graph RAG 
- combines with knowledge bases
- can traverse nodes in a graph database
- more holistic understanding
- richer RAG context

Testing
- non-deterministic -> hard to test
- tweak prompts, hyperparameters
- can test itself - automated tests via LLM

---

FAR agent
- Classification of query
- Summarize the question
- Search - generate search topics, search knowledge base(s)
- Evaluate results of the search
- Generate result

Changing prompt
- identity, tone, voice

---

Evaluation?

[Jerry Liu - Keynote: Building and Productionizing RAG | PyData Global 2023 - YouTube](https://www.youtube.com/watch?v=EQi5qDJ4Uvc)

Paradigms for inserting knowledge into a LLM
- fine tuning - knowledge goes into weights
- Rag = fix model, put context into prompt

Rag = retrieval + synthesis (aka generation)

RAG lifecycle
- ingestion
- indexing with vectors into vector database
- querying over vectors in db - similarity
- response synthesis

`llama_index` example

RAG stack
- ingestion & parsing - documents -> chunks -> embeddings -> vector database
- querying  - vector db -> chunks -> llms

Chunks = slice of raw text

Querying = retrevial & synthesis
- find top k most similar chunks
- plug into an LLM response synthesis module

Response synthesis
- don't want to overflow conetxt window

Create & refine
- query + node 1 -> response -> node 2 -> response -> node 3 -> final response 

Tree summarization / heirarchical summarization
- parallelizable

Challenges with naive RAG - two types
- quality - hallucination, accuracy
- non-quality - latency, cost

Quality - bad retrival
- low precision - not all chunks are relevant -> hallucination or `lost in the middle` problem
- low recall - not all relevant chunks are retrieved
- outdated infomation

Quality - bad synthesis
- hallucination
- irrelevance - not answering question
- toxicity / bias - harmful or offensive

What can we do?
- data - storing other infomation alongside the raw chunks
- embeddings - optimize embedding representations
- retrieval - better than top k?
- synthesis - better prompts

How to measure performance / evaluation
- can evaluate compenents in isolation
- or end of end

Evaluate of 50 data points

Retrival evaluation
- quality of retrived chunks
- want to return most relevant chunks
- if you can compare with ground truth, can compare predicted against ground truth
- rank order does not correlate with best order to give to an LLM

End to end
- can evaluate how much the response matches the query
- can use LLM evals - evaluate with an LLM

LLM based evaluation
- fafithfulness - whether matches retrived context
- relevancy - whether response matches the query
- guidelines - whether response matches guidelines

With labels - correctness - if matches `golden answer`

---

Simple 
- parsing
- prompt engineering
- chunk sizes
- hybrid search
- metadata filtering

Advanced
- reranking
- recursive retrival
- embedding table
- small to big retrival

Fine tuning
- embeddings
- llm

Agentic behaviour
- routing
- planning
- multi-document agents

---

Optimizing RAG
