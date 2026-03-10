---
name: summarize
description: "Summarizes and Synthesizes Content based on the user intent and input. Use when the user needs to summarize content across different formats and sources.  This skill should be used when the user needs to perform summarization and synthesis of content, documents, chapters, sections, etc.  The user can provide direct content (text, images, videos, audio, etc.) or provide a local or remote URL to fetch content from."
---

# Summarize or Synthesize Content
Auto Summarization and Synthesis of Content, Documents, Chapters, Sections, etc.
Auto Synthesize across multiple contexts with sensible defaults.
Use the `AskUserQuestions` Tool to Clarify and improve on ambiguity for any information needed from the User.

## Workflow
1.  Echo Back identified User Intent and Input Arguements
2.  Always perform both Extractive Summarization and Abstractive Summarization.  For Extractive Sumarization, use the `extraction` skill to extract key information and insights from the content.
3.  Follow Links within the content, recursively summarizing and synthesizing as needed
4.  Identify any Key Ordering or Priorities that need to be Sequenced with Attention
5.  Perform Citations and Decision Explanation Rationale

###  Detect User Intent
1. Number Sources:   There may be muliple sources of content, so number them as [Source 1], [Source 2], etc.
2. Document Type:    (Text, Document, Remote URL, etc..)
3. Content Category: (Document Extension Type, Blog, Website, etc.)
4. Task Category:    User Set of (Tasks) to perform
5. Summarize Type:   Type of Summarization to be Performed
6. Synthesis:        Whether to perform synthesis across multiple sources and contexts

### Guidelines
The following are default guidelines to follow when performing summarization and synthesis.
The user may specify additional guidelines or override these guidelines as needed.
- Style: Preference for Brevity and Concise Summarization rather than Verbosity

### Output Format
The Output should always include:
- **Citations**: `- [N]: Citation Reference` in bullet form
- **Decision Rationale**: Explanation of the decisioning rationale based on the outcome for supportive justification reasoning.