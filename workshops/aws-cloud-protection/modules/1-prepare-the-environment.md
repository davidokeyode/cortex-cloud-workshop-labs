# Module 1 — Prepare the Environment

## Overview

In this module you deploy the AWS lab environment using a CloudFormation template. The template provisions networking, compute, container and storage resources that will be used throughout the workshop.

## Steps

### 1.1 — Download the CloudFormation Template

Download the lab template from the `templates/` folder in this repository:

```bash
git clone https://github.com/davidokeyode/cortex-cloud-workshop-labs.git
cd cortex-cloud-workshop-labs/workshops/aws-cloud-protection/templates
```

### 1.2 — Deploy the CloudFormation Stack

```bash
aws cloudformation create-stack \
  --stack-name cortex-cloud-lab \
  --template-body file://aws-lab-template.yml \
  --capabilities CAPABILITY_NAMED_IAM \
  --parameters ParameterKey=KeyPairName,ParameterValue=<your-key-pair>
```

> **Note:** Replace `<your-key-pair>` with the name of an existing EC2 key pair in your region.

### 1.3 — Wait for Deployment

```bash
aws cloudformation wait stack-create-complete --stack-name cortex-cloud-lab
```

Deployment takes approximately 15–20 minutes.

### 1.4 — Verify Resources

```bash
aws cloudformation describe-stacks --stack-name cortex-cloud-lab --query 'Stacks[0].Outputs'
```

Note the output values — you will use these in subsequent modules.

## Resources Deployed

| Resource | Name | Details |
|---|---|---|
| VPC | cortex-lab-vpc | 10.0.0.0/16 with 2 public and 2 private subnets |
| EC2 (Linux) | cortex-lab-linux | Amazon Linux 2, t3.medium |
| EC2 (Windows) | cortex-lab-windows | Windows Server 2022, t3.medium |
| EKS Cluster | cortex-lab-eks | Kubernetes 1.29, 2-node managed node group |
| ECS Fargate | cortex-lab-ecs-fargate | Fargate cluster with sample service |
| ECR | cortex-lab-ecr | 2 repositories for container image labs |
| S3 | cortex-lab-bucket | Intentionally misconfigured (public access) |
| RDS | cortex-lab-db | MySQL 8.0, db.t3.micro |
| Lambda | cortex-lab-function | Python 3.12 function |

## Next Steps

Proceed to [Module 2 — Onboard AWS Account](2-onboard-aws-account.md).
