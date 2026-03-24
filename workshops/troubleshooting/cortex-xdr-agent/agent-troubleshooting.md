# Cortex XDR Agent Troubleshooting

## Common Issues

### Agent Not Connecting

1. **Check agent status**:

```bash
# Linux
sudo /opt/traps/bin/cytool info
sudo systemctl status traps_pmd

# Windows (PowerShell)
Get-Service -Name cyserver
```

2. **Verify network connectivity**:

The agent needs outbound HTTPS (443) access to:
* `distributions.traps.paloaltonetworks.com`
* `*.xdr.us.paloaltonetworks.com` (or your region)

3. **Check firewall rules**:

```bash
# Test connectivity
curl -v https://distributions.traps.paloaltonetworks.com 2>&1 | grep -i connected
```

4. **Review agent logs**:

```bash
# Linux
sudo cat /var/log/traps/pmd.log | tail -50

# Windows
Get-Content "C:\ProgramData\Cyvera\Logs\pmd.log" -Tail 50
```

### Agent Installation Failures

| Error | Resolution |
|---|---|
| "Package dependency not met" | Install required dependencies: `libcurl`, `libnl`, `iptables` |
| "Unsupported kernel" | Check the [compatibility matrix](https://docs-cortex.paloaltonetworks.com/r/Cortex-Cloud-Runtime-Security/Cortex-XDR-Compatibility-Matrix/Linux) |
| "Insufficient permissions" | Run installer with `sudo` (Linux) or as Administrator (Windows) |
| "Port conflict" | Ensure port 33221 is not in use |

### Supported Linux Distributions

| Distribution | Supported Versions |
|---|---|
| Ubuntu | 18.04, 20.04, 22.04, 24.04 |
| RHEL / CentOS | 7.x, 8.x, 9.x |
| Amazon Linux | 2, 2023 |
| SUSE Linux | 12 SP5, 15 SP3+ |
| Debian | 10, 11, 12 |
| Oracle Linux | 7.x, 8.x, 9.x |

### Agent Upgrade

```bash
# Linux
sudo /opt/traps/bin/cytool update --force

# Windows
msiexec /i cortex-xdr-agent-<new-version>.msi /qn REINSTALLMODE=amus
```
