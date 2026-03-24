# Kubernetes Defender Troubleshooting

## Common Issues

### DaemonSet Pods Not Running

```bash
# Check pod status
kubectl get pods -n cortex-system
kubectl describe pod <pod-name> -n cortex-system

# Check events
kubectl get events -n cortex-system --sort-by='.lastTimestamp'
```

### Common Pod Failure Reasons

| Issue | Resolution |
|---|---|
| `ImagePullBackOff` | Verify registry credentials and image path |
| `CrashLoopBackOff` | Check pod logs: `kubectl logs <pod> -n cortex-system` |
| `Pending` | Check node resources: `kubectl describe node` |
| `OOMKilled` | Increase memory limits in Helm values |

### Admission Controller Not Working

1. **Check webhook configuration**:

```bash
kubectl get validatingwebhookconfigurations
kubectl get mutatingwebhookconfigurations
```

2. **Check admission controller logs**:

```bash
kubectl logs -l app=cortex-admission-controller -n cortex-system
```

3. **Test admission**:

```bash
# Try deploying a privileged pod (should be blocked if policy is configured)
kubectl apply -f - <<EOF
apiVersion: v1
kind: Pod
metadata:
  name: test-privileged
spec:
  containers:
  - name: test
    image: ubuntu:latest
    securityContext:
      privileged: true
EOF
```

### Helm Upgrade Issues

```bash
# Check current release
helm list -n cortex-system

# Upgrade with values
helm upgrade cortex-xdr cortex-cloud/cortex-xdr-agent \
  --namespace cortex-system \
  --reuse-values \
  --set image.tag=<new-version>

# Rollback if needed
helm rollback cortex-xdr -n cortex-system
```
