# agent-skills

Skills and configuration for AI coding agents used in AI-assisted development.

## Project Overview
- **Package**: `agent-skills`
- **Component Dir**: `toolkit/ai` — currently just `hooks/` (agent/link automation); skills and commands ship as `packages/` plugins instead (see [Skills Inventory](#skills-inventory))
- **Dotfiles**: cloned into `_build/dotfiles/` (separate repository); `.vscode` and `.github` are symlinked from there
- **Stores**: `stores/{artifact-lib,context-lib}` are symlinked from an Obsidian vault (`~/Dropbox/dev-vault/workspace`)

## Setup
```shell
make install         # core setup: dotfiles, vaultspace, directory structure, symlinks
make install_agent   # coding agent setup: creates .claude/, links skills/commands, installs plugins
make link_agents     # re-link skills/commands into .claude/ after changes
make verify_agents   # compare toolkit/ai vs .claude trees
make clean           # remove build artifacts
```

## Key Structure
See README.md's [Directory Structure](README.md#directory-structure) section for the full, current repo tree — not duplicated here.

## Skills Inventory
All skills ship as `packages/` plugins, not under `toolkit/ai/skills/` (which currently holds no skills — see [Key Structure](#key-structure)).

| Package | Skill | Description |
|---------|-------|-------------|
| `ai/focus` | `extraction` | Extract structured information from transcripts, documents, codebases, or web content |
| `ai/focus` | `summarize` | Summarize and synthesize content across formats and sources |
| `ai/focus` | `synthesize` | Aggregate and cross-reference multiple sources — deltas, maturity, gaps, recommendations, code examples, and a unified composite flow diagram |
| `design` | `brand-guidelines` | Apply personal brand guidelines to websites, decks, PDFs, and other artifacts |
| `design` | `marp` | Author and render Markdown-based slide decks via MARP (marp-cli) to HTML/PDF/PPTX/PNG |
| `dev/build` | `explain` | Explain a repository's architecture, structure, lifecycle phases, design patterns, and conventions in detail, with Mermaid diagrams, pseudocode, and code excerpts |
| `dev/build` | `refactor` | Refactor code or documentation from various input sources; handles version upgrades, framework migrations, language ports, and design-pattern refactors |
| `dev/docgen` | `write-agent` | Update/synchronize README.md, AGENTS.md, CLAUDE.md, GEMINI.md |
| `dev/docgen` | `write-docstring` | Guided workflow for writing docstrings for functions, classes, and modules |
| `finance` | `write-invoice` | Generate a client invoice (XLSX template → PDF) |
| `product/workflows` | `identify` | Brainstorm 8-10 current-state team workflows as AI automation/redesign candidates, tied to a business priority and north star metric |
| `product/workflows` | `prioritize` | Score candidate workflows High/Medium/Low on the 3V framework (Value, Viability, Velocity) and flag assumptions to validate |
| `research` | `futurism` | Explore future trends, drivers, and signals in emerging technologies |

Keep skills harness-neutral — describe *what* to ask the user; don't name harness-specific tools (e.g. `AskUserQuestion`).

## Commands
| Package | Command | Description |
|---------|---------|-------------|
| `ai/focus` | `search` | Interactive search through codebase or documents |
| `dev/docgen` | `write-index` | Generate a structured INDEX.md with a file tree and one-line descriptors |
| `product` | `prompt-gen` | Generate a prompt from user criteria via meta-prompting |

## Development Best Practices
See README.md's [Development Best Practices](README.md#development-best-practices) section — not duplicated here.
