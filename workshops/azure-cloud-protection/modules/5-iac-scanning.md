# Module 5 — IaC Scanning

## Overview

In this module you use Cortex Cloud's Application Security capabilities to scan Azure-specific Infrastructure-as-Code templates for misconfigurations.

## Supported Azure IaC Frameworks

| Framework | File Types |
|---|---|
| ARM Templates | `.json` (ARM) |
| Bicep | `.bicep` |
| Terraform (AzureRM) | `.tf` |
| Kubernetes | `.yml`, `.yaml` |
| Dockerfile | `Dockerfile` |

## Steps

### 5.1 — Connect Your Repository

1. Navigate to **Application Security → Repositories**.
2. Click **Add Repository** and select **GitHub** or **Azure DevOps Repos**.
3. Authorize and select the repository with Azure IaC templates.

### 5.2 — Review Azure-Specific Findings

The `iac-scanning-repo/` folder contains intentionally misconfigured Azure templates:

| File | Misconfiguration |
|---|---|
| `storage-public.tf` | Storage account with public blob access |
| `nsg-open-rdp.tf` | NSG with RDP open to 0.0.0.0/0 |
| `sql-no-audit.tf` | Azure SQL without auditing |
| `keyvault-no-purge.bicep` | Key Vault without purge protection |
| `Dockerfile` | Running as root, no healthcheck |

### 5.3 — Azure DevOps Pipeline Integration

```yaml
# azure-pipelines.yml
trigger:
  - main

pool:
  vmImage: 'ubuntu-latest'

steps:
  - task: UsePythonVersion@0
    inputs:
      versionSpec: '3.10'

  - script: |
      pip install checkov
      checkov -d . --bc-api-key $(CORTEX_CLOUD_API_KEY) --repo-id $(Build.Repository.Name)
    displayName: 'Run Cortex Cloud IaC Scan'
```

### 5.4 — Fix and Verify

1. Review remediation guidance for each finding.
2. Apply fixes to the IaC templates.
3. Push changes and verify the findings are resolved.

## Next Steps

Proceed to [Module 6 — Protect ACR Images](6-protect-acr-images.md).
