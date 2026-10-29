---
name: document-session
description: Documents the current Copilot CLI session as a worklog Markdown note in the user's Obsidian vault. Use when the user asks to "document this session", "write up what we did", "save this to my vault/notes", or wants a worklog, runbook, or summary of the work performed in the current session.
---

# Document Session

Write a worklog Markdown note summarizing the current session and save it
into the user's Obsidian vault. Each note also carries a machine-readable
summary layer (frontmatter fields + `## AI Summary`) so a future AI agent can
synthesize work across all notes.

## Vault location

Save notes to:

```
/home/santosj/Dev/obsidian_vault/PG/notes
```

If that directory does not exist, ask the user for the correct path before
writing. Do **not** create a new vault directory silently.

## Filename

- Derive a short, descriptive kebab-case slug from the session's main topic
  (e.g. `thanos-rollback`, `sqlexporter-vm-backup`).
- Prefix with an ISO date: `YYYY-MM-DD-<slug>.md`.
  - Example: `2026-08-19-thanos-rollback.md`.
- If a file with that name already exists, ask the user whether to overwrite,
  append, or pick a new name.

## Reconstructing the session

Base the note on the **actual session history** (what the user asked, what you
investigated, commands you ran, and their outcomes). Do not invent steps.

If earlier parts of the session are no longer in context (e.g. after
compaction), recover them with `session_store_sql` filtered by the current
session id:

- `turns` — user requests and assistant responses
- `session_files` — files created/edited
- `session_refs` — commits, PRs, issues referenced

## Session type

Classify the session before writing; it drives which sections apply and the
AI Summary values:

| `session_type`  | Typical shape                                  |
|-----------------|------------------------------------------------|
| `incident`      | Something broke; diagnose and mitigate         |
| `change`        | Deliberate modification (deploy, config, code) |
| `investigation` | Read-only digging to answer a question         |
| `research`      | Learning / comparing options, no system touch  |
| `brainstorm`    | Ideation / design discussion                   |
| `setup`         | Tooling, environment, or workstation config    |

## Template

Omit any body section that doesn't apply (e.g. no `## Commands` for a
brainstorm). **Never omit `## AI Summary` or its frontmatter fields** — use the
`n/a` conventions below instead.

```markdown
---
date: YYYY-MM-DD
tags: [session, copilot-cli, <topic-tags>]
cwd: <cwd of the session>
session_id: <current session id>
session_type: incident|change|investigation|research|brainstorm|setup
outcome: success|partial|failed|n/a
impact_level: none|low|medium|high
impact_scope: [<systems/repos/clusters/subscriptions touched>]
---

# <Title of the work>

## AI Summary
- **What:** One or two sentences on what was done.
- **Why:** The trigger or motivation.
- **Impact:** Concrete effect (systems changed, risk reduced, time saved,
  decision made). Use `n/a — <reason>` when nothing was affected.
- **Skills/areas:** Comma-separated domains exercised (e.g. kubernetes,
  thanos, azure-networking, skill-authoring).

## Context / Problem
Brief description of what triggered this session and the goal.

## Environment
Relevant context: repo/cwd, cluster/kube-context, Azure subscription,
namespace, branch — whatever applies. Omit rows that don't apply.

## Steps Taken
Numbered, chronological, runbook-style account of what was done and why. Reference the
commands used at each step.

## Flow
Diagram of the multi-step flow, sequence, or decision logic (only when the
work involves one). Prefer tree, then ASCII, then simple arrow diagrams.

## Commands
Fenced code blocks of the key **reusable** commands, grouped logically.
Steps Taken references them; don't duplicate one-off commands here.
Redact any secrets/tokens.

## Outcome
What the end state is. What worked, what was verified.

## Follow-ups / TODO
Open items, risks, or next actions. Use `- [ ]` checkboxes.

## References
Links, PRs, issues, work items, docs touched.
```

### AI Summary rules

- Keep it factual and self-contained — a reader with no other context must
  understand it. No pronouns referring to other sections.
- `tags`: always include `session` and `copilot-cli`, plus 1–4 lowercase
  kebab-case topic tags.
- Non-applicable sessions (research, brainstorm, read-only investigation):
  - `outcome: n/a` unless a concrete deliverable/answer was produced.
  - `impact_level: none`, `impact_scope: []`.
  - `Impact: n/a — <reason>` (e.g. `n/a — exploratory, no changes made`).
- `impact_level` guide: `low` = local/dev or docs; `medium` = shared non-prod
  or team tooling; `high` = prod or broad blast radius.

## Rules

1. **Never write secrets, tokens, passwords, or credentials** into the note —
   redact them as `<REDACTED>`.
2. Keep the note accurate and concise; do not invent steps.
3. Do not stage, commit, or push anything. Only write the `.md` file.

## Steps

1. Determine the note title/slug from the session topic; ask the user if the
   topic or scope is ambiguous.
2. Classify the `session_type`.
3. Compute the filename `YYYY-MM-DD-<slug>.md` using today's date.
4. Verify the vault directory exists; check for filename collisions.
5. Write the note using the template above.
6. Report the full path written and a short preview (frontmatter +
   AI Summary) to the user.
