---
id: good-enough-practices-scientific-computing
aliases: []
tags:
  - programming
  - software-development
  - data-science
  - data-engineering
---

Save & backup raw data

Self-explaining variable names (personal_name not name1) and standard missing-data codes (NA not -99)

Anticipate tables and use a unique identifier per record

Argument for keeping intermediate files vs a monolithic in-memory pipeline
- For (retention): saving intermediate files lets you rerun parts of the pipeline, revisit and improve specific steps, and share/understand/modify pieces; matters most for large data sets where re-transferring everything is costly
- Against (monolithic on-the-fly): may be appropriate when very little cleaning/processing is needed
- The authors come down clearly on retention

Include at least one usage example ("worth a thousand words") and reasonable parameter values

Meaningful names for functions and variables
- The greater a variable's scope, the more informative its name; loop counters can be i/j, major data structures cannot have 1-letter names

Do not comment/uncomment code to control behavior

[Good enough practices in scientific computing - file](https://journals.plos.org/ploscompbiol/article/file?id=10.1371/journal.pcbi.1005510&type=printable)

Overall framing: "good enough" vs "best" practices
- This paper is a deliberate downshift from the authors' earlier 2014 "Best Practices for Scientific Computing" paper, aimed at newcomers rather than people already computing heavily
- Inclusion criterion is empirical and pragmatic: a practice makes the list only if large numbers of researchers adopt it AND are still using it months later
- The second criterion (stickiness) is doing a lot of quiet work here — it's why code review, unit testing, and CI are excluded despite being genuinely valuable; the authors are optimizing for adoption, not correctness
- Target audience is narrow: solo researchers or a handful of collaborators, projects lasting days to months
- Recurring justification is "your future self" — the collaborator who benefits most from these practices is you in 3 months
- Commentary: the adoption-first philosophy is honest but has a cost — it risks teaching people a floor that they mistake for a ceiling; the "What we left out" section partly addresses this

Save the raw data (1a)
- Never overwrite raw data with cleaned versions; faithful retention enables re-running analyses end to end and recovering from mistakes
- Make raw files read-only or use spreadsheet protection so accidental edits are harder
- Exception: don't locally copy large stable databases — instead record the exact retrieval procedure, version number, and download date
- Commentary: read-only permissions are a cheap, high-leverage safeguard; this pairs naturally with the later point that raw data shouldn't need version control

Back up raw data in more than one location (1b)
- Off-site external drives, or cloud storage (S3, Google Cloud Storage, Azure) which are cheap and reliable
- Consult local IT or library, especially for large data sets needing incremental or specialized backup
- Commentary: this predates cheap ubiquitous cloud sync; the advice is sound but the "consult IT" framing feels dated for anyone comfortable with modern cloud tooling

Create the data you wish to see in the world (1c)
- Improve machine and human readability without doing aggressive filtering or adding external information
- Convert closed/proprietary formats to open ones: CSV for tabular, JSON/YAML/XML for non-tabular, HDF5 for structured data
- Use self-explaining variable names (personal_name not name1) and standard missing-data codes (NA not -99)
- Encode useful metadata into filenames while keeping them regular for pattern matching (2016-05-alaska-b.csv)
- Argument for open formats: they survive across time and computing environments
- Commentary: the "not to do vigorous filtering" caveat is important and easy to miss — this step is about representation, not judgment calls, which keeps the raw-to-clean pipeline auditable

Create analysis-friendly ("tidy") data (1d)
- Each column is a variable — don't cram two variables into one (split "male_treated"), store units separately ("3.4" not "3.4kg")
- Each row is an observation — gather wide-format data into long format
- Draws directly on Hadley Wickham's Tidy Data paper (ref 5)
- Commentary: tidy data is arguably the single highest-leverage idea here for anyone using R/pandas; it's the substrate that makes downstream tooling (dplyr, ggplot, groupby) work without friction

Record all steps used to process data (1e)
- Data manipulation is as much part of the analysis as the modeling; undocumented, it's unreproducible
- Best method is to write scripts for every processing stage — slow at first, pays off when new data arrive or for related projects
- Tools like OpenRefine give a GUI but still log every step automatically
- When manual/interactive steps are unavoidable (e.g. selecting an image region), at least capture the "what" (save boundary coordinates) even if not the "why"
- Commentary: the honest admission that scripting "feels frustratingly slow" is what makes this credible; the counterexample of interactive image selection shows they've thought about where pure scripting breaks down

Anticipate multiple tables and use a unique identifier per record (1f)
- Tidy data still isn't necessarily complete; you'll merge across tables (e.g. heart-rate table joined to a demographics table by subject ID)
- Use a consistent ID format across tables ("14025" not "14,025" or "014025")
- Give each record a unique, persistent key; use the same names/codes when two data sets refer to the same thing
- Commentary: this is basic relational-database thinking without saying "database"; the ID-formatting warning is exactly the kind of silent bug that eats hours

Submit data to a DOI-issuing repository (1g)
- Data is a research product like papers and just as citable/reusable
- Figshare, Dryad, Zenodo make work findable, usable, citable
- Two kinds of metadata: about the data set as a whole vs about the content within it
- Write the README for humans if humans are the audience; fill formal metadata if harvesters are
- Commentary: connects to the FAIR data principles (Findable, Accessible, Interoperable, Reusable), which the paper predates by a year or two but clearly anticipates

Argument for keeping intermediate files vs a monolithic in-memory pipeline
- For (retention): saving intermediate files lets you rerun parts of the pipeline, revisit and improve specific steps, and share/understand/modify pieces; matters most for large data sets where re-transferring everything is costly
- Against (monolithic on-the-fly): may be appropriate when very little cleaning/processing is needed
- The authors come down clearly on retention
- Commentary: this is the same tradeoff as memoization/caching in any pipeline — recompute cost vs storage cost; their "data are cheap" theme resolves it toward storage

Framing: are you doing software engineering?
- If you're writing tens of thousands of lines for hundreds of strangers, you're doing engineering; if a few dozen lines for yourself, you're not — but a few engineering practices still help
- Core realization: readability, reusability, and testability are all side effects of writing modular code (short, single-purpose functions with clear inputs/outputs)
- Commentary: reframing "engineering" as a spectrum rather than a binary is a nice rhetorical move that lowers the perceived cost of adoption

Explanatory comment at the start of every program (2a)
- Include at least one usage example ("worth a thousand words") and reasonable parameter values
- Commentary: this is the minimum-viable documentation they later say beats comprehensive docs nobody writes; a usage example doubles as a smoke test spec

Decompose programs into functions (2b)
- Functions no more than ~1 page (~60 lines), taking no more than 5–6 parameters, not referencing outside information
- Justification is human short-term memory (Miller's "magical number seven," ref 15)
- Functions also make code easier to test and troubleshoot
- Commentary: "should not reference outside information" is a quiet argument against global state / side effects — a real software-engineering principle smuggled in gently; the 60-line/6-parameter numbers are heuristics, not laws

Be ruthless about eliminating duplication (2c)
- Reuse functions instead of copy-paste; use data structures (lists) instead of many related variables (score = (1,2,3) not score1/score2/score3)
- Commentary: this is the DRY principle (Don't Repeat Yourself) from The Pragmatic Programmer (ref 12) without naming it

Search for and test well-maintained libraries (2d, 2e)
- Always look for existing libraries before writing your own (R's CRAN, Python's PyPI)
- But test libraries before relying on them
- Commentary: the "test before relying" caveat is underdeveloped — in practice this now also means pinning versions and worrying about supply-chain/maintenance risk, which the paper doesn't address

Meaningful names for functions and variables (2f)
- The greater a variable's scope, the more informative its name; loop counters can be i/j, major data structures cannot have 1-letter names
- Follow each language's naming conventions (net_charge in Python, NetCharge in Java)
- Tab completion means long names cost nothing to type
- Commentary: the scope-proportional-to-name-length rule is a genuinely good heuristic that's rarely stated this crisply

Make dependencies and requirements explicit (2g)
- Per-project, via a requirements.txt or a "Getting Started" README section
- Commentary: this is the seed of reproducible environments; modern equivalents (lockfiles, conda envs, Docker, uv) go much further, and "list your deps in a text file" is now clearly the floor not the ceiling

Do not comment/uncomment code to control behavior (2h)
- It's error-prone and blocks automation; use if/else statements instead
- Commentary: this maps to using configuration/parameters over code-editing — the same spirit as the later runall/controller-script idea

Provide a simple example or test data set (2i)
- Lets users (including you) run a "build-and-smoke test" to confirm known input gives known output
- Especially useful after "innocent" changes or when running on multiple machines
- Commentary: this is the paper's substitute for unit testing — a pragmatic minimum that captures much of the value at a fraction of the adoption cost

Submit code to a DOI-issuing repository (2j)
- Software is a research product; make it creditable
- Figshare and Zenodo issue DOIs; Zenodo integrates with GitHub
- Commentary: the Zenodo–GitHub integration is still the standard path for citable code releases today

Design projects so new collaborators can join easily (3, framing)
- "New collaborators" includes future-you returning to an idle project
- Three goals (from ref 16): easy local setup, easy task-finding, clear contribution process — plus making it easy to credit you

Create an overview / README (3a)
- Home-directory file with title, description, contact info, and an example or two of running tasks
- Also create a CONTRIBUTING file listing dependencies, install-verification tests, and guidelines
- Commentary: splitting README (what/why) from CONTRIBUTING (how to help) is standard open-source hygiene and worth adopting even solo

Create a shared to-do list (3b)
- A plain notes.txt/todo.txt, or GitHub/Bitbucket issues with labels like "low hanging fruit" for newcomers
- Commentary: issue trackers double as the "communication strategy" and the changelog rationale; the low-hanging-fruit label is a real community-building tactic

Decide on communication strategies (3c)
- Make explicit decisions about email lists, chat, video, docs, meeting notes — and which are public vs private
- Commentary: thin on specifics, but the point (decide once, up front) is the reusable lesson

Make the license explicit (3d)
- A LICENSE file covering software, data, and manuscripts; absence of a license means all rights reserved, not free reuse
- Recommends CC-0 or CC-BY for data/text; MIT/BSD/Apache for software
- Argument against non-commercial CC variants: they block legitimate reuse (e.g. a government-paid public-health report in a developing country)
- Argument against GPL: permissive licenses integrate more easily into other projects
- Commentary: the anti-NC argument is strong; the anti-GPL stance is a genuine values choice (integration ease over copyleft/share-alike guarantees) that not everyone will share — reasonable people prefer GPL precisely because it forces downstream openness

Make the project citable (3e)
- A CITATION file describing how to cite the project and its DOI-bearing artifacts
- Commentary: this has since been somewhat standardized as CITATION.cff, which
