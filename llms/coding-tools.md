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
