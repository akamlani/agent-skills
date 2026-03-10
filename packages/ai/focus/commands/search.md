---
command: search
---
# Search Command
Interactive search through codebase or documents with sensible defaults.
Use the `AskUserQuestions` tool to improve on ambiguity when not known.

## Workflow
The following is a suggestive workflow:
1. Determine directories and files to Exclude: (e.g., `.venv, __pycache__`)
2. Show commands to Execute as Read-Only (RO) Operation
3. Execute Shell Commands
4. Display Results

### Inputs
1. Ask for Search Pattern (required)
2. Ask for File Types to Include: (Default: `*.py *.ipynb`)
3. Ask for additional Directory Excludes: (Default: `.git .venv`)

## Validation Check
If results are extensive (>100 lines), summarize key findings and offer to:
- [ ] Show full results
- [ ] Further Filter by specific file patterns or directories
- [ ] Search with different patterns

<!--
    grep -ir "pattern" --include='*.py'
    --include='*.ipynb'
    --exclude-dir=.venv
    --exclude-dir=__pycache__ .
-->
