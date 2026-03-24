# Module 3 — Cloud Posture Management

## Overview

In this module you explore Cloud Posture Security capabilities for your GCP environment.

## Steps

### 3.1 — Review the Posture Dashboard

1. Navigate to **Cloud Posture → Dashboard**.
2. Filter by your GCP project.
3. Review findings by severity.

### 3.2 — Explore GCP-Specific Misconfigurations

1. Navigate to **Cloud Posture → Misconfigurations**.
2. Filter by **Cloud Type** → **GCP**.
3. Explore findings such as:
   * Cloud Storage bucket with public access
   * Firewall rule allowing SSH from 0.0.0.0/0
   * Cloud SQL instance with public IP and no SSL enforcement
   * Compute Engine VM without Shielded VM enabled
   * Service account with owner role

### 3.3 — GCP Compliance Frameworks

1. Navigate to **Cloud Posture → Compliance**.
2. Review GCP-relevant frameworks:
   * CIS Google Cloud Platform Foundation Benchmark
   * Google Cloud Security Best Practices
   * SOC 2
   * PCI DSS
   * ISO 27001
   * NIST 800-53
3. Generate a compliance report.

### 3.4 — Attack Path Analysis

1. Navigate to **Cloud Posture → Attack Paths**.
2. Review GCP attack paths such as:
   * Internet → Firewall (open port) → VM (vulnerable) → Cloud Storage (sensitive data)
   * Service account (over-privileged) → Cloud SQL → Data exfiltration

## GCP Capabilities Matrix

| Feature | Supported |
|---|---|
| Cloud Posture (Misconfigurations) | ✅ Yes |
| Compliance Frameworks | ✅ Yes |
| Attack Path Analysis | ✅ Yes |
| SmartScore / SmartGrouping | ✅ Yes |
| Auto-Remediation | ✅ Limited |
| Agentless Scanning | ✅ Yes |
| Agent-Based Runtime | ✅ Yes |
| Data Security (DSPM) | ✅ Yes |

## Next Steps

Proceed to [Module 4 — Protect GCE Instances](4-protect-gce-instances.md).
