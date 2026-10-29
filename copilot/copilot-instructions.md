## Response Style & Behavior

- Start with a **TL;DR** for any response longer than ~5 lines. Skip it for short answers.
- Prefer concise responses. Keep output tokens as low as possible without
  losing substance. Use acronyms and conjunctions where possible.
- Ask clarifying questions before running mutations if target scope,
  namespace, subscription, cluster, or repo is ambiguous.
- **Do not stage changes automatically.**
- **Do not push branches and commits** unless explicitly told to.
- When writing docs, prefer creating **diagrams** for sections explaining flow
- Format diagrams in either tree, ascii, or Mermaid (ordered by preference).

---

## Tool Usage Policy

Always prefer these tools over improvising. If a tool fails, diagnose with the
tool's own status/auth commands before falling back to alternatives. If the
tool remains unusable, **ask the user how to proceed** — do not silently
switch to an alternative approach.

**Mutation policy:** for any write op (git, `kubectl apply/delete/patch`,
`gh` create/merge/close, Azure writes) — show the exact command, wait for
**explicit confirmation**, then execute. No silent execution, no auto-retry
on a modified command without re-confirming.

**Production safety:** if the active kube context, Azure subscription, or
target repo appears to be prod (name contains `prod`, `prd`, `production`,
or is flagged as such), require explicit confirmation _twice_ for any write —
once to acknowledge prod, once to run.

---

### `rg` (ripgrep) — code & text search

**Use for:** any search across files, directories, or logs.
**Fallback:** `grep`

Examples:

- Find symbol: `rg -n "func handleFoo"`
- Filter by type: `rg -t go "TODO"`
- List files only: `rg -l "pattern"`

---

### `jq` — JSON manipulation

**Use for:** parsing/transforming JSON in shell pipelines, including output
from `kubectl -o json`, `gh … --json`, and Azure MCP responses.
**Never:** grep or sed JSON.

Examples:

- `kubectl get pods -o json | jq '.items[].metadata.name'`
- `gh pr list --json number,title | jq '.[] | select(.title | test("fix"))'`

---

### `kubectl` — Kubernetes operations

**Use for:** all cluster inspection and mutation.
**Defaults:**

- Show current context if unclear: `kubectl config current-context`
- Prefer `-o json | jq` over `-o wide` when composing further logic
- Use `--dry-run=client -o yaml` before any `apply` for new resources
- Never `kubectl delete` without explicit user confirmation
- If context is prod, apply the double-confirmation rule above

Common patterns:

- Logs: `kubectl logs -n <ns> <pod> --tail=200`
- Events: `kubectl get events -n <ns> --sort-by=.lastTimestamp`
- Exec: `kubectl exec -n <ns> -it <pod> -- <cmd>`

---

### `gh` CLI — GitHub from the terminal

**Default GitHub tool.** Use for PRs, issues, releases, workflow runs, repo
metadata. Escalate to GitHub MCP only when you need to correlate data across
more than 2 GitHub API calls.

Examples:

- `gh pr create --fill --draft`
- `gh run list --workflow=ci.yml --limit 5 --json conclusion,headBranch`

Reminder: **never push branches or create PRs without being told.** Propose
the command; wait for confirmation.

If auth fails: run `gh auth status`. If still broken, ask user.

---

### GitHub MCP

**Use only when:** correlating data across >2 GitHub API calls in a single
task (e.g., PR diff + reviews + linked issues + workflow status together).

Otherwise use `gh`.

---

### `az` CLI — Azure from the terminal

**Default Azure tool. Prefer `az` over Azure MCP** for resource inspection,
ARM queries, RG navigation, and subscription-level questions.

**Defaults:**

- Show current context if unclear: `az account show -o json | jq '{name,id,tenantId}'`
- Prefer `-o json | jq` over `-o table` when composing further logic
- Read-only exploration by default; ask before create/delete
- Confirm subscription/tenant before mutations
- If subscription name suggests prod, apply the double-confirmation rule above

Examples:

- List RGs: `az group list -o json | jq '.[].name'`
- Resource state: `az resource show --ids <id> -o json | jq '.properties'`
- Set sub: `az account set --subscription <name-or-id>`

If auth fails: run `az account show`. If still broken, ask user.

**Do NOT use for:** Kubernetes workloads on AKS — use `kubectl` for anything
inside the cluster; `az` only for the AKS resource itself (node pools,
cluster config, networking).

---

### Azure MCP

**Use only when:** `az` can't express the query cleanly, or when you need
richer cross-resource correlation than a single `az` call provides.

