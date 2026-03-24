# Module 3 — Cloud Posture Management

## Overview

In this module you explore Cortex Cloud's Cloud Posture Security capabilities, including misconfiguration detection, compliance monitoring, SmartGrouping and SmartScore risk prioritization.

## Steps

### 3.1 — Review the Posture Dashboard

1. Navigate to **Cloud Posture → Dashboard**.
2. Review the summary of:
   * Total assets discovered
   * Critical, high, medium and low findings
   * Compliance posture across frameworks
3. Note the **SmartScore** for your AWS account — this is an AI-driven risk score that combines misconfiguration severity, exposure, blast radius and runtime context.

### 3.2 — Explore Misconfigurations

1. Navigate to **Cloud Posture → Misconfigurations**.
2. Filter by **Cloud Account** → select your lab account.
3. Explore findings such as:
   * S3 bucket with public access enabled
   * Security group with unrestricted SSH (0.0.0.0/0 on port 22)
   * RDS instance without encryption at rest
   * EC2 instance without IMDSv2 enforced
4. Click on a finding to see:
   * **Resource details** and configuration
   * **Policy** that triggered the finding
   * **Remediation steps** (manual and automated)
   * **Attack path** context (if applicable)

### 3.3 — SmartGrouping

SmartGrouping consolidates related findings into holistic cases.

1. Navigate to **Cloud Posture → Cases**.
2. Review how Cortex Cloud groups related misconfigurations affecting the same workload or attack surface.
3. Each case shows:
   * Consolidated findings
   * Affected resources
   * Combined risk score
   * Recommended remediation priority

### 3.4 — Compliance

1. Navigate to **Cloud Posture → Compliance**.
2. Review supported compliance frameworks:
   * CIS AWS Foundations Benchmark
   * AWS Well-Architected Framework
   * SOC 2
   * PCI DSS
   * HIPAA
   * NIST 800-53
   * GDPR
3. Click on a framework to see pass/fail status per control.
4. Generate and download a compliance report.

### 3.5 — Attack Path Analysis

1. Navigate to **Cloud Posture → Attack Paths**.
2. Review discovered attack paths that chain together:
   * Internet-exposed resources
   * Misconfigured permissions
   * Vulnerable workloads
   * Sensitive data stores
3. Click an attack path to see the visual graph.

## Key Concepts

| Concept | Description |
|---|---|
| **SmartScore** | AI-driven risk prioritization combining misconfiguration, exposure, blast radius and runtime context |
| **SmartGrouping** | Automated consolidation of related findings into actionable cases |
| **Attack Path Analysis** | Visual mapping of chained risks that could lead to a breach |
| **Compliance Frameworks** | Pre-built and custom policy sets mapped to regulatory standards |

## Next Steps

Proceed to [Module 4 — Protect EC2 Instances](4-protect-ec2-instances.md).
