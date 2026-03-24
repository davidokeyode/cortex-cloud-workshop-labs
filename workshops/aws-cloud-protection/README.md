# Cortex Cloud — AWS Cloud Protection Workshop

This workshop walks you through protecting your AWS cloud environment with Palo Alto Cortex Cloud. You will onboard AWS accounts, configure cloud posture management, deploy Cortex XDR agents to EC2 instances, scan container images, protect EKS and ECS workloads, and integrate with Cortex Cloud APIs.

## Workshop Duration

4–6 hours (can be spread over 1–2 days)

## Prerequisites

* Palo Alto Cortex Cloud tenant with the following modules enabled:
  * Cloud Posture Security
  * Application Security
  * Cloud Runtime Security
* AWS account with **Administrator** access
* Cortex XDR agent installation packages
* AWS CLI and `kubectl` installed locally
* A GitHub account (for IaC scanning labs)

## Workshop Modules

| # | Module | Description |
|---|---|---|
| 0 | [Prerequisites](modules/0-prerequisites.md) | Verify accounts, permissions and tools |
| 1 | [Prepare the Environment](modules/1-prepare-the-environment.md) | Deploy AWS lab resources using CloudFormation |
| 2 | [Onboard AWS Account](modules/2-onboard-aws-account.md) | Connect your AWS account to Cortex Cloud |
| 3 | [Cloud Posture Management](modules/3-cloud-posture-management.md) | Review misconfigurations, compliance and SmartScore |
| 4 | [Protect EC2 Instances](modules/4-protect-ec2-instances.md) | Deploy Cortex XDR agent to Linux and Windows EC2 instances |
| 5 | [IaC Scanning](modules/5-iac-scanning.md) | Scan Terraform, CloudFormation and Dockerfile templates |
| 6 | [Protect ECR Images](modules/6-protect-ecr-images.md) | Connect Amazon ECR and scan container images |
| 7 | [Protect EKS Workloads](modules/7-protect-eks-workloads.md) | Deploy Cortex Cloud defenders to EKS clusters |
| 8 | [Protect ECS Workloads](modules/8-protect-ecs-workloads.md) | Protect ECS Fargate and EC2-based container workloads |
| 9 | [Agentless Scanning](modules/9-agentless-scanning.md) | Configure agentless scanning for EC2 snapshots |
| 10 | [API Integration](modules/10-api-integration.md) | Automate with Cortex Cloud Platform APIs |

## Lab Architecture

The CloudFormation template deploys the following resources:

| Resource | Details |
|---|---|
| VPC | 1 × VPC with public and private subnets |
| EC2 | 1 × Amazon Linux 2, 1 × Windows Server 2022 |
| EKS | 1 × EKS cluster with managed node group |
| ECS | 1 × ECS Fargate cluster, 1 × ECS EC2 cluster |
| ECR | 2 × ECR repositories |
| S3 | 1 × S3 bucket (misconfigured for posture lab) |
| Lambda | 1 × Lambda function |
| RDS | 1 × RDS instance |
| IAM | Cross-account role for Cortex Cloud onboarding |
