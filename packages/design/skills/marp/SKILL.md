---
name: marp
description: 'Author and render Markdown-based slide decks/presentations using MARP (Markdown Presentation Ecosystem, marp.app) via @marp-team/marp-cli — a single Markdown file with YAML front-matter (marp true, theme, paginate, size, backgroundColor) and slides separated by three dashes, exported to HTML, PDF, PPTX, or PNG/JPEG. Use this skill whenever the user asks to create a slide deck, presentation, pitch deck, talk/conference slides, or mentions "Marp", "slides in Markdown", "convert markdown to slides/PPTX/PDF", or wants to render/export an existing Marp deck.'
---

# MARP Slide Deck Authoring & Rendering
This skill authors presentation decks as a single Markdown file using Marp conventions (front-matter directives, `---` slide dividers, local directives via HTML comments) and renders them to a final output format using `@marp-team/marp-cli` via `npx` — no persistent dependency install required.

## Input
Ask the user to clarify any information needed before authoring:
- **Topic / Audience**: What is the deck about, and who is the audience (internal team, conference, client pitch, etc.)?
- **Slide Count**:       Approximate number of slides / desired length (e.g. lightning talk vs. full deck)
- **Output Format**:     HTML, PDF, PPTX, or PNG/JPEG image(s) — default to PDF if unspecified
- **Page Orientation/Size**: Standard landscape (`16:9`/`4:3`) or a fixed/portrait size (e.g. a vertical one-pager)? A non-default size needs the custom-CSS approach in `references/marp-syntax.md`, not the `size:` directive
- **Theme Base**:        Use a built-in Marp theme (`default`, `gaia`, `uncover`) as a starting point, or a fully custom `@theme` block?
- **Speaker Notes**:     Should speaker notes be included as HTML comments per slide?

## Workflow Instructions
1. Confirm the inputs above with the user when uncertain.
2. Draft the deck as a single Markdown file:
   - Front-matter block at top (`marp: true`, `theme:`, `paginate:`, `size:`, `backgroundColor:`, `color:`, `class:` as applicable).
   - One slide per section, sections separated by `---` on its own line.
   - Use local directives (HTML comments, e.g. `<!-- backgroundColor: black -->` or `<!-- _class: lead -->`) to override front-matter per-slide.
   - See `references/marp-syntax.md` for the full directive/syntax reference (backgrounds, split layouts, math, code blocks, custom theme CSS).
   - Use `references/starter-deck.md` as a structural template for a new deck.
   - **For a fixed/portrait/one-pager size**: set `@page { size: <W> <H>; margin: 0; }` AND `section { width: <W>; height: <H>; }` together in a `<style>` block — see "Custom page sizes / portrait orientation" in `references/marp-syntax.md`. Setting only `section` silently produces a PDF at the wrong (default landscape) physical page size.
3. Save the authored deck to `stores/artifact-lib/projects/{project_name}/{deck_name}.md`.
4. Render the deck to the requested output format using the Bash tool:
   ```
   npx @marp-team/marp-cli@latest stores/artifact-lib/projects/{project_name}/{deck_name}.md -o stores/artifact-lib/projects/{project_name}/{deck_name}.<ext>
   ```
   Where `<ext>` is `html`, `pdf`, `pptx`, or `png`/`jpg` per the requested output format (use `--pdf`, `--pptx`, `--images png`, etc. flags as needed — see `references/marp-syntax.md` for the flag table). This is an ephemeral, isolated tool invocation via `npx` — no new dependency is added to the repo.
   - Requires Node.js/npx available on the host; if the render command fails because Node/npx is missing, tell the user rather than attempting to install anything.
5. **For any fixed-size/one-pager render**, verify the actual output before reporting success — see "Verifying a render actually fits" in `references/marp-syntax.md`: check the rendered page count/dimensions match what was requested, and that every authored heading/section appears in the extracted text (nothing clipped or cut off mid-sentence). If content overflows, cut content or enlarge the page before shrinking type below the readable floor (9px body / 7px footnote) — see "Fitting dense content to a fixed page" in the same reference.
6. Confirm the rendered output file exists and report its path back to the user.

## Output Format
- Source Markdown deck: `stores/artifact-lib/projects/{project_name}/{deck_name}.md`
- Rendered output:      `stores/artifact-lib/projects/{project_name}/{deck_name}.<ext>` (same directory, same base name, extension per requested format)

## Validation
- [ ] Front-matter is valid YAML and includes at minimum `marp: true`
- [ ] Slides are separated by `---` on its own line (not inside code fences)
- [ ] Requested output format was rendered and the output file was confirmed to exist
- [ ] For a fixed/portrait/one-pager size: `@page` and `section` dimensions were set together, and the rendered PDF's actual page count/dimensions were checked and match what was requested
- [ ] For dense/fixed-size content: every authored heading/section is present in the rendered output (nothing silently clipped), and body text is no smaller than 9px (7px for footnotes) — content was cut rather than shrunk further if it didn't fit
