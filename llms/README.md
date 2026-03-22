## Config

[ai-config/CLAUDE.md at master · dnouri/ai-config](https://github.com/dnouri/ai-config/blob/master/CLAUDE.md)

## Fine Tuning

[How to Fine-Tune LLMs in 2024 with Hugging Face](https://www.philschmid.de/fine-tune-llms-in-2024-with-trl)

[Chatting with Transformers](https://huggingface.co/docs/transformers/en/conversations)

[OpenPipe: Fine-Tuning for Developers](https://openpipe.ai/)

[Finetune LLMs on your own consumer hardware using tools from PyTorch and Hugging Face ecosystem | PyTorch](https://pytorch.org/blog/finetune-llms/)

The LoRA method works by attaching extra trainable parameters into a model(that we will denote by base model).

[dvgodoy/FineTuningLLMs101_ODSC_Europe2024](https://github.com/dvgodoy/FineTuningLLMs101_ODSC_Europe2024) - [FineTuningLLMs101.ipynb - Colab](https://colab.research.google.com/github/dvgodoy/FineTuningLLMs101_ODSC_Europe2024/blob/main/FineTuningLLMs101.ipynb)

[[2408.13296] The Ultimate Guide to Fine-Tuning LLMs from Basics to Breakthroughs: An Exhaustive Review of Technologies, Research, Best Practices, Applied Research Challenges and Opportunities](https://arxiv.org/abs/2408.13296)

## Evals

[A statistical approach to model evaluations \ Anthropic](https://www.anthropic.com/research/statistical-approach-to-model-evals)

[Frequently Asked Questions (And Answers) About AI Evals – Hamel’s Blog](https://hamel.dev/blog/posts/evals-faq/)

## Codellama

[Code Llama: Llama 2 learns to code](https://huggingface.co/blog/codellama)

[codellama - ollama](https://ollama.com/library/codellama:34b)

Formatting prompts:

- [code llama prompt template](https://huggingface.co/codellama/CodeLlama-7b-Instruct-hf/discussions/19)
- [model.py · codellama/codellama-13b-chat at main](https://huggingface.co/spaces/codellama/codellama-13b-chat/blob/main/model.py#L25-L36)

## Structured Output

Using the openai library and llama you can enforce that the response be valid json with response_format={ "type": "json_object" }. Hugely helpful.

## Agents

[anthropic-cookbook/patterns/agents at main · anthropics/anthropic-cookbook](https://github.com/anthropics/anthropic-cookbook/tree/main/patterns/agents)

[Building Effective AI Agents \ Anthropic](https://www.anthropic.com/engineering/building-effective-agents)

## Inbox

[Things we learned about LLMs in 2024](https://simonwillison.net/2024/Dec/31/llms-in-2024/) - [Things we learned about LLMs in 2024 | Hacker News](https://news.ycombinator.com/item?id=42560558)

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

---

[Tao on “blue team” vs. “red team” LLMs | Hacker News](https://news.ycombinator.com/item?id=44711306)

Blue team (generative/constructive) creates initial output while red team (critical/evaluative) finds flaws and weaknesses
- This pattern exists in mathematical proof creation vs checking, software development vs testing, and other domains
- LLMs may be better suited for red team roles due to their unreliability - unreliable contributors cause less damage when attacking than when defending

Fundamental asymmetry between offensive and defensive roles
- Defensive systems only as strong as weakest component - single vulnerability can compromise entire system
- Offensive systems benefit from multiple attack vectors - only need one successful approach
- This asymmetry suggests placing unreliable AI tools in red team roles minimizes potential damage

Testing philosophy and quality concerns dominate discussion
- Legacy codebases suffer when tests become source of truth but may document bugs as features
- Brittle tests slow development by requiring maintenance on every code change regardless of functional impact
- Many enterprise testing practices generate bureaucratic overhead without meaningful safety improvements
- Human review remains essential for distinguishing meaningful behavioral requirements from implementation artifacts

Economic and organizational dynamics shape AI adoption
- Organizations may use AI to accelerate low-value bureaucratic tasks rather than improve core outcomes
- Productivity gains often illusory when applied to pointless work that scales infinitely
- Capital allocation favors blue team AI applications despite red team potentially being more suitable
- Quality of AI assistance correlates with user expertise - top performers benefit while others produce lower quality work

[576 - Using LLMs at Oxide / RFD / Oxide](https://rfd.shared.oxide.computer/rfd/0576)

LLM use should be governed by company values, prioritized as: responsibility, rigor, empathy, teamwork, urgency
- humans bear responsibility for LLM-generated artifacts regardless of automation used
- urgency is explicitly deprioritized — many orgs get this backwards
- notably, "disclosure" of LLM use is not treated as a simple fix; it can itself erode trust by distancing the author from their work

LLMs as readers: high value, low risk
- excellent for summarization and Q&A over large documents
- privacy caveat: hosted models may train on uploaded docs by default (opt-out, not opt-in)
- should not substitute for reading where reading is socially expected (e.g. hiring evaluation)

LLMs as researchers: useful but hazardous at depth
- fine for lightweight search-replacement tasks
- deep research outputs can be confidently wrong; well-formatted ≠ accurate
- LLM-generated content now pollutes the web, so LLM-cited sources may themselves be hallucinations
- treat as a starting point, follow citation links, verify before sharing

LLMs as editors: good when used late in the writing process
- engage after document is already polished to preserve the author's voice
- sycophancy risk: LLMs over-praise and nudge toward wholesale rewrites if engaged too early

LLMs as writers: generally discouraged
- output is clichéd, recognizable, and signals intellectual disengagement to readers
- breaks the implicit social contract that writers have done more work than readers
- reader frustration compounds if LLM-generated prose contains subtle incoherence (no underlying "puzzle")
- Oxide-specific argument: their hiring selects for writers, so LLM-written prose is below the bar they know everyone can meet
- not an absolute rule, but the default should be your own voice
- this is arguably the most contested area in practice; many disagree about where the line is between "LLM-assisted" and "LLM-written"

LLMs as code reviewers: useful but not a human substitute
- good when targeted at specific issue types
- misses systemic/architectural issues; can generate nonsense suggestions

LLMs as debuggers: low expectations, occasional surprise
- useful as a "rubber duck" to prompt next questions
- should not displace collaborative debugging with colleagues
- anecdote: LLMs have debugged I2C issues from oscilloscope screenshots

LLMs as programmers: powerful but requires discipline
- effective even writing code from scratch (unlike prose, which needs polish first)
- most appropriate for experimental, auxiliary, or throwaway code
- production/shipped code requires proportionally more care
- anti-pattern: addressing code review comments via re-generation destroys iterative review
- engineer must self-review before sending LLM code to peers
- "gavage geese" metaphor: don't let LLMs feed unnecessary complexity into systems you then can't understand without them
- this is arguably underdiscussed — implicit LLM dependency on a codebase is a serious long-term risk

LLM mandates (anti-pattern): executive-mandated LLM use
- undermines autonomy and tool selection judgment
- explicitly rejected at Oxide

LLM shaming (anti-pattern): social policing of others' LLM use
- impractical as LLMs become infrastructure (search, etc.)
- framed as a dietary analogy: your personal choices don't license policing others'
- the analogy is charitable but slightly elides that LLM use can have externalities on collaborators in ways diet usually doesn't

LLM anthropomorphization (anti-pattern): giving LLMs personas
- creates false accountability — LLMs cannot be held responsible
- explicitly rejected at Oxide; references Shell Game podcast as cautionary example
