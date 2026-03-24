# Module 6 — Protect ACR Images

## Overview

In this module you connect Azure Container Registry (ACR) to Cortex Cloud for automated container image scanning.

## Steps

### 6.1 — Connect ACR

1. Navigate to **Cloud Runtime Security → Registry Scanning → Add Registry**.
2. Select **Azure Container Registry**.
3. Provide connection details:
   * **Registry URL**: `cortexlabacr.azurecr.io`
   * **Authentication**: Service principal or managed identity
4. Click **Add** and validate the connection.

### 6.2 — Push a Sample Image

```bash
# Authenticate to ACR
az acr login --name cortexlabacr

# Pull and push a sample vulnerable image
docker pull vulnerables/web-dvwa:latest
docker tag vulnerables/web-dvwa:latest cortexlabacr.azurecr.io/dvwa:latest
docker push cortexlabacr.azurecr.io/dvwa:latest
```

### 6.3 — Review Scan Results

1. Navigate to **Cloud Runtime Security → Registry Scanning**.
2. Select the ACR registry and the pushed image.
3. Review:
   * **Vulnerabilities** — CVEs with severity and fix versions
   * **Compliance** — Container best practice violations
   * **SBOM** — Full package inventory

### 6.4 — Configure Vulnerability Policies

1. Navigate to **Cloud Runtime Security → Policies → Vulnerability**.
2. Create or modify a policy:
   * Block deployment of images with critical unfixed CVEs
   * Set maximum allowed CVE age
   * Enforce approved base images

## Next Steps

Proceed to [Module 7 — Protect AKS Workloads](7-protect-aks-workloads.md).
