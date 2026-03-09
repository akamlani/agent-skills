# agent-skills
[![License](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-orange)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
[![X](https://img.shields.io/badge/X-@akamlani-blue?logo=x&logoColor=white)](https://x.com/akamlani)

Skills to be used via AI Agents in AI Coding Assistant IDEs.

---

*Quick links:* [Quick Start](#quick-start) · [Directory Structure](#directory-structure) · [Development Best Practices](#development-best-practices)

---
## Quick Start
### 1. Clone the Repository
```shell
git clone https://github.com/akamlani/agent-skills.git
cd agent-skills
```

### 2. Development Installation
```shell
# core setup for dotfiles, vaultspace, directory structure and symbolic links
make install
# coding agent specific setup and coding agent symbolic links
make install_agents
# clean up any files
make clean
```

---
## Directory Structure
```
agent-skills/
├── _build/
│   └── dotfiles/               # cloned dotfiles repo (separate repository)
├── .claude/
│   ├── commands/               # symlinked from toolkit/ai/commands
│   └── skills/                 # symlinked from toolkit/ai/skills
├── .github -> _build/dotfiles/.github
├── .vscode -> _build/dotfiles/.vscode
├── config/
│   └── runtime/
│       └── runtime.env         # environment variables and project configuration
├── docs/                       # project documentation
├── stores/
│   ├── artifactlib/            # symlinked from obsidian vault
│   ├── contextlib/             # symlinked from obsidian vault (rules, styles)
│   └── promptlib/              # symlinked from obsidian vault
├── toolkit/
│   └── ai/
│       ├── agents/             # AI agent definitions
│       ├── commands/           # slash commands for AI coding agents
│       │   └── tasks/
│       │       ├── search.md       # task search command
│       │       └── synthesize.md   # task synthesize command
│       ├── hooks/
│       │   ├── link_agents.sh      # links skills/commands into .claude/
│       │   └── verify_agents.sh    # verifies agent links are correct
│       ├── projects/           # project-level agent configurations
│       ├── rules/              # coding rules and guidelines
│       ├── settings.json       # agent settings
│       └── skills/             # reusable skill definitions
│           ├── data/
│           │   └── connectors/     # data connector skills (e.g., granola)
│           ├── docgen/
│           │   ├── write-agent/    # documentation generation skill
│           │   └── write-docstring/# docstring generation skill
│           ├── evals/              # evaluation skills
│           ├── product/
│           │   └── specs/
│           │       └── write-prd/  # product requirements document skill
│           ├── research/
│           │   └── futurism/       # research/futurism skill
│           └── tasks/
│               └── extraction/     # task extraction skill
├── AGENTS.md                   # shared context for all AI coding agents
├── CLAUDE.md                   # Claude agent context (references AGENTS.md)
├── GEMINI.md                   # Gemini agent context (references AGENTS.md)
└── Makefile                    # setup and install automation
```

---
## Development Best Practices
- [ ] Styling Guidelines: `stores/contextlib/_rules/styles/`
    - Python:   `stores/contextlib/_rules/styles/styling-python.md`
    - Frontend: `stores/contextlib/_rules/styles/styling-frontend.md`
    - Makefile: `stores/contextlib/_rules/styles/styling-makefile.md`
    - Blogs:    `stores/contextlib/_rules/styles/styling-blog.md`
    - Quotes:   `stores/contextlib/_rules/styles/styling-quotes.md`
- [ ] Typecheck when complete making a series of code changes
- [ ] Run Single Tests rather than entire Test Suite
---
