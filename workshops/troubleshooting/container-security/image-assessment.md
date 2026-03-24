# Container Image Assessment Troubleshooting

## Supported Image Formats

| Format | Supported |
|---|---|
| Docker Image Manifest V2, Schema 2 | ✅ Yes |
| OCI Image Manifest | ✅ Yes |
| Docker Image Manifest V2, Schema 1 | ❌ No |

## Image Size Limits

| Parameter | Limit |
|---|---|
| Maximum image layer size | 10 GB |
| Maximum total image size | 40 GB |
| Maximum number of layers | 128 |

## Common Issues

### Scan Not Completing

1. **Check image format**: Ensure the image uses a supported manifest format.
2. **Check image size**: Large images may take longer or exceed limits.
3. **Registry connectivity**: Verify Cortex Cloud can reach the registry.

### Missing Vulnerabilities

1. **OS detection**: Verify the base OS is recognized.
2. **Package manager**: Ensure packages are installed via the OS package manager (apt, yum, apk).
3. **Custom binaries**: Statically-linked binaries may not be detected.

### Registry Authentication

| Registry | Authentication Method |
|---|---|
| ECR | IAM role (cross-account) |
| ACR | Service principal or managed identity |
| GAR | Service account key |
| Docker Hub | Username/password or access token |
| Harbor | Username/password or robot account |
| GCR | Service account key |
