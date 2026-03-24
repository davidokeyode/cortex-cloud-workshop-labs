# Module 0 — Prerequisites

## Overview

Before starting the workshop, verify that you have the required accounts, permissions and tools.

## Accounts Required

| Account | Details |
|---|---|
| **Cortex Cloud** | Active Cortex Cloud tenant with Cloud Posture Security, Application Security and Cloud Runtime Security modules enabled |
| **AWS** | AWS account with Administrator access (or permissions to create IAM roles, VPCs, EC2, EKS, ECS, ECR, S3, Lambda, RDS) |
| **GitHub** | GitHub account for IaC scanning repository integration |

## Cortex Cloud Roles

You need one of the following Cortex Cloud roles:
* **System Admin**
* **Cloud Security Admin**
* **Account Group Admin** (for the target account group)

## Tools

Install the following tools on your workstation:

| Tool | Purpose | Install Link |
|---|---|---|
| AWS CLI v2 | AWS resource management | https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html |
| kubectl | Kubernetes cluster management | https://kubernetes.io/docs/tasks/tools/ |
| Helm | Kubernetes package management | https://helm.sh/docs/intro/install/ |
| Git | Source control | https://git-scm.com/downloads |
| Docker | Local container operations | https://docs.docker.com/get-docker/ |

## Verify AWS CLI Configuration

```bash
aws sts get-caller-identity
```

You should see output showing your AWS Account ID and ARN.

## Next Steps

Proceed to [Module 1 — Prepare the Environment](1-prepare-the-environment.md).
