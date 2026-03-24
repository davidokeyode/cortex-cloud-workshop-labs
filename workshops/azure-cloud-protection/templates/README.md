# Azure Lab Templates

This folder contains the ARM templates and supporting scripts used to deploy the Azure lab environment.

## Files

| File | Description |
|---|---|
| `azure-lab-template.json` | Main ARM template for the lab environment |
| `linuxpostinstall.sh` | Post-installation script for Ubuntu VM |
| `installscript.ps1` | Initialization script for Windows VM |
| `dvwa-deployment.yaml` | Kubernetes deployment for DVWA sample app |
| `shellshock-app.yaml` | Kubernetes deployment for shellshock-vulnerable app |

## Deployment

See [Module 1 — Prepare the Environment](../modules/1-prepare-the-environment.md) for step-by-step deployment instructions.
