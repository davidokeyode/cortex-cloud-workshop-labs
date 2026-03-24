# Cloud Account Health Check

## Overview

Use this guide to verify cloud account connectivity and health status in Cortex Cloud.

## Steps

### Check Account Status

1. Navigate to **Settings → Cloud Accounts**.
2. Review the status column:
   * ✅ **Connected** — All features are working
   * ⚠️ **Partially Connected** — Some features have issues
   * ❌ **Disconnected** — Account is not reachable

### Common Issues

| Cloud | Issue | Resolution |
|---|---|---|
| **AWS** | IAM role trust policy incorrect | Verify the external ID and Cortex Cloud account ID in the trust policy |
| **AWS** | Insufficient permissions | Ensure the IAM role has the required policies attached |
| **Azure** | Service principal secret expired | Rotate the client secret and update in Cortex Cloud |
| **Azure** | Missing API permissions | Grant required Microsoft Graph permissions |
| **GCP** | Service account key revoked | Generate a new key and update in Cortex Cloud |
| **GCP** | APIs not enabled | Enable required GCP APIs (Compute, IAM, Storage, etc.) |

### Verify via API

```bash
curl -s -X POST "${CORTEX_API_URL}/public_api/v1/cloud_accounts/list" \
  -H "Content-Type: application/json" \
  -H "x-xdr-auth-id: ${CORTEX_API_KEY_ID}" \
  -H "Authorization: ${CORTEX_API_KEY}" \
  -d '{}' | jq '.reply[] | {name, cloud_type, status}'
```

### Required GCP APIs

```bash
gcloud services enable \
  compute.googleapis.com \
  iam.googleapis.com \
  cloudresourcemanager.googleapis.com \
  storage.googleapis.com \
  container.googleapis.com \
  sqladmin.googleapis.com \
  logging.googleapis.com \
  monitoring.googleapis.com
```
