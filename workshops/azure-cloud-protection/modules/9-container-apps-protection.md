# Module 9 — Container Apps Protection

## Overview

In this module you protect serverless container workloads running on Azure Container Instances (ACI) and Azure Container Apps.

## Steps

### 9.1 — Azure Container Instances (ACI) Protection

#### Deploy a Sample ACI Workload

```bash
az container create \
  --resource-group cortex-cloud-lab-rg \
  --name cortex-lab-aci \
  --image cortexlabacr.azurecr.io/dvwa:latest \
  --registry-login-server cortexlabacr.azurecr.io \
  --registry-username <acr-username> \
  --registry-password <acr-password> \
  --ports 80 \
  --dns-name-label cortex-lab-aci
```

#### Enable Protection

1. Cortex Cloud automatically discovers ACI instances via the cloud account onboarding.
2. Navigate to **Assets → Containers** to see the ACI workload.
3. Agentless scanning covers vulnerability assessment for ACI.

### 9.2 — Azure Container Apps Protection

#### Deploy a Sample Container App

```bash
az containerapp create \
  --name cortex-lab-app \
  --resource-group cortex-cloud-lab-rg \
  --environment cortex-lab-env \
  --image cortexlabacr.azurecr.io/dvwa:latest \
  --target-port 80 \
  --ingress external
```

#### Review Security Findings

1. Navigate to **Cloud Posture → Misconfigurations**.
2. Filter for Container Apps resources.
3. Review posture findings such as:
   * Container App without managed identity
   * Ingress without HTTPS-only enforcement
   * Missing scale rules

### 9.3 — Image Vulnerability Review

1. Navigate to **Cloud Runtime Security → Registry Scanning**.
2. The images used by ACI and Container Apps are scanned via the connected ACR.
3. Review vulnerability findings for the deployed images.

## Key Concepts

| Concept | Description |
|---|---|
| **ACI** | Azure Container Instances — serverless container platform |
| **Container Apps** | Azure Container Apps — managed Kubernetes-based serverless containers |
| **Agentless Discovery** | Cloud-native workloads discovered via API-based scanning |

## Next Steps

Proceed to [Module 10 — SIEM Integration](10-siem-integration.md).
