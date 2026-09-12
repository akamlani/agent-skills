---
description:   Generates a structured index file for the project repo with a file tree and one-line descriptors
argument-hint: [root_path] [output_file]
---

# Write Index
Generate a single `INDEX.md` file for this project repository containing a tree-based listing of all files, each annotated with a one-line description, for use as a navigational reference.

## Workflow
1. **Resolve root path** — default to the current working directory; use `root_path` argument if provided
2. **Discover files** — walk the repo tree, respecting `.gitignore` and excluding build artifacts (`_build/`, `node_modules/`, `.git/`, `__pycache__/`, `*.pyc`)
3. **Describe each file** — for each file, produce a concise one-line descriptor (≤ 12 words) summarizing its purpose, derived from its content or name
4. **Render tree** — output files in a hierarchical tree format grouped by directory, sorted alphabetically within each level
5. **Write output** — write to `output_file` (default: `INDEX.md` at repo root); overwrite if it already exists
6. **Confirm** — report total file count and output path on completion

## Output Format
```
# Index
> Auto-generated reference index. Do not edit manually.

## {directory/}
- `{file}` — {one-line descriptor}

## {directory/subdirectory/}
- `{file}` — {one-line descriptor}
```

## Constraints
- Exclude: `.git/`, `_build/`, `node_modules/`, `__pycache__/`, `*.pyc`, `*.pyo`, `.DS_Store`
- Include hidden files (dotfiles) that are tracked by git
- Descriptors must be factual, not promotional — derived from file content where readable
- Binary files (images, compiled artifacts) get descriptor: `binary asset`
- Symlinks are annotated with `→ {target}` appended to the descriptor
- Maximum descriptor length: 12 words

## Validation
- [ ] All git-tracked files are represented in the output
- [ ] No build artifacts or ignored files appear in the index
- [ ] Each entry has exactly one descriptor line (no blanks)
- [ ] Output file is valid Markdown that renders cleanly
- [ ] Symlinks are correctly identified and annotated
