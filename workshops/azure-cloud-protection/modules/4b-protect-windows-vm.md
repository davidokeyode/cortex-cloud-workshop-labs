# Module 4b — Protect Windows VMs

## Overview

In this module you install the Cortex XDR agent on a Windows Server virtual machine in Azure.

## Steps

### 4b.1 — Download the Agent

1. In Cortex Cloud, navigate to **Settings → Agent Installations**.
2. Download the Windows `.msi` installer.

### 4b.2 — Connect to the Windows VM

Use RDP or Azure Bastion to connect to the Windows VM.

### 4b.3 — Install the Agent

```powershell
# Silent installation
msiexec /i "C:\temp\cortex-xdr-agent-<version>.msi" /qn
```

### 4b.4 — Verify the Agent

```powershell
Get-Service -Name cyserver
Get-Process -Name cyserver
```

### 4b.5 — Verify in Cortex Cloud Console

1. Navigate to **Assets → Endpoints**.
2. Confirm the Windows VM appears with **Connected** status.

### 4b.6 — Test Detection

```powershell
# Simulate PowerShell-based suspicious activity
Invoke-WebRequest -Uri 'https://secure.eicar.org/eicar.com.txt' -OutFile 'C:\temp\eicar.txt'
```

Review the alert in **Incidents & Alerts**.

## Next Steps

Proceed to [Module 5 — IaC Scanning](5-iac-scanning.md).
