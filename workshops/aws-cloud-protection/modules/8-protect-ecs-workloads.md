# Module 8 — Protect ECS Workloads

## Overview

In this module you protect containerized workloads running on Amazon ECS — both Fargate and EC2 launch types.

## Steps

### 8.1 — ECS Fargate Protection

For Fargate tasks, Cortex Cloud uses a sidecar-based approach:

1. Navigate to **Cloud Runtime Security → Defenders → Deploy → ECS Fargate**.
2. Download the task definition modifier or use the API to inject the Cortex defender sidecar.
3. Update your ECS task definition:

```json
{
  "containerDefinitions": [
    {
      "name": "my-app",
      "image": "<account-id>.dkr.ecr.<region>.amazonaws.com/cortex-lab-ecr:app",
      "essential": true
    },
    {
      "name": "cortex-defender",
      "image": "<cortex-defender-image>",
      "essential": true,
      "environment": [
        { "name": "CORTEX_API_KEY", "value": "<api-key>" },
        { "name": "CORTEX_CLUSTER", "value": "cortex-lab-ecs-fargate" }
      ]
    }
  ]
}
```

4. Register the updated task definition and update the ECS service.

### 8.2 — ECS EC2 Protection

For EC2-based ECS, the Cortex XDR agent is installed on the underlying EC2 instances:

1. Include the Cortex XDR agent installation in the ECS-optimized AMI user data.
2. Or deploy the agent via AWS Systems Manager:

```bash
aws ssm send-command \
  --document-name "AWS-RunShellScript" \
  --targets Key=tag:aws:ecs:clusterName,Values=cortex-lab-ecs-ec2 \
  --parameters commands=["rpm -ivh /tmp/cortex-xdr-agent.rpm"]
```

### 8.3 — Verify Protection

1. Navigate to **Assets → Containers**.
2. Confirm ECS tasks appear with defender status **Connected**.
3. Run a test container and verify runtime events are captured.

## Key Concepts

| Concept | Description |
|---|---|
| **Fargate Sidecar** | Defender container injected alongside application container |
| **EC2 Host-Based** | Agent installed on underlying EC2 instances protects all containers |
| **Task Definition** | ECS configuration defining containers, resources and networking |

## Next Steps

Proceed to [Module 9 — Agentless Scanning](9-agentless-scanning.md).
