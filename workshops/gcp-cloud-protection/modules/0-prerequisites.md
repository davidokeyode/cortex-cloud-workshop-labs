# Module 0 — Prerequisites

## Overview

Before starting the workshop, verify that you have the required accounts, permissions and tools.

## Accounts Required

| Account | Details |
|---|---|
| **Cortex Cloud** | Active Cortex Cloud tenant with Cloud Posture Security and Cloud Runtime Security modules enabled |
| **GCP** | GCP project with Owner or Editor role |
| **GitHub** | GitHub account for IaC scanning labs |

## Cortex Cloud Roles

You need one of the following Cortex Cloud roles:
* **System Admin**
* **Cloud Security Admin**

## Tools

| Tool | Purpose | Install Link |
|---|---|---|
| Google Cloud SDK | GCP resource management | https://cloud.google.com/sdk/docs/install |
| kubectl | Kubernetes cluster management | https://kubernetes.io/docs/tasks/tools/ |
| Helm | Kubernetes package management | https://helm.sh/docs/intro/install/ |
| Terraform | Infrastructure provisioning | https://developer.hashicorp.com/terraform/install |
| Git | Source control | https://git-scm.com/downloads |
| Docker | Local container operations | https://docs.docker.com/get-docker/ |

## Verify GCP Configuration

```bash
gcloud auth login
gcloud config set project <your-project-id>
gcloud projects describe $(gcloud config get-value project)
```

## Next Steps

Proceed to [Module 1 — Prepare the Environment](1-prepare-the-environment.md).
