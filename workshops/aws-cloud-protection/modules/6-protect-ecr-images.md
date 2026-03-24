# Module 6 — Protect ECR Images

## Overview

In this module you connect Amazon Elastic Container Registry (ECR) to Cortex Cloud for automated container image scanning. Cortex Cloud scans images for vulnerabilities, compliance violations, malware and secrets.

## Steps

### 6.1 — Connect ECR Registry

1. Navigate to **Cloud Runtime Security → Registry Scanning → Add Registry**.
2. Select **Amazon Elastic Container Registry (ECR)**.
3. Provide the connection details:
   * **AWS Account ID**: Your lab AWS account ID
   * **Region**: Your lab region
   * **Authentication**: Use the cross-account IAM role created during onboarding
4. Click **Add** and wait for the connection to be validated.

### 6.2 — Push a Sample Image

```bash
# Authenticate to ECR
aws ecr get-login-password --region <region> | docker login --username AWS --password-stdin <account-id>.dkr.ecr.<region>.amazonaws.com

# Pull a sample vulnerable image
docker pull vulnerables/web-dvwa:latest

# Tag and push to ECR
docker tag vulnerables/web-dvwa:latest <account-id>.dkr.ecr.<region>.amazonaws.com/cortex-lab-ecr:dvwa
docker push <account-id>.dkr.ecr.<region>.amazonaws.com/cortex-lab-ecr:dvwa
```

### 6.3 — Review Scan Results

1. Navigate to **Cloud Runtime Security → Registry Scanning**.
2. Select your ECR registry and the pushed image.
3. Review the scan results:
   * **Vulnerabilities** — CVEs with severity, CVSS score and fix version
   * **Compliance** — Container best practice violations
   * **Packages** — Full software bill of materials (SBOM)

### 6.4 — Configure Image Policies

1. Navigate to **Cloud Runtime Security → Policies → Vulnerability**.
2. Create or edit a policy to:
   * Block images with critical vulnerabilities from being deployed
   * Alert on images older than 30 days
   * Require base image updates

## Key Concepts

| Concept | Description |
|---|---|
| **Registry Scanning** | Automated scanning of container images in registries |
| **SBOM** | Software Bill of Materials listing all packages in an image |
| **Vulnerability Policies** | Rules defining acceptable risk levels for container images |
| **Trusted Images** | Allowlist of approved base images and registries |

## Next Steps

Proceed to [Module 7 — Protect EKS Workloads](7-protect-eks-workloads.md).
