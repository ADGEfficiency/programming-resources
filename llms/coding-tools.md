[Field Notes From Shipping Real Code With Claude - diwank's space](https://diwank.space/field-notes-from-shipping-real-code-with-claude)

Never let AI write tests

Tests are not just code that verifies other code works. Tests are executable specifications. They encode your actual intentions, your edge cases, your understanding of the problem domain. High performers excel at both speed and stability—there’s no trade-off. Tests are how you achieve both.

```
# CLAUDE.md - Julep Backend Service  

## The Golden Rule  
When unsure about implementation details, ALWAYS ask the developer.  

## Project Context  
Julep enables developers to build stateful AI agents using declarative  
workflows.  

## Critical Architecture Decisions  

### Why Temporal?  
We use Temporal for workflow orchestration because:  
1. Workflows can run for days/weeks with perfect reliability  
2. Automatic recovery from any failure point  

### Why PostgreSQL + pgvector?  
1. ACID compliance for workflow state (can't lose user data)  
2. Vector similarity search for agent memory  

### Why TypeSpec?  
Single source of truth for API definitions:  
- OpenAPI specs  
- TypeScript/Python clients  
- Validation schemas  

## Code Style and Patterns  

### Anchor comments  

Add specially formatted comments throughout the codebase, where appropriate, for yourself as inline knowledge that can be easily `grep`ped for.  

### Guidelines:  

- Use `AIDEV-NOTE:`, `AIDEV-TODO:`, or `AIDEV-QUESTION:` (all-caps prefix) for comments aimed at AI and developers.  
- **Important:** Before scanning files, always first try to **grep for existing anchors** `AIDEV-*` in relevant subdirectories.  
- **Update relevant anchors** when modifying associated code.  
- **Do not remove `AIDEV-NOTE`s** without explicit human instruction.  
- Make sure to add relevant anchor comments, whenever a file or piece of code is:  
  * too complex, or  
  * very important, or  
  * confusing, or  
  * could have a bug  

## Domain Glossary (Claude, learn these!)  

- **Agent**: AI entity with memory, tools, and defined behavior  
- **Task**: Workflow definition composed of steps (NOT a Celery task)  
- **Execution**: Running instance of a task  
- **Tool**: Function an agent can call (browser, API, etc.)  
- **Session**: Conversation context with memory  
- **Entry**: Single interaction within a session  

## What AI Must NEVER Do  

1. **Never modify test files** - Tests encode human intent  
2. **Never change API contracts** - Breaks real applications  
3. **Never alter migration files** - Data loss risk  
4. **Never commit secrets** - Use environment variables  
5. **Never assume business logic** - Always ask  
6. **Never remove AIDEV- comments** - They're there for a reason  

Remember: We optimize for maintainability over cleverness.  
When in doubt, choose the boring solution.  
```

But Pair Programming Mode requires more than just documentation. You need to actively guide the AI with what I call “anchor comments”—breadcrumbs that prevent Claude from wandering into the wilderness:

```
// AIDEV-NOTE: This component uses virtual scrolling for performance  
// See: https://tanstack.com/virtual/latest  
// Don't convert to regular mapping—we handle 10k+ items  

export function DataTable({ items }: DataTableProps) {  
  // Claude, when you edit this, maintain the virtual scrolling  
  ...  
}  
```

All projects should routinely ask Claude to look through the codebase changes, and add context to CLAUDE.md

---

We’re not trying to hide that we use AI—we’re trying to use it responsibly. Every commit message that includes AI work gets tagged:

```
# Our .gitmessage template  
# feat/fix/docs: <description> [AI]?  
#  
# [AI] - Significant AI assistance (>50% generated)  
# [AI-minor] - Minor AI assistance (<50% generated)  
# [AI-review] - AI used for code review only  
#   
# Example:  
# feat: add Redis caching to user service [AI]  
#  
# AI generated the cache implementation and Redis client setup.  
# I designed the cache key structure and wrote all tests.  
# Manually verified cache invalidation logic works correctl
```

---

Not all AI mistakes are equal. Here’s how we categorize them:

Level 1: Annoying but Harmless

    Wrong formatting (your linter will catch it)
    Verbose code (refactor later)
    Suboptimal algorithms (profile will reveal)

Level 2: Expensive to Fix

    Breaking internal APIs (requires coordination)
    Changing established patterns (confuses team)
    Adding unnecessary dependencies (bloat)

Level 3: Career-Limiting

    Modifying tests to make them pass
    Breaking API contracts
    Leaking secrets or PII
    Corrupting data migrations


[Claude Code Best Practices \ Anthropic](https://www.anthropic.com/engineering/claude-code-best-practices)

Setup and Customization
- Create CLAUDE.md files for repository instructions (bash commands, code style, workflows)
 - Can be placed in repo root, parent/child directories, or home folder
 - Use # key to add instructions directly to CLAUDE.md during sessions
 - Tune these files like prompts (e.g., adding emphasis with "IMPORTANT")

- Curate allowed tools list
 - By default, Claude requests permission for system modifications
 - Can customize via session prompts, /allowed-tools command, settings files, or CLI flags
- Install gh CLI for GitHub interactions

# Effective Workflows

Explore, plan, code, commit
- Have Claude read files before writing code
- Use thinking mode ("think" < "think hard" < "think harder" < "ultrathink")
- Ask for implementation only after planning

Write tests, commit; code, iterate, commit
- Tests provide clear targets for iteration
- Commit tests before implementation

Visual feedback loop
- Provide screenshots or visual mocks
- Have Claude take screenshots and iterate

Git and GitHub interaction
- Commit messages, complex operations, PR creation
- Issue triage and build fixes

Optimization Techniques
- Provide specific instructions
- Use images and diagrams when relevant
- Mention specific files using tab-completion
- Share URLs for additional context
- Course correct early and frequently
 - Ask for plans before coding
 - Use Escape to interrupt
 - Double-tap Escape to edit previous prompts
- Use /clear to reset context between tasks
- Create checklists for complex workflows
- Multiple ways to input data (copy/paste, pipe, bash)

Advanced: Multi-Claude Workflows
- Separate code writing from verification
- Use multiple repo checkouts to work on different tasks simultaneously
- Leverage git worktrees for lightweight parallel work
- Implement headless mode for automation
- Fan out for large migrations
- Pipeline for integration with existing processes

[Claude Code: Best practices for agentic coding | Hacker News](https://news.ycombinator.com/item?id=43735550)

Cost Control
- Be aware of the cache system (cache busts after 5-15 minutes of inactivity)
- Tell Claude to read specific files only
- Avoid letting it search through files unnecessarily
- Don't edit files manually during a session (including lint)
- Don't use /compact (busts cache)
- Keep files reasonably sized
- Have clear goals and keep sessions focused

Workflow Recommendations
- Use multiple checkouts of your repo to work on different tasks simultaneously
- Consider git worktrees
- Use Claude to interact with git
- Use /clear to keep context focused (though this permanently loses context)
- Create CLAUDE.md files for consistent instructions

Alternative Tools
- Aider: More precise control, typically cheaper
- Cursor/Windsurf: Fixed monthly cost
- Gemini 2.5 Pro: Much cheaper with comparable quality
- VSCode Copilot: Some users prefer its simplicity
- Plandex, Goose: Alternative agentic coding tools
