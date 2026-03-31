---
name: brand-guidelines
description: Apply personal brand guidelines to any artifact — websites, PPT decks, PDFs, Word docs, and more. This skill defines a complete brand system including color palette, typography, spacing, layout patterns, imagery direction, and content structure inspired by a modern speaker/strategist aesthetic. Use this skill whenever the user asks to create branded content, apply brand styling, build a personal website, create a branded deck or presentation, generate a branded PDF or one-pager, or anytime "brand", "branded", "on-brand", is mentioned in relation to document or artifact creation.
---


# Brand Guidelines
This skill defines a cohesive brand system for the author/bio. The aesthetic may be inspired by an elevated speaker/author website style — geometric accents, bold typography, warm energy pops, and generous whitespace — adapted for use across web, presentations, and print.


## Input
Use `AskUserQuestions` tool to clarify any information needed from the User.
- **Reference Site**:    Reference website or style they desire to emulate
- **Content Type**:      Website, PPT Deck, PDF, Word Doc, etc.
- **Brand Personality**: 3-5 adjectives describing the brand vibe (e.g., "bold, modern, professional")


## User Preferences
### Default Color Palette
If no provided reference color palette is provided, use the following default palette.

The palette pairs deep, trustworthy navy with energetic gold accents, grounded by warm neutrals. The gold is the signature accent — use it sparingly for maximum impact (CTAs, highlights, key data points, geometric accents).

| Token                | Hex       | Usage                                          |
|----------------------|-----------|------------------------------------------------|
| `--brand-navy`       | `#1B2A4A` | Primary text, headers, dark backgrounds        |
| `--brand-gold`       | `#FDD923` | Accent color, CTAs, highlights, geometric pops |
| `--brand-slate`      | `#4A5568` | Body text, secondary content                   |
| `--brand-warm-gray`  | `#F7F5F2` | Page backgrounds, light sections               |
| `--brand-white`      | `#FFFFFF` | Card backgrounds, contrast areas               |
| `--brand-charcoal`   | `#2D3748` | Footer, dark sections, overlays                |
| `--brand-light-gold` | `#FEF8C3` | Subtle accent backgrounds, highlights          |
