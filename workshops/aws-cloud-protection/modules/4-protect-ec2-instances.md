# Module 4 — Protect EC2 Instances

## Overview

In this module you install the **Cortex XDR agent** on both Linux and Windows EC2 instances for runtime threat detection and response.

## Prerequisites

* EC2 instances deployed in Module 1
* Cortex XDR agent installation packages (download from Cortex Cloud console)

## Supported Operating Systems

The Cortex XDR agent supports the following (see [compatibility matrix](https://docs-cortex.paloaltonetworks.com/r/Cortex-Cloud-Runtime-Security/Cortex-XDR-Compatibility-Matrix/Linux)):

| OS | Versions |
|---|---|
| Amazon Linux | 2, 2023 |
| Ubuntu | 18.04, 20.04, 22.04, 24.04 |
| RHEL / CentOS | 7.x, 8.x, 9.x |
| Windows Server | 2016, 2019, 2022 |

## Steps

### 4.1 — Download the Agent Package

1. In Cortex Cloud, navigate to **Settings → Agent Installations**.
2. Download the appropriate agent package:
   * **Linux**: `.rpm` or `.deb` package
   * **Windows**: `.msi` installer

### 4.2 — Install on Linux EC2

1. SSH into the Linux EC2 instance:

```bash
ssh -i <your-key>.pem ec2-user@<linux-ec2-public-ip>
```

2. Upload and install the Cortex XDR agent:

```bash
# For Amazon Linux / RHEL
sudo rpm -ivh cortex-xdr-agent-<version>.rpm

# For Ubuntu / Debian
sudo dpkg -i cortex-xdr-agent-<version>.deb
```

3. Verify the agent is running:

```bash
sudo /opt/traps/bin/cytool info
```

### 4.3 — Install on Windows EC2

1. RDP into the Windows EC2 instance.
2. Copy the `.msi` installer to the instance.
3. Run the installer:

```powershell
msiexec /i cortex-xdr-agent-<version>.msi /qn
```

4. Verify the agent service is running:

```powershell
Get-Service -Name cyserver
```

### 4.4 — Verify Agent Registration

1. In Cortex Cloud, navigate to **Assets → Endpoints**.
2. Confirm both EC2 instances appear with **Connected** status.
3. Check the agent version and policy assignment.

### 4.5 — Test Runtime Protection

1. On the Linux instance, simulate a suspicious activity:

```bash
# Simulate a reverse shell attempt (will be blocked)
curl http://malware-testfile.example.com/eicar.txt -o /tmp/testfile
```

2. In Cortex Cloud, navigate to **Incidents & Alerts** to review the generated alert.

## Key Concepts

| Concept | Description |
|---|---|
| **Cortex XDR Agent** | Lightweight endpoint agent providing prevention, detection and response |
| **Behavioral Threat Protection** | Detects malicious activity based on behavior rather than signatures |
| **Host Firewall** | Agent-managed host firewall policy |
| **Vulnerability Assessment** | Agent reports installed packages for vulnerability matching |

## Next Steps

Proceed to [Module 5 — IaC Scanning](5-iac-scanning.md).
