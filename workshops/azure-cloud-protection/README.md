# Cortex Cloud — Azure Cloud Protection Workshop

This workshop walks you through protecting your Azure cloud environment with Palo Alto Cortex Cloud. You will onboard Azure subscriptions, configure cloud posture management, deploy Cortex XDR agents to virtual machines, scan container images, protect AKS workloads, integrate application security and configure SIEM integration.

## Workshop Duration

5–7 hours (can be spread over 1–2 days)

## Prerequisites

* Palo Alto Cortex Cloud tenant with the following modules enabled:
  * Cloud Posture Security
  * Application Security
  * Cloud Runtime Security
* Azure subscription with **Owner** access
* Cortex XDR agent installation packages
* Azure CLI, `kubectl` and Helm installed locally
* A GitHub account (for IaC scanning labs)
* An Azure DevOps organization (for CI/CD integration labs)

## Workshop Modules

| # | Module | Description |
|---|---|---|
| 0 | [Prerequisites](modules/0-prerequisites.md) | Verify accounts, permissions and tools |
| 1 | [Prepare the Environment](modules/1-prepare-the-environment.md) | Deploy Azure lab resources using ARM template |
| 2 | [Onboard Azure Subscription](modules/2-onboard-azure-subscription.md) | Connect your Azure subscription to Cortex Cloud |
| 3 | [Cloud Posture Management](modules/3-cloud-posture-management.md) | Review misconfigurations, compliance and SmartScore |
| 4a | [Protect Linux VMs](modules/4a-protect-linux-vm.md) | Deploy Cortex XDR agent to Linux virtual machines |
| 4b | [Protect Windows VMs](modules/4b-protect-windows-vm.md) | Deploy Cortex XDR agent to Windows virtual machines |
| 5 | [IaC Scanning](modules/5-iac-scanning.md) | Scan ARM, Bicep, Terraform and Dockerfile templates |
| 6 | [Protect ACR Images](modules/6-protect-acr-images.md) | Connect Azure Container Registry and scan container images |
| 7 | [Protect AKS Workloads](modules/7-protect-aks-workloads.md) | Deploy Cortex Cloud defenders to AKS clusters |
| 8 | [Application Security](modules/8-application-security.md) | Scan web applications and function apps |
| 9 | [Container Apps Protection](modules/9-container-apps-protection.md) | Protect Azure Container Instances and Container Apps |
| 10 | [SIEM Integration](modules/10-siem-integration.md) | Integrate with Cortex XSIAM and third-party SIEMs |

## Lab Architecture

The ARM template deploys the following resources:

| Resource | Details |
|---|---|
| Virtual Network | 1 × VNet with subnets |
| VMs | 1 × Ubuntu 22.04, 1 × Windows Server 2022 |
| AKS | 1 × AKS cluster with system node pool |
| ACR | 1 × Azure Container Registry |
| App Service | 1 × Web App, 1 × Function App |
| SQL | 1 × Azure SQL Server + Database |
| Storage | 1 × Storage account (misconfigured) |
| Key Vault | 1 × Key Vault |
| NSG | Network security groups with intentional misconfigurations |
