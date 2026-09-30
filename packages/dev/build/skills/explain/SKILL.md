---
name: explain
description: "Explain a technical repository in detail — architecture, structure, purpose, key modules, entry points, data flow, lifecycle phases/stages (e.g. pre-process/processing/post-process, or indexing/retrieval/re-ranking/generation/self-correction), design patterns (language-, framework-, or technology-specific, e.g. workflow/supervisor/swarm), and conventions, illustrated with visual diagrams, pseudocode, and real code excerpts; for documentation targets, always follows sub-pages, expanders, and in-scope hyperlinks rather than stopping at one top-level page. Use when the user asks to understand, explain, walk through, or get oriented in a codebase or repo."
---
# Codebase Explanation
Produce a detailed, accurate explanation of a repository's architecture, structure, and conventions, illustrated with diagrams.

## Workflow
1. **Resolve scope** — default to the whole repository; if the user names a specific package or directory, scope the explanation to it.
2. **Choose output mode** — ask the user whether the explanation should be conversational (answered directly in the conversation) or written to a report file.
3. **Survey the repository or page** — read `README.md`, `AGENTS.md`, and `INDEX.md` when present for structural context; walk the source/package directories; identify entry points, key modules, dependencies, and conventions. For a documentation page (or pages), always research and extract content from every sub-section, expander/collapsible section, hyperlink, and resources/references link on the page too — never stop at the top-level visible text (see Deep-Research Guidelines below).
4. **Synthesize** — organize findings into the report structure below.
5. **Diagram** — build the diagrams called for below directly from what was found in step 3, using Mermaid syntax in fenced ` ```mermaid ` code blocks.
6. **Deliver** — if written-file mode, write the report (prose + diagrams) to the target path (see Output Path) using a short, all-lowercase filename (see Guidelines) and confirm its path; if conversational mode, respond directly with the same structure, including the diagrams inline.

### Report Structure
- **Overview** — what the repository is and what problem it solves
- **Architecture** — how the major pieces fit together, with a **component diagram** (Mermaid `graph`/`flowchart`) showing packages/modules and their relationships
- **Key Directories/Packages** — purpose of each top-level area, with a **directory tree diagram** (Mermaid `graph` top-down, or a fenced plain-text tree if the layout is deep/wide enough that a graph would be unreadable)
- **Entry Points** — where execution/usage starts
- **Data Flow / How Pieces Connect** — how components interact, with a **sequence or flow diagram** (Mermaid `sequenceDiagram` for a request/invocation lifecycle, or `flowchart` for a pipeline) tracing at least one real, concrete path through the system
- **Lifecycle Phases** — the domain-appropriate stage taxonomy this component actually follows (see Lifecycle Guidelines below), with a **stage diagram** (Mermaid `flowchart LR`, stage → stage) when not already visible in the Data Flow diagram, and pseudocode + a real code excerpt per stage (see Code Illustration Guidelines below)
- **Design Patterns** — patterns actually exhibited in the code, not a generic patterns catalog; see Design Patterns Guidelines below, and pseudocode + a real code excerpt per pattern (see Code Illustration Guidelines below)
- **Conventions** — coding, naming, or structural patterns the repo follows
- **Dependencies** — key external libraries/services and why they're used
- **Getting Started** — how a newcomer would run or explore the project

### Output Path
- If the user specifies a destination path, use it as-is.
- Otherwise, default to `stores/artifact-lib/projects/{project_name}/explained.md`, relative to the current repo root (the repo the skill is running in — not the target repo when explaining an external/cloned one). Create the directory if it doesn't exist.
- `{project_name}` is a short, all-lowercase, kebab-case slug of the repository being explained (e.g. `LangGraph-Agentic-RAG` → `langgraph-agentic-rag`); when scoped to a specific package/directory (per Resolve scope), slug that name instead of the whole repo's.
- When explaining an external repo (cloned or fetched for this purpose), still write the report under the current repo's own `stores/artifact-lib/projects/{project_name}/` — never inside the temporary clone.

### Deep-Research Guidelines
- Never treat a single top-level page as the full source — always identify and follow every sub-page, expander/collapsible section, tab, hyperlink, and resources/references link the page itself points to that's actually relevant to the scope, and fetch/read each one before synthesizing.
- This applies recursively but boundedly: follow links that are clearly part of the same documented feature/system (e.g. a tutorial's own sub-pages, an API reference it links to for a type it uses), not the entire site — state which links were followed and which were deliberately out of scope (e.g. unrelated marketing pages, a changelog) when delivering.
- When a page organizes content behind expanders/tabs/accordions (e.g. "show me the Python version" vs. other languages, or a collapsed "advanced" section), extract every one relevant to the scope — don't stop at whichever variant renders open by default.
- If a fetch is truncated, paywalled, or a fetching tool declines to reproduce content verbatim, say so plainly (as already required by Guidelines below) rather than silently working from only the top-level page.
- When multiple pages/sections describe the same overall system (e.g. an overview page plus several worked-example sub-pages), synthesize them into one cohesive explanation rather than one shallow pass per page — cross-referencing between them where they cover the same mechanism from different angles.

### Lifecycle Guidelines
- Identify the domain-appropriate stage taxonomy for the component being explained — this varies by domain; examples (not exhaustive, not mandatory):
  - **Generic processing pipeline**: pre-process → processing → post-process
  - **RAG/retrieval systems**: indexing → retrieval → (re-ranking) → generation → (self-correction/reflection)
  - **ML training pipeline**: ingestion → feature engineering → training → evaluation → deployment/serving
  - **Web request lifecycle**: request → middleware/auth → routing → handler → response
  - **Build/CI pipeline**: lint → build → test → package → deploy
  - **Agent orchestration**: planning → tool selection → execution → verification → response
- Only list stages actually implemented — never pad in a canonical stage that isn't really there (e.g. don't claim "re-ranking" exists if the code never re-ranks).
- Cite each stage to the specific file/function/class that implements it, same evidentiary bar as Design Patterns.
- If the scope contains multiple distinct components/subsystems with different lifecycles (e.g. an ingestion pipeline and a separate serving pipeline), identify each one's stages separately rather than forcing one lifecycle across unrelated parts.
- When a stage's mechanism is already shown in the Data Flow or Design Patterns diagrams, reference it rather than re-diagram (stages and patterns often overlap — e.g. a self-correction stage is also a reflection pattern; explain it once and cross-reference, don't duplicate).

### Code Illustration Guidelines
- For any mechanism being explained — most essentially each **Lifecycle Phases** stage and each **Design Patterns** entry, but applicable anywhere else in the report a mechanism is described (Architecture, Data Flow) — include two short illustrations:
  1. **Pseudocode** — a brief, language-agnostic sketch (fenced ` ```pseudocode `) of the mechanism's shape/algorithm, useful to a reader unfamiliar with the source language.
  2. **Real code excerpt** — a short snippet (fenced with the actual language tag, e.g. ` ```python `) copied/adapted faithfully from the source — never fabricated, always traceable to the file already cited for that stage/pattern.
- Keep both short: the minimal illustrative excerpt (a few lines — the function signature and core logic, not a full file dump).
- When explaining a documentation page rather than a repository (no local source to excerpt from), use the code example(s) already present on the doc page itself as the real-code illustration; still add pseudocode when the doc page is prose-only for a given mechanism.
- If a mechanism is trivial enough that prose alone is clearer (e.g. "a one-line import"), pseudocode/code excerpts are optional — don't force both for every single bullet, but default to including them for anything non-trivial.

### Design Patterns Guidelines
- Identify patterns actually exhibited by the code — never list a pattern just because it's common in the ecosystem; every pattern named must be traceable to specific files/classes/functions.
- Patterns can come from several levels — cover whichever actually apply, and name the level alongside each one:
  - **Language-binding-specific** — idioms native to the language itself (e.g. Python context managers/decorators, a Go `interface` satisfied implicitly, JS/TS higher-order functions).
  - **Classic software design patterns** — GoF-style patterns (factory, strategy, observer, decorator, dependency injection, singleton, adapter, etc.).
  - **Framework-specific** — patterns the framework itself imposes or encourages (e.g. middleware chains, providers/DI containers, hooks/lifecycle methods, ORM active-record vs. repository).
  - **Technology/domain-specific** — patterns from the specific technology domain in play, e.g. for agentic/LLM systems: workflow (fixed pipeline), supervisor (a coordinating agent delegating to sub-agents), swarm (peer agents handing off to each other), router, reflection/self-correction loop (as seen in RAG-style grade-and-retry systems); for distributed systems: pub/sub, event sourcing, CQRS, circuit breaker; for web backends: repository, unit of work, request/response middleware.
- For each pattern named, cite where it's implemented (file/class/function) and briefly explain the mechanism in the actual code — not the textbook definition.
- If a diagram already drawn under Architecture or Data Flow illustrates the pattern well, reference it instead of re-diagramming; only add a new diagram here when a pattern's structure isn't already visible in an existing one.
- If no clear, real pattern is exhibited, say so plainly rather than forcing a label onto the code.

### Diagram Guidelines
- Every diagram must reflect real structure discovered in step 3 — never invent components, edges, or steps that aren't in the code.
- Use Mermaid (`graph`/`flowchart`, `sequenceDiagram`, `classDiagram`, `erDiagram`) since it renders natively in GitHub-flavored Markdown and Claude Artifacts — no external tools or image generation.
- Keep each diagram scoped to one concern (don't cram architecture, data flow, and directory structure into a single diagram) and legible at a glance — collapse deep/repetitive substructure into a single labeled node rather than drawing every leaf file.
- At minimum, include a component/architecture diagram and a data-flow diagram; add a directory-structure diagram only when the tree itself is a key part of understanding the repo (e.g. a monorepo with a non-obvious package layout); add a lifecycle/stage diagram (`flowchart LR`) when the component follows a recognizable staged pipeline and that staging isn't already obvious from the data-flow diagram.
- In conversational mode, still emit the Mermaid fences as-is — most Claude Code surfaces render them; note in-line if the current surface doesn't render Mermaid.
- Never use a Mermaid reserved word as a node ID (`graph`, `end`, `subgraph`, `class`, `click`, `style`, `linkStyle`) even when it matches a real file/module name (e.g. a `graph.py` module) — pick a distinct ID (e.g. `graphmod`) and keep the real name in the node's label text instead. This is a common source of silent parse failures.

### Guidelines
- Treat `INDEX.md` as a helpful input when present — not a required dependency.
- Ground every claim in what's actually in the repo; don't speculate about functionality that isn't there.
- **Filename constraint (written-file mode)**: keep the output filename short and all-lowercase — no verbose or all-caps names (e.g. use `explained.md`, not `LANGGRAPH_AGENTIC_RAG_EXPLAINED.md`). Prefer a plain, fixed name like `explained.md`; if the destination directory could hold reports for more than one repo, a short lowercase slug is fine (e.g. `<repo-slug>.md`), but never a long descriptive phrase.

### Validations
- [ ] Every major top-level directory is addressed
- [ ] Entry points are identified
- [ ] No fabricated claims about functionality not present in the code
- [ ] Output mode matches what the user chose
- [ ] At least one architecture/component diagram and one data-flow diagram are included
- [ ] Every diagram reflects real, discovered structure — no invented components or edges
- [ ] Written-file mode: filename is short and all-lowercase
- [ ] Written-file mode: path matches the default (`stores/artifact-lib/projects/{project_name}/explained.md`) unless the user specified otherwise
- [ ] Every named design pattern is traceable to specific code, with its level (language/classic/framework/technology) identified
- [ ] If no real pattern is exhibited, that's stated plainly rather than a pattern being forced onto the code
- [ ] Lifecycle phases identified are domain-appropriate for this specific component, not a generic template forced onto it
- [ ] Each lifecycle stage is cited to specific code, and stages not actually implemented are omitted rather than assumed
- [ ] Each non-trivial Lifecycle Phase stage and Design Pattern includes pseudocode and/or a real code excerpt (or a stated reason it's skipped)
- [ ] Every real code excerpt is a faithful, traceable copy/adaptation from the cited source — never fabricated
- [ ] For a documentation-page target: sub-pages, expanders/tabs, and in-scope hyperlinks/resources were actually followed and read, not just the top-level page — and anything skipped is stated, not silently omitted
