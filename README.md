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
│   ├── commands/               # symlinked
│   └── skills/                 # symlinked
├── .github -> _build/dotfiles/.github
├── .vscode -> _build/dotfiles/.vscode
├── config/
│   └── runtime/
│       └── runtime.env         # environment variables and project configuration
├── docs/                       # project documentation
├── packages/                   # uv-agnostic Claude Code plugin packages
│   ├── .claude-plugin/
│   │   └── marketplace.json        # local plugin marketplace registry
│   ├── ai/
│   │   └── focus/
│   │       ├── .claude-plugin/plugin.json
│   │       ├── commands/search.md
│   │       └── skills/{extraction,summarize,synthesize}/
│   ├── design/
│   │   ├── .claude-plugin/plugin.json
│   │   └── skills/{brand-guidelines,marp}/
│   ├── dev/
│   │   ├── .claude-plugin/plugin.json   # single manifest; commands/skills point into subfolders
│   │   ├── build/
│   │   │   └── skills/{explain,refactor}/
│   │   ├── deploy/                      # placeholder — empty
│   │   ├── docgen/
│   │   │   ├── commands/write-index.md
│   │   │   └── skills/{write-agent,write-docstring}/
│   │   └── experiment/                  # placeholder — empty
│   ├── finance/
│   │   ├── .claude-plugin/plugin.json
│   │   └── skills/write-invoice/
│   ├── product/
│   │   ├── .claude-plugin/plugin.json
│   │   ├── commands/prompt-gen.md
│   │   └── workflows/
│   │       └── skills/{identify,prioritize}/
│   └── research/
│       ├── .claude-plugin/plugin.json
│       └── skills/futurism/
├── stores/
│   ├── artifact-lib/            # symlinked from obsidian vault
│   ├── context-lib/             # symlinked from obsidian vault (rules, styles, etc...)
├── toolkit/
│   └── ai/
│       └── hooks/
│           ├── link_agents.sh      # links skills/commands into .claude/
│           └── verify_agents.sh    # verifies agent links are correct
├── AGENTS.md                   # shared context for all AI coding agents
├── CLAUDE.md                   # Claude agent context (references AGENTS.md)
├── GEMINI.md                   # Gemini agent context (references AGENTS.md)
└── Makefile                    # setup and install automation
```

---
## Development Best Practices
- [ ] Guideline Styling Guidelines: `stores/context-lib/guidelines/rules`
- [ ] Artifact Storage: `stores/artifact-lib/projects/`
- [ ] Typecheck when complete making a series of code changes
- [ ] Run Single Tests rather than entire Test Suite
---
