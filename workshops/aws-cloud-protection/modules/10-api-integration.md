# Module 10 — API Integration

## Overview

In this module you use the Cortex Cloud Platform APIs to automate cloud security operations. The APIs allow you to programmatically manage cloud accounts, query posture findings, manage policies and integrate with external tools.

## References

* [Cortex Cloud Platform APIs Documentation](https://docs-cortex.paloaltonetworks.com/r/Cortex-Cloud-Platform-APIs/Cortex-Cloud-APIs)

## Steps

### 10.1 — Generate API Credentials

1. Navigate to **Settings → API Keys**.
2. Click **Add API Key**.
3. Assign the appropriate role:
   * **Cloud Security Analyst** (read-only)
   * **Cloud Security Admin** (read-write)
4. Note the **API Key**, **API Key ID** and **API URL** (region-specific).

### 10.2 — Authenticate

```bash
# Set environment variables
export CORTEX_API_URL="https://api.xdr.us.paloaltonetworks.com"
export CORTEX_API_KEY="<your-api-key>"
export CORTEX_API_KEY_ID="<your-api-key-id>"
```

### 10.3 — List Cloud Accounts

```bash
curl -s -X POST "${CORTEX_API_URL}/public_api/v1/cloud_accounts/list" \
  -H "Content-Type: application/json" \
  -H "x-xdr-auth-id: ${CORTEX_API_KEY_ID}" \
  -H "Authorization: ${CORTEX_API_KEY}" \
  -d '{}' | jq .
```

### 10.4 — Query Posture Findings

```bash
curl -s -X POST "${CORTEX_API_URL}/public_api/v1/posture/findings" \
  -H "Content-Type: application/json" \
  -H "x-xdr-auth-id: ${CORTEX_API_KEY_ID}" \
  -H "Authorization: ${CORTEX_API_KEY}" \
  -d '{
    "request_data": {
      "filters": [
        {
          "field": "severity",
          "operator": "in",
          "value": ["critical", "high"]
        }
      ],
      "search_from": 0,
      "search_to": 50
    }
  }' | jq .
```

### 10.5 — Export Compliance Report

```bash
curl -s -X POST "${CORTEX_API_URL}/public_api/v1/compliance/report" \
  -H "Content-Type: application/json" \
  -H "x-xdr-auth-id: ${CORTEX_API_KEY_ID}" \
  -H "Authorization: ${CORTEX_API_KEY}" \
  -d '{
    "request_data": {
      "framework": "CIS_AWS_V1.4",
      "cloud_account_id": "<your-aws-account-id>"
    }
  }' | jq .
```

### 10.6 — Automate with Python

```python
import requests
import os

api_url = os.environ["CORTEX_API_URL"]
headers = {
    "Content-Type": "application/json",
    "x-xdr-auth-id": os.environ["CORTEX_API_KEY_ID"],
    "Authorization": os.environ["CORTEX_API_KEY"],
}

# Get all critical posture findings
response = requests.post(
    f"{api_url}/public_api/v1/posture/findings",
    headers=headers,
    json={
        "request_data": {
            "filters": [{"field": "severity", "operator": "eq", "value": "critical"}],
            "search_from": 0,
            "search_to": 100,
        }
    },
)

findings = response.json().get("reply", {}).get("findings", [])
print(f"Found {len(findings)} critical findings")
for f in findings:
    print(f"  - {f['policy_name']}: {f['resource_name']}")
```

## API Regions

| Region | API Base URL |
|---|---|
| US | `https://api.xdr.us.paloaltonetworks.com` |
| EU | `https://api.xdr.eu.paloaltonetworks.com` |
| UK | `https://api.xdr.uk.paloaltonetworks.com` |
| Singapore | `https://api.xdr.sg.paloaltonetworks.com` |
| Japan | `https://api.xdr.jp.paloaltonetworks.com` |

## Key Concepts

| Concept | Description |
|---|---|
| **API Key Authentication** | API Key + API Key ID for programmatic access |
| **Rate Limiting** | API calls are rate-limited per tenant |
| **RBAC** | API keys inherit role-based access from the assigned role |

## Next Steps

Congratulations! You have completed the AWS Cloud Protection workshop.

Return to the [Workshop Home](../README.md) to explore other cloud provider workshops.
