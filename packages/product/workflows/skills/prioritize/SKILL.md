---
name: prioritize
description: "Prioritize a list of candidate workflows with the 3V framework — score each High/Medium/Low on Value (ROI), Viability (can we actually build and run it), and Velocity (how fast a minimum viable pilot shows results) — then flag assumptions to validate with the team. Use whenever the user has a workflow table (especially the output of the identify skill) and wants to prioritize, rank, score, triage, or pick which AI automation candidates to pursue first, or mentions '3V', 'value viability velocity', or 'where do we start'. Use it even if they only say 'which of these should we do first?'."
---

# Workflow Prioritization (3V)

Scores each candidate workflow on three dimensions so a team can pick where to start. It is the follow-on to `identify`, which produces the input table.

## Input

A table of workflows — typically the seven-column output of `identify` (Workflow Name, Description, Teams Involved, Data & Systems, Friction & Barriers, Priority / Metric Link, Frequency & Volume). Older five-column tables, partial tables, and bulleted lists work too; score from whatever columns are present. Also pick up the team's business priority and north star metric if they appear earlier in the conversation; they sharpen the Value score.

If the user's message contains an unfilled placeholder such as `{Identified Workflows}` or no table at all, look for a table earlier in the conversation; if none exists, ask for it. Don't invent workflows.

## The three dimensions

Score each **High / Medium / Low**. Every dimension is oriented so that **High is always the good outcome** — High Viability means easy to pull off, not hard. Mixing directions is the most common way these scorecards turn into nonsense.

**Value — how much ROI could this generate?**
Weigh time saved, cost reduced, cycle-time compression, and downstream effects on other workflows (does fixing this unblock or improve others?). Weight it by the team's stated priority and north star metric when known: a workflow that moves the metric outranks one that merely saves hours.
- High: large recurring effort or delay, touches the north star metric, or unblocks other workflows
- Medium: real but contained savings, or an indirect link to the metric
- Low: small, infrequent, or isolated benefit

**Viability — do we have what it takes?**
Weigh engineering lift, number of teams that must coordinate, whether the data sources are accessible and consistent (or conflict), and how standardized the process is today. A process that runs differently every time is hard to improve no matter how good the tooling.
- High: few teams, clean accessible data, a stable repeatable process, light engineering
- Medium: some integration or coordination work, or partly inconsistent data/process
- Low: many teams, conflicting or siloed data, ad-hoc process, or heavy engineering

**Velocity — how fast could we see results?**
Judge the *smallest pilotable version* — a minimum viable prototype — not the finished solution. A workflow with a huge end-state can still be High Velocity if a thin slice can be tried in weeks on real work.
- High: a thin pilot is possible in weeks with existing access and a willing owner
- Medium: a pilot needs a couple of months or some setup first
- Low: nothing meaningful can be tested until major prerequisites are done

## Scoring approach

1. Read each row's Teams Involved, Data & Systems, and Friction & Barriers — they are the evidence for Viability and Velocity. Priority / Metric Link and Frequency & Volume are the primary evidence for Value; Description and friction inform it too.
2. Score relative to the rest of the list. If everything comes out High, the scorecard can't help anyone choose; spread the scores so distinctions are real, while staying honest about the evidence.
3. Where the table doesn't give enough information to score a dimension (a missing column, no volume figures), make a reasonable call and record the assumption (see below) rather than stalling or silently guessing.

## Output format

A single table with exactly these four columns, one row per workflow, in the order given:

| Workflow Name | Value (H/M/L) | Viability (H/M/L) | Velocity (H/M/L) |
|---|---|---|---|

Cells contain only `H`, `M`, or `L`.

Follow the table with an **Assumptions to validate with your team** list. Make each item specific and tied to a workflow and dimension, and say what would change the score — for example, "Weekly pipeline review prep (Viability = M): assumed CRM and finance spreadsheet totals reconcile; if they routinely conflict, this drops to L." Cover the scores that rest on the thinnest evidence: data quality and access, real effort/volume figures behind Value, engineering capacity, and cross-team willingness. Keep it to the assumptions that could actually flip a score — at most 8 items; merge related ones (e.g. one item for a shared data source) rather than listing each workflow separately.

Do not add a ranking, recommendations, or solution design unless the user asks; they can request a "top picks" pass as a follow-up.
