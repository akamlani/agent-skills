# Marp Syntax & CLI Reference

Cheat sheet for authoring and rendering Marp decks. See marp.app and github.com/marp-team/marp-cli for the canonical docs.

## Front-matter directives

Declared once in the YAML front-matter block at the top of the file (between `---` fences), applying to the whole deck unless overridden per-slide.

| Directive         | Values                          | Purpose                                          |
|-------------------|----------------------------------|---------------------------------------------------|
| `marp`            | `true`                           | Enables Marp processing for this file (required)  |
| `theme`           | `default`, `gaia`, `uncover`, or a custom `@theme` name | Base visual theme |
| `paginate`        | `true` / `false`                | Show slide page numbers                            |
| `size`            | `4:3`, `16:9`                    | Slide aspect ratio                                 |
| `backgroundColor` | any CSS color                    | Slide background color                             |
| `color`           | any CSS color                    | Default text color                                 |
| `class`           | e.g. `lead`                      | Applies a theme's predefined CSS class to slides   |
| `header`          | markdown/text                    | Persistent header on every slide                   |
| `footer`          | markdown/text                    | Persistent footer on every slide                   |

## Custom page sizes / portrait orientation

The `size:` front-matter directive only supports the two built-in presets (`4:3`, `16:9`) — both landscape. For anything else (a portrait one-pager, US Letter, A4, a specific pixel size), do **not** rely on `size:` — set the dimensions directly with CSS instead, and set them in **both** places below. Setting only `section` (the visible content box) is a common mistake: Chromium's print-to-PDF (which `marp-cli` uses for `--pdf`) determines the actual physical page size from the `@page` CSS at-rule, not from `section`'s width/height. Skipping `@page` silently produces a PDF at the default landscape size (13.33in × 7.5in) no matter what `section` says — the content looks squeezed into the wrong-shaped page rather than erroring.

```css
<style>
@page {
  size: 8.5in 11in;   /* physical PDF page geometry — required for --pdf output */
  margin: 0;
}
section {
  width: 8.5in;        /* content box — must match @page or content will be
  height: 11in;         mis-clipped/mis-centered relative to the actual page */
  box-sizing: border-box;
}
</style>
```

Always confirm the actual rendered PDF page size afterward (see "Verifying a render actually fits" below) rather than assuming the CSS took effect.

## Fitting dense content to a fixed page

A fixed-size page (a one-pager, a portrait cheat sheet) has no scroll — content that doesn't fit gets silently clipped or pushed off the bottom edge, not wrapped to a second page. Marp/Chromium give no build-time warning when this happens, so an overflow can go unnoticed unless the render is explicitly checked (see below).

When content doesn't fit, in this order of preference:
1. **Cut content first.** Trim to fewer items or shorter lines before touching font size — this is almost always the right lever, and it's what keeps the page legible.
2. **Increase the page size** if the content genuinely needs the room and a larger physical page is acceptable (e.g. move from Letter to Tabloid/A3, or from a single column to two columns).
3. **Shrink type only as a last resort, and stop well short of illegible.** Keep body/insight text at **9px or larger** and footnotes/citations no smaller than **7px** in the final rendered PDF — going below that produces a page that's technically "fitted" but not actually readable. If reaching for anything smaller, that's a signal to go back to step 1 and cut content instead.

Don't guess-and-check font sizes blindly across many render cycles — extract the actual text after a render (see below) so each adjustment is based on what's really missing, not a guess.

## Verifying a render actually fits (do this for every fixed-size/one-pager render)

CSS appearing correct in the source file does not guarantee the render matches — verify the actual output file every time:

```python
from pypdf import PdfReader
r = PdfReader("deck.pdf")
box = r.pages[0].mediabox
print(f"{len(r.pages)} page(s), {float(box.width)/72:.2f}in x {float(box.height)/72:.2f}in")
text = r.pages[0].extract_text()
# check every section heading / distinguishing phrase you authored is present,
# and that the text ends where your content is supposed to end (not mid-sentence)
```

