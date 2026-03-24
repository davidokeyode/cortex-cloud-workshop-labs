# Module 9 — Agentless Scanning

## Overview

In this module you configure agentless scanning for EC2 instances. Agentless scanning creates EBS snapshots and analyzes them without deploying an agent — ideal for workloads where agent installation is not feasible.

## Steps

### 9.1 — Enable Agentless Scanning

1. Navigate to **Settings → Cloud Accounts**.
2. Select your AWS account.
3. Under **Features**, verify **Agentless Workload Scanning** is enabled.
4. Configure scanning options:
   * **Scan frequency**: Every 24 hours (default)
   * **Regions**: Select the region(s) containing your lab resources
   * **Scan scope**: All instances or tag-based selection

### 9.2 — Trigger a Scan

1. Navigate to **Cloud Runtime Security → Agentless Scanning**.
2. Click **Scan Now** to trigger an immediate scan (or wait for the scheduled scan).

### 9.3 — Review Results

Once the scan completes (approximately 10–15 minutes):

1. Navigate to **Assets → Hosts**.
2. Select an agentlessly-scanned host.
3. Review:
   * **Vulnerabilities** — OS and application CVEs
   * **Compliance** — Host configuration checks (CIS benchmarks)
   * **Malware** — Detected malicious files
   * **Secrets** — Exposed credentials and API keys

### 9.4 — Compare Agent vs. Agentless

| Capability | Agent-Based | Agentless |
|---|---|---|
| Vulnerability scanning | ✅ Real-time | ✅ Periodic |
| Runtime protection | ✅ Yes | ❌ No |
| Malware detection | ✅ Real-time | ✅ Periodic |
| Secret detection | ✅ Yes | ✅ Yes |
| Performance impact | Low | None |
| Deployment required | Yes (agent) | No |

## Key Concepts

| Concept | Description |
|---|---|
| **Agentless Scanning** | Snapshot-based analysis without deploying software on the workload |
| **EBS Snapshots** | Point-in-time copies of EC2 volumes used for analysis |
| **Scan Scope** | Tag-based or account-wide selection of workloads to scan |

## Next Steps

Proceed to [Module 10 — API Integration](10-api-integration.md).
