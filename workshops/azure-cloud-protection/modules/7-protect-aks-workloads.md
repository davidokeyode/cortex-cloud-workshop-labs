# Module 7 — Protect AKS Workloads

## Overview

In this module you deploy Cortex Cloud runtime protection to your Azure Kubernetes Service (AKS) cluster.

## Prerequisites

* AKS cluster deployed in Module 1
* `kubectl` and Helm installed

## Steps

### 7.1 — Configure kubectl

```bash
az aks get-credentials --resource-group cortex-cloud-lab-rg --name cortex-lab-aks
kubectl get nodes
```

### 7.2 — Deploy Cortex XDR Agent DaemonSet

```bash
helm repo add cortex-cloud https://demisto.github.io/cortex-helm
helm repo update

helm install cortex-xdr cortex-cloud/cortex-xdr-agent \
  --namespace cortex-system \
  --create-namespace \
  --set cluster.name=cortex-lab-aks \
  --set secret.apiKey=<your-api-key> \
  --set secret.apiKeyId=<your-api-key-id>
```

### 7.3 — Verify Deployment

```bash
kubectl get pods -n cortex-system
kubectl get daemonset -n cortex-system
```

### 7.4 — Deploy Sample Vulnerable Applications

```bash
# Deploy DVWA vulnerable web app
kubectl apply -f templates/dvwa-deployment.yaml

# Deploy a shellshock-vulnerable app
kubectl apply -f templates/shellshock-app.yaml
```

### 7.5 — Configure Runtime Policies

1. Navigate to **Cloud Runtime Security → Policies → Runtime**.
2. Create container runtime policies:
   * **Process rules**: Block reverse shells, crypto miners, reconnaissance tools
   * **Network rules**: Detect anomalous outbound connections, DNS tunneling
   * **File system rules**: Detect writes to `/etc/`, `/usr/bin/`, sensitive paths

### 7.6 — Kubernetes Admission Control

1. Navigate to **Cloud Runtime Security → Admission Control**.
2. Deploy the admission controller:

```bash
helm install cortex-admission cortex-cloud/cortex-admission-controller \
  --namespace cortex-system \
  --set apiKey=<your-api-key>
```

3. Configure admission policies:
   * Block images from untrusted registries
   * Block privileged containers
   * Block hostPath volume mounts
   * Enforce pod security standards

### 7.7 — Test Admission Control

```bash
# This should be BLOCKED by admission control
kubectl apply -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: privileged-pod
  namespace: default
spec:
  containers:
  - name: test
    image: ubuntu:latest
    securityContext:
      privileged: true
EOF
```

You should see an admission control denial message.

## Key Concepts

| Concept | Description |
|---|---|
| **DaemonSet Agent** | Cortex XDR runs on every AKS node for full visibility |
| **Runtime Policies** | Process, network and filesystem rules for containers |
| **Admission Controller** | Webhook-based policy enforcement at deploy time |
| **Pod Security** | Enforce least-privilege container configurations |

## Next Steps

Proceed to [Module 8 — Application Security](8-application-security.md).
