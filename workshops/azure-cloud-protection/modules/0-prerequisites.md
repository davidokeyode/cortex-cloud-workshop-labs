# Module 0 — Prerequisites

## Overview

Before starting the workshop, verify that you have the required accounts, permissions and tools.

## Accounts Required

| Account | Details |
|---|---|
| **Cortex Cloud** | Active Cortex Cloud tenant with Cloud Posture Security, Application Security and Cloud Runtime Security modules enabled |
| **Azure** | Azure subscription with Owner or Contributor + User Access Administrator roles |
| **GitHub** | GitHub account for IaC scanning and Application Security labs |
| **Azure DevOps** | Azure DevOps organization for CI/CD integration (optional) |

## Cortex Cloud Roles

You need one of the following Cortex Cloud roles:
* **System Admin**
* **Cloud Security Admin**
* **Account Group Admin** (for the target account group)

## Tools

Install the following tools on your workstation:

| Tool | Purpose | Install Link |
|---|---|---|
| Azure CLI | Azure resource management | https://learn.microsoft.com/en-us/cli/azure/install-azure-cli |
| kubectl | Kubernetes cluster management | https://kubernetes.io/docs/tasks/tools/ |
| Helm | Kubernetes package management | https://helm.sh/docs/intro/install/ |
| Git | Source control | https://git-scm.com/downloads |
| Docker | Local container operations | https://docs.docker.com/get-docker/ |

## Verify Azure CLI Configuration

```bash
az login
az account show --query '{subscriptionId:id, tenantId:tenantId, name:name}'
```

You should see your subscription details.

## Next Steps

Proceed to [Module 1 — Prepare the Environment](1-prepare-the-environment.md).
