# Billing and Operational Costs

## Cortex Cloud Licensing

Cortex Cloud is licensed based on:

| License Type | Metric |
|---|---|
| **Cloud Posture** | Number of cloud resources scanned |
| **Runtime Security** | Number of protected workloads (agents + agentless) |
| **Application Security** | Number of code repositories scanned |
| **Data Security** | Amount of data classified |

## Cloud Provider Operational Costs

### AWS

| Component | Cost Factor |
|---|---|
| CloudTrail events | Event volume-based |
| EBS snapshots (agentless) | Snapshot storage |
| Cross-account API calls | Minimal |
| Data transfer | Egress from agent to Cortex Cloud |

### Azure

| Component | Cost Factor |
|---|---|
| Activity Log export | Log volume-based |
| Disk snapshots (agentless) | Snapshot storage |
| Service principal API calls | Minimal |
| Data transfer | Egress from agent to Cortex Cloud |

### GCP

| Component | Cost Factor |
|---|---|
| Audit log export | Log volume-based |
| Disk snapshots (agentless) | Snapshot storage |
| Service account API calls | Minimal |
| Data transfer | Egress from agent to Cortex Cloud |

## Cost Optimization Tips

* Use tag-based scanning to limit agentless scan scope
* Configure scan frequency to match risk tolerance (24h vs. 12h)
* Use agent-based protection for high-value workloads
* Use agentless scanning for development/staging environments
