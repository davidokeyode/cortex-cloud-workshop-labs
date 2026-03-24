# Module 10 — SIEM Integration

## Overview

In this module you integrate Cortex Cloud security findings with SIEM platforms for centralized monitoring and incident response.

## Integration Options

| Platform | Method |
|---|---|
| **Cortex XSIAM** | Native integration (same platform) |
| **Splunk** | Cortex Cloud Splunk App / Syslog forwarding |
| **Microsoft Sentinel** | Azure Event Hub / API-based connector |
| **Generic SIEM** | Syslog / Webhook / API |

## Steps

### 10.1 — Cortex XSIAM Integration (Native)

If your organization uses Cortex XSIAM:

1. Cloud security data flows natively into the Cortex platform.
2. Navigate to **Cortex XSIAM → Incidents** to see cloud-sourced incidents.
3. Use XQL queries to correlate cloud security events with endpoint and network data.

```xql
dataset = cloud_audit_log
| filter severity in ("CRITICAL", "HIGH")
| comp count() as alert_count by cloud_provider, account_name
| sort desc alert_count
```

### 10.2 — Splunk Integration

1. Navigate to **Settings → Integrations → Splunk**.
2. Configure the Splunk HTTP Event Collector (HEC):
   * **Splunk URL**: `https://<splunk-host>:8088`
   * **HEC Token**: Your Splunk HEC token
3. Select the event types to forward:
   * ✅ Posture findings (misconfigurations)
   * ✅ Runtime alerts
   * ✅ Vulnerability findings
   * ✅ Compliance status changes

### 10.3 — Webhook Integration

For generic SIEM or notification systems:

1. Navigate to **Settings → Integrations → Webhooks**.
2. Configure a webhook endpoint:
   * **URL**: Your SIEM webhook receiver URL
   * **Authentication**: Bearer token, basic auth or custom headers
3. Select alert types and severity thresholds.

### 10.4 — API-Based Export

Use the Cortex Cloud API to pull findings into your SIEM:

```bash
curl -s -X POST "${CORTEX_API_URL}/public_api/v1/alerts/get_alerts" \
  -H "Content-Type: application/json" \
  -H "x-xdr-auth-id: ${CORTEX_API_KEY_ID}" \
  -H "Authorization: ${CORTEX_API_KEY}" \
  -d '{
    "request_data": {
      "filters": [{
        "field": "creation_time",
        "operator": "gte",
        "value": 1700000000000
      }],
      "search_from": 0,
      "search_to": 100
    }
  }' | jq .
```

## Key Concepts

| Concept | Description |
|---|---|
| **Cortex XSIAM** | Palo Alto's AI-driven security operations platform with native cloud integration |
| **Event Forwarding** | Real-time streaming of security events to external SIEM platforms |
| **XQL** | Cortex Query Language for searching and correlating security data |
| **Webhook** | HTTP-based integration for custom alerting and automation |

## Next Steps

Congratulations! You have completed the Azure Cloud Protection workshop.

Return to the [Workshop Home](../README.md) to explore other cloud provider workshops.