Check for:
- **Page count and dimensions match what was requested** (e.g. exactly 1 page, exactly the intended width/height) — this is what catches the missing-`@page` mistake above.
- **Every authored heading/section appears in the extracted text** — a heading present in the source but absent from extracted text means that item was clipped off the page.
- **The extracted text doesn't end mid-sentence** relative to the last authored line — a truncated final sentence means overflow, even when the page count/dimensions look right.
- **No literal HTML tag text appears in the extracted content** (e.g. `<div class=...>` or a custom element's angle brackets showing up as visible text) — a sign the tag wasn't recognized as an HTML block by the markdown parser and got printed as text instead of used as a wrapper. Prefer standard tags (`div`, `span`, `p`) with a `class` over inventing custom element names — markdown-it's HTML-block detection reliably recognizes only known tags.

## Local directives (per-slide overrides)

HTML comments placed within a slide. A leading underscore scopes the directive to that slide only; without it, the directive applies to the current and all following slides.

```markdown
<!-- backgroundColor: black -->     (this slide and all following slides)
<!-- _backgroundColor: black -->    (this slide only)
<!-- _class: lead -->               (this slide only)
```

## Slide separator

A line containing only `---` starts a new slide. To use three dashes inside a code fence without splitting the slide, keep it inside the fenced block — Marp only treats a bare `---` line outside of code fences as a divider.

```markdown
# Slide 1

---

# Slide 2
```

## Background images

```markdown
![bg](image.jpg)             full-slide background
![bg fit](image.jpg)         fit within slide bounds, preserving aspect ratio
![bg left](image.jpg)        split layout, image on the left half
![bg right](image.jpg)       split layout, image on the right half
![bg left:33%](image.jpg)    split layout, custom width
![bg](a.jpg) ![bg](b.jpg)    multiple backgrounds, split evenly
```

## Math (KaTeX, via Marp Core)

```markdown
Inline: $E = mc^2$

Block:
$$
\int_0^\infty e^{-x^2} dx = \frac{\sqrt{\pi}}{2}
$$
```

## Code blocks

Standard fenced code blocks with a language tag get syntax highlighting:

````markdown
```python
def hello() -> None:
    print("hello")
```
````

## Speaker notes

An HTML comment that doesn't match a known directive is treated as a speaker note (visible in presenter mode, not on the rendered slide):

```markdown
<!-- Remember to mention the Q3 numbers here. -->
```

## Custom theme CSS

A custom theme is a CSS file (or an inline `<style>` block) with a `@theme` declaration naming it, then normal CSS targeting Marp's `section` selector (one `section` per slide):

```css
/* @theme my-custom-theme */

section {
  background-color: #ffffff;
  color: #1a1a1a;
  font-family: "Helvetica Neue", sans-serif;
}

section.lead {
  justify-content: center;
  text-align: center;
}
```

Reference it via the front-matter `theme: my-custom-theme` directive, and pass the CSS file to `marp-cli` with `--theme-set <path-to-css>` (or `--theme-set <directory>` for multiple theme files) so the CLI can resolve it at render time.

## marp-cli flags

| Flag                    | Purpose                                             |
|-------------------------|------------------------------------------------------|
| `-o, --output <file>`   | Output file path; extension determines format when no explicit format flag is given |
| `--pdf`                 | Force PDF output                                     |
| `--pptx`                | Force PowerPoint (PPTX) output                       |
| `--images png\|jpeg`    | Export each slide as a separate image                |
| `--theme-set <path>`    | Register a custom theme CSS file/directory           |
| `--watch`               | Re-render automatically on file changes              |
| `--server`              | Serve a live-reloading preview server                |

Typical invocation:

```
npx @marp-team/marp-cli@latest deck.md -o deck.pdf
```
