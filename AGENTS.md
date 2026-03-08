# agent-skills

Skills and configuration for AI coding agents used in AI-assisted development.

## Project Overview
- **Package**: `agent-skills`
- **Component Dir**: `toolkit/ai` — source of truth for agents, skills, commands, rules, hooks
- **Dotfiles**: cloned into `_build/dotfiles/` (separate repository); `.vscode` and `.github` are symlinked from there
- **Stores**: `stores/{contextlib,artifactlib,promptlib}` are symlinked from an Obsidian vault (`~/Dropbox/dev-vault/workspace`)

## Setup
```shell
make install         # core setup: dotfiles, vaultspace, directory structure, symlinks
make install_agents  # coding agent setup: creates .claude/, links skills/commands
```

## Key Structure
| Path | Purpose |
|------|---------|
| `toolkit/ai/skills/` | Source skill definitions (`SKILL.md` per skill) |
| `toolkit/ai/commands/` | Slash commands for AI agents |
| `toolkit/ai/rules/` | Coding rules and guidelines |
| `toolkit/ai/hooks/link_agents.sh` | Links skills/commands into `.claude/` |
| `.claude/skills/` | Symlinked skills (auto-generated, do not edit directly) |
| `stores/contextlib/` | Rules and style guides (obsidian vault) |
| `config/runtime/runtime.env` | Environment variables and runtime config |

## Development Best Practices
- Styling guidelines: `stores/contextlib/_rules/styles/`
- Makefile styling: `stores/contextlib/_rules/styles/styling-makefile.md`
- Typecheck after a series of code changes
- Run single tests rather than the full test suite
