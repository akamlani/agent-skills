---
name: refactor
description: "Refactor code or documentation from a variety of input sources — a snippet, function, class, module, or whole repository; a single doc page, many pages/directories, a hosted site to crawl, or pasted/clipboard content. Handles version upgrades/downgrades, framework migrations, language-binding ports, and design/strategy-pattern refactors. Use when the user asks to refactor, migrate, port, upgrade, downgrade, or restructure code or documentation."
---
# Refactor
Refactor code or documentation, gathered from whatever source the user provides, into a target shape while preserving behavior and intent.

## Workflow
1. **Resolve target type** — code or documentation. Ask via `AskUserQuestions` if not stated or not obvious from context.
2. **Resolve input source** — see Input Sources below; ask via `AskUserQuestions` when the user hasn't specified one.
3. **Gather content** — read local files, fetch/crawl remote URLs, or accept pasted/clipboard content directly (see Input Sources for how each is handled).
4. **Resolve the refactor operation** — see Code Operations / Documentation Operations below; ask via `AskUserQuestions` for the specific target (version, framework, language, or pattern) when not fully specified.
5. **Choose delivery mode** — ask via `AskUserQuestions` whether to apply changes directly to files, or produce a preview/diff first for review before applying.
6. **Execute** — perform the refactor per Guidelines: preserve external behavior/interfaces unless the operation explicitly changes them, stay scoped to what was asked, don't bundle unrelated cleanup.
7. **Verify** — for code, run any available tests/build/typecheck and confirm no regressions beyond what the refactor intends; for documentation, confirm links/formatting/structure still render correctly.
8. **Deliver** — summarize what changed (files touched, and why), and call out anything noticed but intentionally left unchanged (out of scope).

### Input Sources
**Documentation:**
- **Single page** — read the one file or fetch the one URL directly.
- **Many pages / directories** — walk the local directory tree, or fetch multiple pages from a site (see hosted server below).
- **Hosted server (remote URL to crawl)** — fetch the starting URL, then follow same-domain links within a reasonable, explicitly stated depth/breadth; never attempt an unbounded crawl. State the depth/page-count actually covered when delivering.
- **Clipboard** — there is no direct OS-clipboard read; treat "from clipboard" as content the user pastes into the conversation. If the user says "from clipboard" but hasn't pasted anything yet, ask them to paste it.

**Code:**
- **Snippet / function / class / module** — operate directly on the pasted code or the specific file/symbol named.
- **Repository** — survey the structure first (reuse the `explain` skill's survey approach when useful) before scoping a large refactor; confirm scope with the user if the repo is large and the request is ambiguous about how much of it is in scope.

### Code Operations
- **Version upgrade/downgrade** — identify the current version (lockfiles, manifests, imports) and the target version's breaking changes; apply the migration path between them, not just a version-string bump.
- **Framework migration** — map the source framework's primitives to the target framework's equivalents; preserve behavior, don't carry over source-framework idioms that don't translate.
- **Language-binding refactor** — port logic idiomatically into the target language's conventions, not a literal line-by-line transliteration.
- **Design/strategy-pattern refactor** — restructure the code to follow the named pattern while preserving existing external behavior/interfaces where reasonable; name the pattern being applied when delivering.

### Documentation Operations
- Apply a specified style guide/convention, restructure/reorganize content, consolidate duplication, or migrate content to a different format/platform — confirm which of these (or a combination) is intended before proceeding if the user's request doesn't already make it clear.

### Guidelines
- Preserve behavior/meaning unless the operation explicitly calls for a change (a version upgrade, a framework migration) — a refactor is not a rewrite.
- Stay scoped to what was asked; flag adjacent issues noticed along the way rather than silently folding them into the diff.
- Ground every change in what's actually in the source content — don't invent APIs, options, or structure that isn't there.
- For a repository-scale refactor, prefer several verified, reviewable changes over one sweeping unverified pass.

### Validations
- [ ] Target type (code/documentation) and input source were both resolved before gathering content
- [ ] The specific operation (version/framework/language/pattern, or doc operation) is concrete, not left implicit
- [ ] Delivery mode (direct apply vs. preview) matches what the user chose
- [ ] Behavior/meaning is preserved except where the operation explicitly changes it
- [ ] Changes are scoped to what was asked — no unrelated cleanup folded in
- [ ] Verification (tests/build/typecheck, or doc link/format check) was performed before declaring done
