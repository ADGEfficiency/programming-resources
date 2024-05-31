[The lifecycle of a code AI completion](https://sourcegraph.com/blog/the-lifecycle-of-a-code-ai-completion)

[LMQL is a programming language for LLM interaction. | LMQL](https://lmql.ai/#calc)

[LLM Powered Autonomous Agents | Lil'Log](https://lilianweng.github.io/posts/2023-06-23-agent/)

[ChatGPT's One-year Anniversary: Are Open-Source Large Language Models Catching up?](https://arxiv.org/abs/2311.16989)

[metaseq/projects/OPT/chronicles/OPT175B_Logbook.pdf at main · facebookresearch/metaseq](https://github.com/facebookresearch/metaseq/blob/main/projects/OPT/chronicles/OPT175B_Logbook.pdf?fbclid=IwAR1SYEN38IY9FvdnN2UQgCOLk0UrpQRj8eR5F6gsesSErC6rcQnCTDMz8GI)

[Lessons after a Half-billion GPT Tokens | Hacker News](https://news.ycombinator.com/item?id=40015185)

    Less is More in Prompts: Simplifying prompts often yields better results. Over-specifying can confuse GPT.
    LangChain is Unnecessary: A basic chat API suffices for most tasks; complex frameworks add unnecessary abstraction.
    Streaming API for Better UX: Variable-speed typed characters improve user experience significantly.
    Null Hypothesis Issues: GPT struggles with prompts asking for empty outputs when no relevant data is found.
    Context Window Limits: GPT's large input window is useful, but its output is limited to 4k tokens.
    Vector Databases Are Overrated: Embeddings and RAG (retrieval-augmented generation) are more suited for search tasks, not general use.
    Minimal Hallucination: Properly framed extraction tasks show low hallucination rates, making GPT reliable.

---

1. There are way too many premature abstractions. Langchain, as one of may examples, might be useful in the future but at the end of the day prompts are just a API call and it's easier to write standard code that treats LLM calls as a flaky API call rather than as a special thing.

2. Hallucinations are definitely a big problem. Summarizing is pretty rock solid in my testing, but reasoning is really hard. Action models, where you ask the llm to take in a user input and try to get the llm to decide what to do next, is just really hard, specifically it's hard to get the llm to understand the context and get it to say when it's not sure.

That said, it's still a gamechanger that I can do it at all.

3. I am a bit more hyped than the author that this is a game changer, but like them, I don't think it's going to be the end of the world. There are some jobs that are going to be heavily impacted and I think we are going to have a rough few years of bots astroturfing platforms. But all in all I think it's more of a force multiplier rather than a breakthrough like the internet.

IMHO it's similar to what happened to DevOps in the 2000s, you just don't need a big special team to help you deploy anymore, you hire a few specialists and mostly buy off the shelf solutions. Similarly, certain ML tasks are now easy to implement even for dumb dumb web devs like me. 

## Fine Tuning

[Finetune LLMs on your own consumer hardware using tools from PyTorch and Hugging Face ecosystem | PyTorch](https://pytorch.org/blog/finetune-llms/)

The LoRA method works by attaching extra trainable parameters into a model(that we will denote by base model).
