# Module 5 — Protect Artifact Registry Images

## Overview

In this module you connect Google Artifact Registry (GAR) to Cortex Cloud for container image scanning.

## Steps

### 5.1 — Connect Artifact Registry

1. Navigate to **Cloud Runtime Security → Registry Scanning → Add Registry**.
2. Select **Google Artifact Registry**.
3. Provide connection details:
   * **Project ID**: Your lab project ID
   * **Repository**: `cortex-lab-registry`
   * **Region**: Your lab region
   * **Authentication**: Service account key
4. Click **Add** and validate.

### 5.2 — Push a Sample Image

```bash
# Authenticate to Artifact Registry
gcloud auth configure-docker <region>-docker.pkg.dev

# Pull and push a sample image
docker pull vulnerables/web-dvwa:latest
docker tag vulnerables/web-dvwa:latest <region>-docker.pkg.dev/<project-id>/cortex-lab-registry/dvwa:latest
docker push <region>-docker.pkg.dev/<project-id>/cortex-lab-registry/dvwa:latest
```

### 5.3 — Review Scan Results

1. Navigate to **Cloud Runtime Security → Registry Scanning**.
2. Select the GAR registry and image.
3. Review:
   * **Vulnerabilities** — CVEs with severity and fix versions
   * **Compliance** — Container best practices
   * **SBOM** — Package inventory

## Next Steps

Proceed to [Module 6 — Protect GKE Workloads](6-protect-gke-workloads.md).
