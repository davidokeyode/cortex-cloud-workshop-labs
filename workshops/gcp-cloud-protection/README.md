# Cortex Cloud — GCP Cloud Protection Workshop

This workshop walks you through protecting your Google Cloud Platform (GCP) environment with Palo Alto Cortex Cloud. You will onboard GCP projects, configure cloud posture management, deploy Cortex XDR agents to Compute Engine instances, scan container images in Artifact Registry and protect GKE workloads.

## Workshop Duration

3–4 hours

## Prerequisites

* Palo Alto Cortex Cloud tenant with the following modules enabled:
  * Cloud Posture Security
  * Application Security
  * Cloud Runtime Security
* GCP project with **Owner** or **Editor** role
* Cortex XDR agent installation packages
* `gcloud` CLI, `kubectl` and Helm installed locally

## Workshop Modules

| # | Module | Description |
|---|---|---|
| 0 | [Prerequisites](modules/0-prerequisites.md) | Verify accounts, permissions and tools |
| 1 | [Prepare the Environment](modules/1-prepare-the-environment.md) | Deploy GCP lab resources using Terraform |
| 2 | [Onboard GCP Project](modules/2-onboard-gcp-project.md) | Connect your GCP project to Cortex Cloud |
| 3 | [Cloud Posture Management](modules/3-cloud-posture-management.md) | Review misconfigurations and compliance |
| 4 | [Protect GCE Instances](modules/4-protect-gce-instances.md) | Deploy Cortex XDR agent to Compute Engine VMs |
| 5 | [Protect Artifact Registry Images](modules/5-protect-gar-images.md) | Scan container images in Google Artifact Registry |
| 6 | [Protect GKE Workloads](modules/6-protect-gke-workloads.md) | Deploy Cortex Cloud protection to GKE clusters |

## Lab Architecture

The Terraform template deploys the following resources:

| Resource | Details |
|---|---|
| VPC | 1 × VPC with subnets |
| GCE | 1 × Ubuntu 22.04 VM, 1 × Windows Server 2022 VM |
| GKE | 1 × GKE Standard cluster |
| Artifact Registry | 1 × Docker repository |
| Cloud Storage | 1 × Bucket (misconfigured for posture lab) |
| Cloud SQL | 1 × MySQL instance |
| Cloud Functions | 1 × HTTP-triggered function |
| IAM | Service account for Cortex Cloud onboarding |
