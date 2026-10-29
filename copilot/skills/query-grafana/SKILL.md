---
name: query-grafana
description: "Accompanying skill for the Grafana MCP server. Use ONLY when the Grafana MCP is connected/available and a Grafana MCP tool is about to be used for dashboards, the Thanos Prometheus datasource, alerting, navigation, annotations, snapshots, or rendering. Do not use when no Grafana MCP is present."
argument-hint: "Describe the Grafana data or dashboard you need, including the cluster, namespace, app, and time range when relevant."
---

# Query Grafana

Companion skill for the **Grafana MCP** server. Invoke this skill only when the Grafana MCP is
connected and a Grafana MCP tool is about to be used. It scopes how the agent uses the deployed
`grafana-mcp` service, based on Grafana's
[`mcp-grafana`](https://github.com/grafana/mcp-grafana), to these capabilities only: dashboards,
the `Thanos` Prometheus datasource, alerting, navigation, annotations, snapshots, and rendering.
Do not use any other Grafana MCP capability. Use authenticated `humioctl`/LogScale for application
and customer logs. Consult a label reference when interpreting metric labels or deciding which
labels are safe selectors versus collection metadata.

## When to use

- Only when the Grafana MCP is available and you intend to call one of its tools. If no Grafana
  MCP is connected, do not activate this skill.
- Inspect a dashboard or panel only when the customer provides its Grafana URL. If no link is
  provided, ask for one when dashboard-specific context is needed; do not search dashboards or
  folders on the customer's behalf.
- Query Prometheus through Grafana's configured `Thanos` datasource for metrics. `Thanos` is the
  only datasource available to everyone, so do not select or query any other datasource.
- Inspect alerts when they help explain the application symptom.
- Navigation, annotations, snapshots, and rendering are also available: generate Grafana/Explore
  deeplinks, read dashboard annotations, list/get/create snapshots, and render panels. Creating a
  snapshot is the **only** permitted write; annotations and rendering are read-only.
- Do not use any other Grafana MCP capability, including Loki, incidents, Sift, on-call,
  Pyroscope, Asserts, or administrative tools. Use authenticated `humioctl` for logs; the
  Grafana MCP does not support the Falcon LogScale datasource type.
- Use a raw Thanos Proxy API PromQL fallback only when Grafana MCP cannot express the required
  PromQL or when the raw Thanos Proxy API is specifically needed.

## Available capability areas

The deployed proxy exposes many upstream Grafana MCP capabilities, but this agent uses only the
following:

- Dashboards: search dashboards, and retrieve summaries, properties, panel queries, and dashboard
  definitions.
- Datasources: only the Prometheus-type datasource named `Thanos`. Query metrics through it;
  metadata tools exist but are not used to enumerate metrics during normal troubleshooting.
- Alerting: inspect alert rules, alert groups, and contact points.
- Navigation: generate Grafana or Explore deeplinks.
- Annotations: read dashboard annotations and tags only. Do not create or update annotations.
- Snapshots: list and fetch snapshots, and create a snapshot from a dashboard payload. Creating a
  snapshot is the only write operation this agent may perform; do not delete snapshots.
- Rendering: render panels or dashboards to images (read-only).

Do not use any other exposed capability, including Loki, incidents, Sift, on-call, Pyroscope,
Asserts, or admin/team tools, even if the connected endpoint offers them. Tool availability is
determined by the connected MCP endpoint and backend authorization; stay within the capabilities
above regardless of what else is exposed.

### Situation dashboards via snapshots

To capture the current incident state as a shareable "situation dashboard", build a dashboard
payload (from customer-provided panels/queries against `Thanos`) and create a snapshot with the
snapshot capability. The snapshot freezes the current data into a static, shareable view. This is
the only write the agent performs by default; do not update or create live dashboards to achieve
the same result.

## Query workflow

1. Establish the cluster, namespace, application or pod, and concrete time window.
2. If the customer provided a dashboard URL, inspect that dashboard and its relevant panel query.
  Confirm the panel datasource is the Prometheus datasource named `Thanos`; do not select a Falcon
  LogScale datasource for a metrics query.
3. If no dashboard URL was provided, use Grafana Explore with the `Thanos` Prometheus datasource
  for the metric query. Ask the customer for a dashboard link only if dashboard context would
  materially improve the investigation.
4. Query the `Thanos` Prometheus datasource through Grafana first for the metric symptom. Always include the `cluster`
  label when it exists and filter by namespace or workload labels. Consult
  a label reference before using platform, cloud-provider, or collection-path
  labels in filters or aggregations.
5. Query logs with authenticated `humioctl` against the appropriate LogScale repository/view,
  using the appropriate LogScale repository/view and a narrow time range. Do not substitute
  Grafana Loki or any Falcon LogScale datasource.
6. Check related alerts when the symptom overlaps an operational event. Do not use incidents,
   Sift, or on-call capabilities.
7. Cite the dashboard/panel, datasource or LogScale repository/view, query, and time range used
  in the result.

## Datasource rules

- For metrics, use the Prometheus-type datasource named `Thanos`. If it is not available, stop
  and report the datasource/configuration problem; do not guess another datasource.
- For logs, use LogScale through authenticated `humioctl`.
  Grafana MCP does not support the available Falcon LogScale datasource types.
- Inspect the dashboard panel datasource only when the customer provides a dashboard link. Treat
  any non-`Thanos` datasource on a metrics panel as a configuration issue to report, not a reason
  to query it.
- Prefer the panel query from a customer-provided dashboard when available; otherwise use Explore
  with metric names and labels from the target cluster's curated catalog.
- Do not fabricate metric names, labels, or dashboard UIDs. Use the target cluster's curated
  metric catalog, a customer-supplied metric name, or a query from a customer-provided dashboard
  URL. Do not enumerate Prometheus metadata to build a metric list.
- Keep PromQL and LogScale query ranges narrow. Aggregate high-cardinality data before returning
  results.

## API Hub transport reference

The API Hub Grafana endpoint is a JSON-RPC 2.0 POST proxy around the backend `grafana-mcp` service.
VS Code MCP clients should use the configured MCP server and invoke tools normally; these details
are useful when diagnosing connectivity or integrating another MCP client.

- Prod: `https://internalapi.pg.com/othersupportingdata/it/v1/spyglass/apihub-prod/v1/mcp/grafana`
- Authentication: Basic Auth via `Authorization: Basic <base64(username:password)>`.
- Production also requires `Ocp-Apim-Subscription-Key`; request it through the Spyglass team.
- Requests use `Content-Type: application/json` and a JSON-RPC 2.0 body with `method`, optional
  `params`, and an optional `id`.
- `tools/list` discovers available tools; `tools/call` invokes a tool with its name and arguments.
- `mcp-session-id` may be supplied for stateful flows. Preserve a session ID returned by the
  backend when the client supports sessions.
- The proxy returns the backend JSON-RPC response. Expect `400` for malformed or rejected
  requests, `502` for upstream errors, and `504` for upstream timeouts.

Never request, print, commit, or store Basic Auth credentials or subscription keys in this
repository or in chat. Use the approved VS Code secret/input configuration or local credential
store.

## Read-only troubleshooting behavior

This repository's troubleshooting agent is read-only by default, with one exception: it may create
dashboard snapshots to capture a situation dashboard. Inspect dashboards, the `Thanos` datasource
metrics, alerts, and annotations without changing them. Do not update or create live dashboards,
alerts, folders, annotations, or any other Grafana resource, and do not delete snapshots, unless
the user explicitly requests the change and the connected backend authorizes it.
