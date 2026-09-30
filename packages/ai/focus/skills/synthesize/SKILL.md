---
name: synthesize
description: "Synthesize and aggregate information across multiple sources — documents, external URLs (including nested sub-pages/links), or pasted content. Cross-references best practices/patterns, diffs sources where topically comparable, identifies adoption maturity, gaps, and outstanding recommendations when applicable, illustrates mechanisms with pseudocode and per-source real code excerpts in a companion file, and diagrams a unified composite flow of how the different components could operate together. Use when the user asks to synthesize, aggregate, compare, cross-reference, or reconcile multiple documents/sources/URLs."
---
# Synthesis
Aggregate and cross-reference multiple sources into one coherent analysis — shared best practices, real divergences, and (where applicable) maturity, gaps, and outstanding recommendations.

## Workflow
1. **Resolve sources** — list and confirm what's actually in scope (documents, URLs, pasted content); ask the user if the request is ambiguous about which sources to include.
2. **Choose output mode** — ask the user whether the synthesis should be conversational or written to a report file.
3. **Gather content per source** — read documents directly; for a hosted URL, follow every in-scope sub-page, expander, and hyperlink rather than stopping at the top-level page (the same deep-crawl approach the `explain` skill's Deep-Research Guidelines already establish — reused here, not restated); for pasted/clipboard content, use what's already in the conversation.
4. **Build a per-source topic index** — before comparing anything, note what each source actually covers, so later comparisons are only made where sources genuinely overlap.
5. **Synthesize** — organize findings into the report structure below.
6. **Illustrate** — for each Aggregated Best Practice and each comparable Delta/Divergence entry, produce pseudocode and real code excerpt(s) per source (see Code Illustration Guidelines), written to the companion code-illustrations file (see Output Path) rather than inline.
7. **Deliver** — if written-file mode, write the report and (when there's at least one non-trivial mechanism) the companion file, and confirm both paths; if conversational mode, respond directly with the same structure, offering the code illustrations inline since there's no companion file to write to.

### Report Structure
- **Overview** — the sources being synthesized and what topic/question ties them together
- **Source Index** — table: source → what it covers → any maturity signal the source itself states
- **Aggregated Best Practices/Patterns** — cross-source practices, each citing which source(s) support it; reference the companion code-illustrations file (e.g. "see `examples.md#reflection-self-correction`") rather than embedding code inline
- **Delta / Divergences** — differences between sources, but only where two or more are genuinely comparable on a given topic (see Comparability Guidelines); explicitly say "not comparable" for sources that don't overlap enough to diff, rather than forcing one; reference the companion code-illustrations file the same way as Aggregated Best Practices
- **Unified Flow (Composite Diagram)** — one Mermaid flowchart synthesizing the stages/mechanisms already established above into a single hypothetical combined pipeline (see Unified Flow Guidelines below); a different diagram from the source-attribution diagram in Diagram Guidelines — this one shows *sequence/flow*, not just *sourcing*
- **Adoption Maturity** *(when applicable)* — prototype / pilot / production, per Maturity/Gaps/Recommendations Guidelines
- **Gaps** *(when applicable)* — open gaps across increasing complexity/maturity stages
- **Outstanding Recommendations** *(when applicable)* — improvements still open

### Comparability Guidelines
- Two sources are "comparable enough to diff" when they address the *same underlying mechanism, decision, or practice* — not merely the same broad domain or topic area.
- When comparable, state the delta concretely (what each source does differently, and why it matters) rather than a vague "these differ."
- When not comparable, say so plainly in Delta / Divergences (e.g. "Source A and C both cover retries, but at different layers — not a direct comparison") rather than silently omitting the pairing or forcing a false equivalence.

### Maturity/Gaps/Recommendations Guidelines
- These three sections only appear when applicable — don't force them when nothing in the sources supports them.
- Always separate two kinds of claims, clearly labeled:
  - **Stated** — the source explicitly says this (e.g. a doc that labels its own example "production-ready" or "experimental").
  - **Inferred** — the skill's own grounded assessment, based on what's described (e.g. "no maturity stated, but the lack of error handling/persistence suggests prototype-stage") — never present an inferred claim as if the source said it.
- Every Stated claim must be traceable to specific source text; every Inferred claim must state the concrete evidence it's based on.

### Code Illustration Guidelines
- Reuse `explain`'s Code Illustration Guidelines for the shared rules (pseudocode fenced ` ```pseudocode `, a short faithful real-language excerpt fenced with its actual language tag, never fabricated, skip both when a mechanism is trivial) — not restated here.
- The synthesis-specific addition: when an entry spans multiple sources (an Aggregated Practice supported by 3 sources, or a Delta comparing 2), give **each source's own excerpt separately, side-by-side under the same heading** — never merge multiple sources' code into one invented "composite" snippet. The comparison is the point; each real excerpt must stay attributable to the specific source it came from.
- One pseudocode sketch per heading is enough even when multiple sources are shown (pseudocode is meant to convey the shared shape); real code excerpts are per-source since that's exactly where they diverge.

### Unified Flow Guidelines
- Build the composite entirely from stages/mechanisms already established in Delta/Divergences and Aggregated Best Practices — never introduce a mechanism in this diagram that wasn't already discussed in prose elsewhere in the report.
- Every node must cite its source(s) in the label (e.g. `Validation (sqlglot)<br/>[source 4]`), so the diagram stays as traceable as the prose it's built from.
- Only combine mechanisms that are actually compatible/composable. Multiple self-correction checkpoints at genuinely different pipeline points (e.g. one before generation, one before execution, one after a failure) can coexist in one flow since each checks something different. **True alternatives** — two different answers to the *same* need (e.g. hosted tracing vs. self-hosted logging, or unconditional vs. on-demand context loading) — must be shown as a single decision point offering both options, never as if a real system would run both simultaneously.
- Explicitly label the diagram as a synthesized composite (a title line such as "Hypothetical unified pipeline — not any single source's actual implementation") so it's never mistaken for a real system observed in one of the sources.
- If the sources aren't pipeline-shaped enough to support a meaningful composite (e.g. they cover unrelated static facts rather than staged mechanisms), state that plainly and skip the diagram rather than forcing one.

### Output Path
- If the user specifies a destination path, use it as-is.
- Otherwise, default to `stores/artifact-lib/projects/{topic}/synthesized.md`, relative to the current repo root. Create the directory if it doesn't exist.
- `{topic}` is a short, all-lowercase, kebab-case slug of what's being synthesized (there's no single "project" name when sources are unrelated — slug the topic/question instead, e.g. `agent-memory-patterns`).
- **Companion code-illustrations file**: `stores/artifact-lib/projects/{topic}/examples.md`, same directory as `synthesized.md`, same `{topic}` slug. Create it only when there's at least one non-trivial mechanism to illustrate — an all-prose synthesis with nothing worth showing in code doesn't need one. If the user specifies a custom path for `synthesized.md`, put `examples.md` in that same directory instead, unless the user also names the companion file explicitly.

### Guidelines
- Ground every claim in what's actually in the sources; don't speculate about practices, adoption, or gaps that aren't actually present.
- **Filename constraint (written-file mode)**: keep output filenames short and all-lowercase (e.g. `synthesized.md`, `examples.md`), matching the convention `explain` already established — never a long or all-caps name.
- Reuse `explain`'s Diagram Guidelines (Mermaid, never a reserved word as a node ID) when a diagram clarifies source relationships — e.g. which sources feed which aggregated practice — rather than inventing a new diagramming convention.

### Validations
- [ ] Every source listed in scope was actually gathered (read/fetched), not just named
- [ ] Every aggregated best practice cites which source(s) support it
- [ ] Every delta is between genuinely comparable topics; non-comparable pairs are stated as such, not silently skipped or forced
- [ ] Stated and Inferred claims are never conflated — each is clearly labeled
- [ ] Maturity/Gaps/Recommendations sections appear only when applicable
- [ ] Output mode matches what the user chose
- [ ] Written-file mode: filename is short and all-lowercase, path matches the default unless the user specified otherwise
- [ ] Every non-trivial Aggregated Practice/Delta entry has pseudocode and/or real excerpts in the companion file, or a stated reason it's skipped
- [ ] Every real excerpt is attributed to its specific source and faithfully copied/adapted — never merged across sources into a fabricated composite
- [ ] The companion file is created only when it has real content, and `synthesized.md` itself stays code-free, cross-referencing it instead
- [ ] The Unified Flow diagram exists when the sources support one (or its absence is stated plainly, not silently skipped)
- [ ] Every node in the Unified Flow diagram cites its source(s), and true alternatives are shown as one decision point, never fabricated as running simultaneously
- [ ] The Unified Flow diagram is explicitly labeled as a composite, never presented as a real observed system
