# Module 2 — Onboard Azure Subscription

## Overview

In this module you connect your Azure subscription to Cortex Cloud. Cortex Cloud uses an Azure AD app registration (service principal) with Reader permissions to ingest cloud configuration data.

## Steps

### 2.1 — Navigate to Cloud Account Onboarding

1. Log in to your **Cortex Cloud** console.
2. Navigate to **Settings → Cloud Accounts → Add Cloud Account**.
3. Select **Microsoft Azure**.
4. Choose **Subscription** as the scope (or **Tenant** for all subscriptions).

### 2.2 — Configure Account Details

1. Enter a friendly **Account Name** (e.g., `cortex-lab-azure`).
2. Select the **Account Groups** to associate.
3. Select the features to enable:
   * ✅ **Cloud Posture** — Misconfiguration detection and compliance
   * ✅ **Agentless Workload Scanning** — Disk snapshot-based vulnerability scanning
   * ✅ **Agent-Based Workload Protection** — Runtime security with Cortex XDR agent
   * ✅ **Serverless Function Scanning** — Azure Functions analysis
   * ✅ **Data Security** — Data classification and DLP for Storage and SQL

### 2.3 — Create the Service Principal

Cortex Cloud provides a Terraform template or manual steps:

#### Option A — Automated (Terraform)

1. Download the Terraform template from the Cortex Cloud onboarding wizard.
2. Run:

```bash
terraform init
terraform apply
```

#### Option B — Manual

1. Create an Azure AD App Registration:

```bash
az ad app create --display-name "Cortex Cloud Security"
az ad sp create --id <app-id>
az role assignment create --assignee <app-id> --role "Reader" --scope "/subscriptions/<sub-id>"
```

2. Enter the **Application (Client) ID**, **Tenant ID** and **Client Secret** in the Cortex Cloud wizard.

### 2.4 — Verify Onboarding Status

1. Navigate to **Settings → Cloud Accounts**.
2. Confirm the Azure subscription shows **Connected** status.
3. Check that all enabled features show a green checkmark.

> **Note:** Initial ingestion takes 10–15 minutes. Full posture assessment completes within 4–24 hours.

## Key Concepts

| Concept | Description |
|---|---|
| **Service Principal** | Azure AD identity used by Cortex Cloud to access your subscription |
| **Account Groups** | Logical groupings for policy assignment and RBAC |
| **Feature Selection** | Choose which security capabilities to enable per cloud account |

## Next Steps

Proceed to [Module 3 — Cloud Posture Management](3-cloud-posture-management.md).
