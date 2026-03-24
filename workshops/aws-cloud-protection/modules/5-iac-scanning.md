# Module 5 — IaC Scanning

## Overview

In this module you use Cortex Cloud's Application Security capabilities to scan Infrastructure-as-Code (IaC) templates for misconfigurations before they are deployed.

## Supported IaC Frameworks

| Framework | File Types |
|---|---|
| Terraform | `.tf`, `.tfvars` |
| CloudFormation | `.yml`, `.yaml`, `.json` (CFN) |
| ARM Templates | `.json` (ARM) |
| Bicep | `.bicep` |
| Kubernetes | `.yml`, `.yaml` (K8s manifests) |
| Helm | Helm charts |
| Dockerfile | `Dockerfile` |
| Docker Compose | `docker-compose.yml` |
| Ansible | Ansible playbooks |
| OpenAPI | Swagger / OpenAPI specs |
| Serverless Framework | `serverless.yml` |

## Steps

### 5.1 — Connect a Repository

1. Navigate to **Application Security → Repositories**.
2. Click **Add Repository** and select **GitHub**.
3. Authorize Cortex Cloud to access your GitHub account.
4. Select the repository containing IaC templates (e.g., the `iac-scanning-repo` in this workshop).

### 5.2 — Review IaC Scan Results

1. Once the repository is connected, Cortex Cloud automatically scans for IaC files.
2. Navigate to **Application Security → IaC Misconfigurations**.
3. Review findings grouped by:
   * **Severity** (Critical, High, Medium, Low)
   * **Policy** (e.g., "S3 bucket allows public read", "Security group allows SSH from 0.0.0.0/0")
   * **File path** and line number

### 5.3 — CI/CD Integration

Integrate IaC scanning into your CI/CD pipeline:

#### GitHub Actions Example

```yaml
name: Cortex Cloud IaC Scan
on:
  pull_request:
    branches: [main]

jobs:
  iac-scan:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Run Cortex Cloud IaC Scan
        uses: bridgecrewio/checkov-action@master
        with:
          api-key: ${{ secrets.CORTEX_CLOUD_API_KEY }}
          use_enforcement_rules: true
```

### 5.4 — Scan Sample Templates

The `iac-scanning-repo/` folder contains intentionally misconfigured templates:

| File | Misconfiguration |
|---|---|
| `s3-public.tf` | S3 bucket with public ACL |
| `sg-open-ssh.tf` | Security group with 0.0.0.0/0 SSH access |
| `rds-unencrypted.tf` | RDS instance without encryption |
| `ec2-imdsv1.tf` | EC2 instance using IMDSv1 |
| `Dockerfile` | Running as root, no healthcheck |

### 5.5 — Fix and Rescan

1. Review the remediation guidance provided for each finding.
2. Fix the misconfiguration in your IaC template.
3. Commit and push — the scan runs automatically and the finding is resolved.

## Key Concepts

| Concept | Description |
|---|---|
| **Shift-Left Security** | Find and fix misconfigurations before deployment |
| **Policy-as-Code** | Security policies expressed as code rules that evaluate IaC templates |
| **Enforcement Rules** | Define which policies block builds vs. generate warnings |
| **Supply Chain Security** | Visibility into dependencies, packages and build configurations |

## Next Steps

Proceed to [Module 6 — Protect ECR Images](6-protect-ecr-images.md).