**Rules:**

- Confirm subscription/tenant before mutations
- If subscription name suggests prod, apply double-confirmation
- Read-only exploration by default; ask before create/delete

---

### Atlassian MCP

When connected to atlassian-mcp:

- **ONLY** use Confluence tools. I do not use Jira.
- **MUST** use Confluence spaceId = "GO"
- **MUST** use cloudId = "https://jira-pg.atlassian.net/" (do NOT call getAccessibleAtlassianResources)
- **MUST** use `maxResults: 10` or `limit: 10` for ALL Jira JQL and Confluence CQL search operations.

---

### Azure DevOps (ADO) MCP

**We use ADO for task & sprint tracking only** — work items, boards,
backlogs, and iterations. Skip repos/PRs/pipelines/wikis/test plans unless
explicitly asked.

**Hardcoded scope (do NOT call `core_list_projects` / `core_list_project_teams`):**

- **Org:** `pg-ITS-TOP`
- **Project:** `GTO IO`
- **Team / board:** `Spyglass-SRE`

Ignore other teams (e.g. `Spyglass-Engineering`) unless I say otherwise.

**Defaults:**

- Read-only by default. Any **write** (`wit_work_item_write`,
  `wit_work_item_comment_write`, `wit_work_item_link_write`,
  `work_iteration_write`, `work_capacity_write`) follows the mutation policy —
  show intent, wait for **explicit confirmation**, then execute.
- When listing work items, sort always by priority.
- Always list work items assigned to me unless stated otherwise.
- Page results in batches of 5–10; use `minimal_output` when full detail isn't needed.

**Tool map (task & sprint tracking):**

- **Backlog / board:** `ado-wit_backlog` (backlog items for the team)
- **Sprints / iterations:** `ado-work` (team iterations & sprint dates),
  `ado-work_iteration_write` (assign iterations — confirm first),
  `ado-work_capacity_write` (sprint capacity — confirm first)
- **Work items:** `ado-wit_query` (WIQL), `ado-wit_work_item` (read),
  `ado-wit_work_item_write` (create/update — confirm),
  `ado-wit_work_item_comment_write`, `ado-wit_work_item_link_write`,
  `ado-wit_work_item_attachment`
- **Search:** `ado-search_workitem`

For WIQL, always scope to the project/team, e.g.
`[System.TeamProject] = 'GTO IO'` filtered to either `Spyglass-SRE` or `Spyglass-Engineering` area path.

Reminder: these are **deferred** tools — call the tool-search tool first to load
a tool's schema before invoking it; never guess arguments.

---

## Decision Trees

### "What's wrong with this pod?"

1. `kubectl get pod <name> -n <ns> -o json | jq '.status'`
2. `kubectl describe pod <name> -n <ns>` (events)
3. `kubectl logs <name> -n <ns> --previous` if crashlooping
4. `kubectl get events -n <ns> --sort-by=.lastTimestamp | tail -20`

### "What changed in this PR?"

- Quick view: `gh pr diff <n>`
- Structured analysis (multiple files, comments, reviews): GitHub MCP

### "Find where X is used"

- Code: `rg -n "X"`
- Across GitHub org: GitHub MCP search
- In cluster manifests: `rg -n "X" -g "*.yaml"`

### "Check Azure resource state"

- `az` first (`az resource show`, `az group list`, etc.)
- Azure MCP only if `az` can't express it or needs cross-resource correlation
- If it's an AKS _workload_ question, switch to `kubectl`

---

## Docs & Diagrams

When explaining flows, architectures, or sequences, include a diagram.
Default types:

- **Sequence:** service-to-service calls, auth flows
- **Flowchart:** decision logic, CI/CD pipelines
- **C4 / graph:** system topology

When creating a feature or a change in any codebase, offer to create a markdown file in the current
working directory that will document the feature/change being created.

---

## General Behavior

- Show mutating commands before running; wait for explicit go-ahead
- When piping through `jq`, briefly explain the filter
- If a tool returns empty/unexpected output, verify context (kube context,
  `gh auth`, `az account show`) before concluding the resource doesn't exist
- Don't suggest installing new tools when one in this list will work

---

## Writing Code

Below are guidelines when writing any type of code in any programming language:

- Write self-documenting code via meaningful variable names, function names, and etc.
- Write code that is meant to be read and maintained by humans.
- Use comments only for things that can't be explained by the code.
- Prefer idiomatic code.
- Follow the keep it simple principle.
- Return early.
- Keep if-branching level to a minimum.
- Avoid long binary operations in an if statement by deconstructing the branches.
