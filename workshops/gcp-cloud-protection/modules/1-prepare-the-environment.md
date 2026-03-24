# Module 1 — Prepare the Environment

## Overview

In this module you deploy the GCP lab environment using Terraform. The template provisions networking, compute, container and storage resources.

## Steps

### 1.1 — Clone the Repository

```bash
git clone https://github.com/davidokeyode/cortex-cloud-workshop-labs.git
cd cortex-cloud-workshop-labs/workshops/gcp-cloud-protection/templates
```

### 1.2 — Configure Variables

```bash
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your project ID and region
```

### 1.3 — Deploy

```bash
terraform init
terraform plan
terraform apply -auto-approve
```

Deployment takes approximately 10–15 minutes.

### 1.4 — Verify Resources

```bash
terraform output
```

Note the output values for use in subsequent modules.

## Resources Deployed

| Resource | Name | Details |
|---|---|---|
| VPC | cortex-lab-vpc | Custom VPC with subnet |
| GCE (Linux) | cortex-lab-linux | Ubuntu 22.04, e2-medium |
| GCE (Windows) | cortex-lab-windows | Windows Server 2022, e2-medium |
| GKE | cortex-lab-gke | Standard cluster, 2 nodes |
| Artifact Registry | cortex-lab-registry | Docker repository |
| Cloud Storage | cortex-lab-bucket | Public bucket (misconfigured) |
| Cloud SQL | cortex-lab-sql | MySQL 8.0 |
| Cloud Function | cortex-lab-func | Python HTTP function |

## Next Steps

Proceed to [Module 2 — Onboard GCP Project](2-onboard-gcp-project.md).
