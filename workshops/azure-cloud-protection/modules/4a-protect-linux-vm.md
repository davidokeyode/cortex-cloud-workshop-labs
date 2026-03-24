# Module 4a — Protect Linux VMs

## Overview

In this module you install the Cortex XDR agent on an Ubuntu Linux virtual machine in Azure for runtime threat detection and response.

## Steps

### 4a.1 — Download the Agent

1. In Cortex Cloud, navigate to **Settings → Agent Installations**.
2. Download the Linux `.deb` package for Ubuntu.

### 4a.2 — Connect to the Linux VM

```bash
ssh -i <your-key> azureuser@<linux-vm-public-ip>
```

### 4a.3 — Install the Agent

```bash
# Upload the agent package (via SCP or Azure Bastion)
scp cortex-xdr-agent-<version>.deb azureuser@<linux-vm-public-ip>:/tmp/

# SSH and install
sudo dpkg -i /tmp/cortex-xdr-agent-<version>.deb
```

### 4a.4 — Verify the Agent

```bash
sudo /opt/traps/bin/cytool info
sudo systemctl status traps_pmd
```

### 4a.5 — Verify in Cortex Cloud Console

1. Navigate to **Assets → Endpoints**.
2. Confirm the Linux VM appears with **Connected** status.
3. Verify the agent version and assigned policy.

### 4a.6 — Test Detection

```bash
# Download the EICAR test file to trigger an alert
curl -o /tmp/eicar.txt 'https://secure.eicar.org/eicar.com.txt'
```

Review the alert in **Incidents & Alerts**.

## Next Steps

Proceed to [Module 4b — Protect Windows VMs](4b-protect-windows-vm.md).
