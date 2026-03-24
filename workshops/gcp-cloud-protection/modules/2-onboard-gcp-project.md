# Module 2 — Onboard GCP Project

## Overview

In this module you connect your GCP project to Cortex Cloud. Cortex Cloud uses a GCP service account with viewer permissions to ingest cloud configuration data.

## Steps

### 2.1 — Navigate to Cloud Account Onboarding

1. Log in to your **Cortex Cloud** console.
2. Navigate to **Settings → Cloud Accounts → Add Cloud Account**.
3. Select **Google Cloud Platform**.
4. Choose **Project** as the scope (or **Organization** for all projects).

### 2.2 — Configure Account Details

1. Enter a friendly **Account Name** (e.g., `cortex-lab-gcp`).
2. Enter the **Project ID**.
3. Select the features to enable:
   * ✅ **Cloud Posture** — Misconfiguration detection and compliance
   * ✅ **Agentless Workload Scanning** — Disk-based vulnerability scanning
   * ✅ **Agent-Based Workload Protection** — Runtime security with Cortex XDR agent

### 2.3 — Create the Service Account

Cortex Cloud provides a Terraform template or gcloud commands:

```bash
# Create service account
gcloud iam service-accounts create cortex-cloud-sa \
  --display-name="Cortex Cloud Security"

# Grant required roles
gcloud projects add-iam-policy-binding <project-id> \
  --member="serviceAccount:cortex-cloud-sa@<project-id>.iam.gserviceaccount.com" \
  --role="roles/viewer"

gcloud projects add-iam-policy-binding <project-id> \
  --member="serviceAccount:cortex-cloud-sa@<project-id>.iam.gserviceaccount.com" \
  --role="roles/iam.securityReviewer"

# Create and download the key
gcloud iam service-accounts keys create cortex-cloud-key.json \
  --iam-account=cortex-cloud-sa@<project-id>.iam.gserviceaccount.com
```

4. Upload the service account key JSON in the Cortex Cloud wizard.

### 2.4 — Verify Onboarding

1. Navigate to **Settings → Cloud Accounts**.
2. Confirm the GCP project shows **Connected** status.

## Key Concepts

| Concept | Description |
|---|---|
| **Service Account** | GCP identity used by Cortex Cloud to access your project |
| **Project vs. Organization** | Onboard individual projects or the entire GCP organization |
| **Flow Logs** | Optional VPC flow log ingestion for network visibility |

## Next Steps

Proceed to [Module 3 — Cloud Posture Management](3-cloud-posture-management.md).
