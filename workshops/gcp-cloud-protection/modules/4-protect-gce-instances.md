# Module 4 — Protect GCE Instances

## Overview

In this module you install the Cortex XDR agent on Google Compute Engine (GCE) virtual machines.

## Steps

### 4.1 — Download the Agent

1. In Cortex Cloud, navigate to **Settings → Agent Installations**.
2. Download the Linux `.deb` package.

### 4.2 — Install on Linux GCE

```bash
# SSH into the GCE instance
gcloud compute ssh cortex-lab-linux --zone <zone>

# Upload and install
sudo dpkg -i /tmp/cortex-xdr-agent-<version>.deb

# Verify
sudo /opt/traps/bin/cytool info
```

### 4.3 — Install on Windows GCE

1. RDP into the Windows instance or use `gcloud compute ssh`.
2. Install the `.msi` package:

```powershell
msiexec /i cortex-xdr-agent-<version>.msi /qn
```

3. Verify:

```powershell
Get-Service -Name cyserver
```

### 4.4 — Verify in Console

1. Navigate to **Assets → Endpoints**.
2. Confirm both GCE instances appear with **Connected** status.

### 4.5 — Test Detection

```bash
curl -o /tmp/eicar.txt 'https://secure.eicar.org/eicar.com.txt'
```

Review the alert in **Incidents & Alerts**.

## Next Steps

Proceed to [Module 5 — Protect Artifact Registry Images](5-protect-gar-images.md).
