# Module 2 — Onboard AWS Account

## Overview

In this module you connect your AWS account to Cortex Cloud for visibility and protection. Cortex Cloud uses a cross-account IAM role with read-only permissions (and optionally remediation permissions) to ingest cloud configuration data.

## Steps

### 2.1 — Navigate to Cloud Account Onboarding

1. Log in to your **Cortex Cloud** console.
2. Navigate to **Settings → Cloud Accounts → Add Cloud Account**.
3. Select **Amazon Web Services**.
4. Choose **Account** (single account) as the scope.

### 2.2 — Configure Account Details

1. Enter a friendly **Account Name** (e.g., `cortex-lab-aws`).
2. Select the **Account Groups** to associate with this account.
3. Select the features to enable:
   * ✅ **Cloud Posture** — Misconfiguration detection and compliance
   * ✅ **Agentless Workload Scanning** — Snapshot-based vulnerability scanning
   * ✅ **Serverless Function Scanning** — Lambda function analysis
   * ✅ **Agent-Based Workload Protection** — Runtime security with Cortex XDR agent
   * ✅ **Data Security** — Data classification and DLP

### 2.3 — Create the IAM Role

Cortex Cloud provides a CloudFormation template to create the required cross-account role.

1. Click **Create Stack** — this opens the AWS Console with the pre-filled template.
2. Review the stack parameters and acknowledge IAM capability.
3. Click **Create stack** and wait for completion.
4. Return to Cortex Cloud and click **Next**.

### 2.4 — Verify Onboarding Status

1. Navigate to **Settings → Cloud Accounts**.
2. Confirm the AWS account shows **Connected** status.
3. Check that all enabled features show a green checkmark.

> **Note:** Initial cloud configuration ingestion takes 10–15 minutes. Full posture assessment completes within 4–24 hours depending on account size.

## Key Concepts

| Concept | Description |
|---|---|
| **Account Groups** | Logical groupings of cloud accounts for policy assignment and RBAC |
| **Cloud Posture** | Continuous assessment of cloud resource configurations against security best practices |
| **Agentless Scanning** | Snapshot-based scanning without deploying agents on workloads |

## Next Steps

Proceed to [Module 3 — Cloud Posture Management](3-cloud-posture-management.md).
