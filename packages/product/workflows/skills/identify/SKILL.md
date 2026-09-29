---
name: identify
description: "Brainstorm 8-10 recurring team workflows, described as they exist today, that are candidates for AI automation or redesign, tied to a team's business priority and north star metric. Use whenever the user wants to find where AI could help their team, build an AI opportunity backlog, audit or map team workflows, or asks for 'candidate workflows', 'automation candidates', 'where should we use AI', or 'AI use cases for my team' — even if they never say 'workflow'. Produces a 7-column table; deliberately proposes no AI solutions."
---

# Workflow Candidates

Generates a broad, honest inventory of the workflows a team actually runs today, so that later steps (scoring, prioritizing, designing AI solutions) start from real work rather than from a technology looking for a problem.

## Why this skill stays out of solution-space

The value of a candidate list is that it describes current reality: who touches the work, what data it needs, and where it hurts. If AI solutions leak in, the list turns into a pitch and the friction gets underreported. So describe the workflow as a new hire would observe it. Do not say "AI could…", "automate", "agent", "copilot", or similar. Friction should be stated as a plain problem (slow, manual, inconsistent, error-prone), not as a missing capability.

## Inputs

Collect these four from the user. They are often given as unfilled template placeholders (e.g. `[TEAM OR FUNCTION]`) — treat unfilled brackets as missing.

1. **Team or function** — e.g. Customer Support, Revenue Operations, Finance.
2. **Biggest business priority this year**
3. **North star metric** the team is trying to move
4. **What the team does day to day** — 2-3 sentences

If any are missing, ask for them together in one message (use AskUserQuestion when available) rather than one at a time. If the user cannot supply the priority or metric, proceed with the team and day-to-day description and mark those assumptions explicitly in the output.

## Generating the candidates

Produce **8-10** workflows. Aim for breadth first, then trim. Sweep across these lenses so the list is not 10 variations of the same thing:

- **Recurring cadence work** — weekly/monthly/quarterly reporting, reviews, planning cycles
- **Information-heavy processes** — reading, triaging, or reconciling lots of documents, tickets, messages, or records
- **Multi-step handoffs** — work that passes between people or teams and stalls or loses context at each step
- **Quality and review steps** — approvals, QA, compliance checks, editorial or code-style review
- **Decisions that require synthesizing lots of data** — prioritization, forecasting, escalation calls, vendor or customer assessments
- **Intake and routing** — requests arriving through email, forms, or chat that someone must classify and assign
- **Knowledge upkeep** — documentation, FAQs, runbooks, onboarding material that goes stale

Ground each workflow in the team's stated day-to-day. Include at least a few that connect visibly to the stated priority and north star metric, but do not force every row to; some high-friction workflows matter even if the link is indirect. Use specific, concrete names (systems, artifacts, meetings) when the user has mentioned them; otherwise use realistic, typical ones for that function and say they are assumed.

## Output format

Open with one line restating the team, priority, and metric as understood (so the user can catch a misread). Then a single table with exactly these seven columns:

| Workflow Name | Description | Teams Involved | Data & Systems | Friction & Barriers | Priority / Metric Link | Frequency & Volume |
|---|---|---|---|---|---|---|

- **Workflow Name** — short, verb-led noun phrase (e.g. "Weekly pipeline review prep").
- **Description** — 1-2 sentences on how the workflow runs today: trigger, main steps, output, cadence.
- **Teams Involved** — the owning team plus every team that provides input, reviews, or receives the result.
- **Data & Systems** — the specific sources, tools, and artifacts touched (CRM, ticketing, spreadsheets, shared drives, BI dashboards, email/Slack).
- **Friction & Barriers** — what makes it slow, costly, or unreliable today: manual copy-paste, waiting on other teams, scattered or inconsistent data, judgment calls with no shared criteria, and so on. Be specific and honest; vague friction ("inefficient") gives the next step nothing to work with.
- **Priority / Metric Link** — how the workflow connects to the stated business priority and north star metric (direct, indirect, or none). Say "indirect" or "none" plainly rather than stretching a link.
- **Frequency & Volume** — how often it runs and how much it handles (e.g. "daily, ~200 tickets", "monthly, 4 people"). Mark figures as estimates when they are assumed.

Keep cells tight — a phrase or two of substance each, not paragraphs — so the table stays scannable.

After the table, add at most three lines: any assumptions made, an invitation to add, drop, or correct workflows, and a pointer that the `prioritize` skill can score this table next. Do not rank the workflows or suggest solutions unless the user asks for that as a follow-up.
