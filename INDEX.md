# Index

> Auto-generated reference index. Do not edit manually.

## /
- `.env.template` — environment variable template for local configuration
- `.gitignore` — git ignore rules for the repository
- `AGENTS.md` — project overview, structure, setup commands, and skills inventory
- `CLAUDE.md` — Claude agent entry point; delegates to AGENTS.md
- `GEMINI.md` — Gemini agent entry point; delegates to AGENTS.md
- `LICENSE` — Apache-2.0 open source license
- `Makefile` — build targets for install, linking agents, and cleanup
- `README.md` — top-level project readme

## config/runtime/
- `runtime.env` — runtime environment variables: package names, plugin lists, dotfiles config

## docs/faq/
- `glossary.md` — definitions for Skill, SubAgent, and Hook concepts
- `resources.md` — curated links: skills standards, design patterns, plugins, tools

## packages/.claude-plugin/
- `marketplace.json` — local plugin marketplace registry listing all available packages

## packages/ai/focus/.claude-plugin/
- `plugin.json` — plugin manifest for the focus AI tasks package

## packages/ai/focus/commands/
- `search.md` — slash command for interactive codebase and document search

## packages/ai/focus/skills/extraction/
- `SKILL.md` — skill: extract structured information from documents, transcripts, or code
- `references/extraction.md` — Python reference for structured output using pandas

## packages/ai/focus/skills/summarize/
- `SKILL.md` — skill: summarize and synthesize content from text, URLs, or media

## packages/ai/focus/skills/synthesize/
- `SKILL.md` — skill: aggregate and cross-reference multiple sources, with deltas, maturity, gaps, recommendations, code examples, and a unified composite flow diagram

## packages/design/.claude-plugin/
- `plugin.json` — plugin manifest for the design branding and UI/UX package

## packages/design/skills/brand-guidelines/
- `SKILL.md` — skill: apply personal brand system to websites, decks, PDFs, and artifacts

## packages/dev/.claude-plugin/
- `plugin.json` — plugin manifest for the dev tools package (build, deploy, docgen, experiment); points `commands` at `./docgen/commands` and `skills` at `./docgen/skills` + `./build/skills`

## packages/dev/build/skills/explain/
- `SKILL.md` — skill: explain a repository's architecture, structure, lifecycle phases, design patterns, and conventions in detail, with Mermaid diagrams, pseudocode, and code excerpts

## packages/dev/build/skills/refactor/
- `SKILL.md` — skill: refactor code or documentation from various input sources (snippet/file/repo, doc pages/site/clipboard); handles version upgrades, framework migrations, language ports, and design-pattern refactors

## packages/dev/docgen/commands/
- `write-index.md` — slash command to generate a structured INDEX.md for the repo

## packages/dev/docgen/skills/write-agent/
- `SKILL.md` — skill: update and regenerate README.md, AGENTS.md, and CLAUDE.md

## packages/dev/docgen/skills/write-docstring/
- `SKILL.md` — skill: guided workflow for writing docstrings for functions and classes

## packages/finance/.claude-plugin/
- `plugin.json` — plugin manifest for the finance tools package

## packages/finance/skills/write-invoice/
- `SKILL.md` — skill: generate a client invoice as XLSX then convert to PDF
- `references/{name}_{client}_{date}.xlsx` — invoice XLSX template with placeholder fields

## packages/product/.claude-plugin/
- `plugin.json` — plugin manifest for the product tools package

## packages/product/commands/
- `prompt-gen.md` — slash command for meta-prompting: generate structured AI prompts interactively

## packages/product/workflows/skills/identify/
- `SKILL.md` — skill: brainstorm 8-10 current-state team workflows as AI candidates in a 7-column table

## packages/product/workflows/skills/prioritize/
- `SKILL.md` — skill: score candidate workflows High/Medium/Low on 3V (Value, Viability, Velocity)

## packages/research/.claude-plugin/
- `plugin.json` — plugin manifest for the research tools package

## packages/research/skills/futurism/
- `SKILL.md` — skill: explore future trends and signals in AI and emerging technologies

## toolkit/ai/hooks/
- `link_agents.sh` — shell script to symlink skills and commands into .claude/
- `verify_agents.sh` — shell script to verify agent symlinks match the toolkit source
