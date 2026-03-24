# Azure Lab Templates

This folder contains the ARM templates, scripts and Kubernetes manifests used to deploy the Azure lab environment.

## Files

| File | Description |
|---|---|
| `azure-lab-template.json` | Main ARM template — deploys VNet, VMs, AKS, ACR, SQL, Storage, Key Vault, App Service, Function App |
| `installscript.ps1` | Windows Server post-deployment script — installs Git, VS Code, Azure CLI, kubectl, Helm, Docker, .NET SDK |
| `linuxpostinstall.sh` | Ubuntu VM post-deployment script — installs Azure CLI, Docker, Docker Compose, kubectl, Helm, shellinabox |
| `dvwa-deployment.yaml` | Kubernetes Deployment + Service for DVWA vulnerable web app (runtime security testing) |
| `shellshock-app.yaml` | Kubernetes Deployment + Service for Shellshock-vulnerable app (CVE-2014-6271 detection lab) |
| `sample-data.csv` | Sample PII data uploaded to blob storage (data security / posture lab) |

## Parameters

The ARM template accepts the following parameters:

| Parameter | Default | Description |
|---|---|---|
| `username` | `azadmin` | Admin username for VMs and SQL Server |
| `password` | *(required)* | Admin password (must meet Azure complexity requirements) |
| `trustedIP` | `*` | Source IP for SSH/RDP NSG rules (CIDR notation) |
| `aksVersion` | `1.29.0` | Kubernetes version for AKS cluster |
| `storageAccountType` | `Standard_LRS` | Storage account replication type |
| `resourceTags` | `{"Workshop": "Cortex Cloud Azure Protection"}` | Tags applied to all resources |

## Resources Deployed

![Azure cloud protection lab architecture](../../../images/azure-cloud-protection/azure-lab-architecture.svg)

| Category | Resources |
|---|---|
| **Networking** | VNet (10.10.0.0/16), AKS VNet (10.0.0.0/16), VNet peering, NSG |
| **Compute** | Windows Server 2022 VM, Ubuntu 22.04 VM (both Standard_D2s_v3) |
| **Containers** | AKS cluster (2 nodes), Azure Container Registry (Basic) |
| **App Services** | Web App (Free tier), Function App (Python, Consumption) |
| **Data** | Azure SQL (Basic + AdventureWorksLT), Storage account, Key Vault |
| **Identity** | System-assigned identities on VMs, User-assigned identity for deployment scripts |

## Intentional Misconfigurations (for Posture Labs)

These misconfigurations are **intentional** and designed for the Cloud Posture Management lab module:

* Storage account — HTTPS not required, public blob access enabled, TLS 1.0
* NSG — SSH and RDP open (configurable source IP)
* SQL Server — Public network access, overly permissive firewall rules
* Key Vault — Soft delete disabled, no purge protection
* Web App — HTTPS not enforced, TLS 1.0, FTPS allowed

## Deployment

See [Module 1 — Prepare the Environment](../modules/1-prepare-the-environment.md) for step-by-step deployment instructions.

### Quick Deploy

```bash
# Create resource group
az group create --name cortex-cloud-lab-rg --location eastus

# Deploy
az deployment group create \
  --resource-group cortex-cloud-lab-rg \
  --template-file azure-lab-template.json \
  --parameters password='<YourStrongPassword>' trustedIP='<YourPublicIP>/32'
```
