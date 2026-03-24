# Module 3 — Cloud Posture Management

## Overview

In this module you explore Cortex Cloud's Cloud Posture Security capabilities for your Azure environment, including misconfiguration detection, compliance monitoring, SmartGrouping and SmartScore.

## Steps

### 3.1 — Review the Posture Dashboard

1. Navigate to **Cloud Posture → Dashboard**.
2. Filter by your Azure subscription.
3. Review:
   * Total Azure assets discovered
   * Critical, high, medium and low findings
   * Compliance posture across Azure-specific frameworks

### 3.2 — Explore Azure-Specific Misconfigurations

1. Navigate to **Cloud Posture → Misconfigurations**.
2. Filter by **Cloud Type** → **Azure**.
3. Explore findings such as:
   * Storage account with public blob access enabled
   * NSG with unrestricted SSH (0.0.0.0/0 on port 22) or RDP (port 3389)
   * SQL Server without auditing enabled
   * Key Vault without purge protection
   * VM without disk encryption
   * Web App without HTTPS-only enforcement

### 3.3 — Compliance Frameworks

1. Navigate to **Cloud Posture → Compliance**.
2. Review Azure-relevant frameworks:
   * CIS Azure Foundations Benchmark v2.0
   * Azure Security Benchmark
   * SOC 2
   * PCI DSS
   * ISO 27001
   * NIST 800-53
   * HIPAA
3. Generate a compliance report for your Azure subscription.

### 3.4 — Attack Path Analysis

1. Navigate to **Cloud Posture → Attack Paths**.
2. Review Azure-specific attack paths, e.g.:
   * Internet → NSG (open port) → VM (vulnerable package) → Storage (sensitive data)
   * Web App → SQL Server (weak auth) → Data exfiltration
3. Examine the visual attack path graph.

### 3.5 — Auto-Remediation

1. Navigate to **Cloud Posture → Misconfigurations**.
2. Select a finding with auto-remediation available (e.g., "Storage account allows public access").
3. Click **Remediate** to apply the fix:
   * Review the proposed change
   * Confirm the remediation
4. Verify the finding status changes to **Resolved**.

## Key Concepts

| Concept | Description |
|---|---|
| **SmartScore** | AI-driven risk score combining misconfiguration, exposure, blast radius and runtime context |
| **SmartGrouping** | Groups related findings into holistic, actionable cases |
| **Auto-Remediation** | One-click or automated fix for supported misconfigurations |
| **Azure Security Benchmark** | Microsoft's cloud security framework mapped to Cortex Cloud policies |

## Next Steps

Proceed to [Module 4a — Protect Linux VMs](4a-protect-linux-vm.md).
