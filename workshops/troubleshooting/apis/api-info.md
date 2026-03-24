# Cortex Cloud Platform APIs

## Overview

The Cortex Cloud Platform APIs provide programmatic access to cloud security data and management operations.

## API Documentation

| Region | API Reference |
|---|---|
| US | [https://cortex-panw.stoplight.io](https://cortex-panw.stoplight.io) |
| EU | [https://cortex-panw.stoplight.io](https://cortex-panw.stoplight.io) |

**Official Documentation**: [Cortex Cloud Platform APIs](https://docs-cortex.paloaltonetworks.com/r/Cortex-Cloud-Platform-APIs/Cortex-Cloud-APIs)

## Authentication

Cortex Cloud APIs use API Key + API Key ID authentication:

```bash
curl -X POST "https://api.xdr.us.paloaltonetworks.com/public_api/v1/<endpoint>" \
  -H "Content-Type: application/json" \
  -H "x-xdr-auth-id: <API_KEY_ID>" \
  -H "Authorization: <API_KEY>" \
  -d '{"request_data": {}}'
```

## Key API Endpoints

| Category | Endpoint | Description |
|---|---|---|
| Cloud Accounts | `/public_api/v1/cloud_accounts/` | Manage cloud account connections |
| Posture | `/public_api/v1/posture/` | Query posture findings and compliance |
| Alerts | `/public_api/v1/alerts/` | Get and manage security alerts |
| Incidents | `/public_api/v1/incidents/` | Get and manage incidents |
| Endpoints | `/public_api/v1/endpoints/` | Manage endpoint agents |
| Vulnerability | `/public_api/v1/vulnerability/` | Query vulnerability findings |

## SDKs and Tools

| Tool | Description | Link |
|---|---|---|
| **cortex-xdr-python** | Python SDK for Cortex XDR APIs | [GitHub](https://github.com/PaloAltoNetworks) |
| **pan-os-python** | Palo Alto Networks Python SDK | [GitHub](https://github.com/PaloAltoNetworks/pan-os-python) |
| **Postman Collection** | Pre-built API collection | Available in Cortex Cloud console |

## Rate Limits

| Tier | Requests per Minute |
|---|---|
| Standard | 500 |
| Advanced | 1000 |
| Premium | 2000 |
