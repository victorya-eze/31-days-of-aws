README: Day 10 – CloudWatch from EC2 (Terraform)
This Terraform project provisions an EC2 instance with the CloudWatch agent installed and configured to push memory and disk metrics to Amazon CloudWatch.

What This Does
Creates an IAM role with CloudWatch permissions

Launches a t2.micro EC2 instance (Amazon Linux 2)

Installs and configures the CloudWatch Agent

Sends custom metrics (memory & disk usage) to CloudWatch every 60 seconds

# Usage

```bash
terraform init
terraform apply

```

After instance is running:

Go to CloudWatch → Metrics → CWAgent to view:

Memory usage (%)

Disk usage (%)

after all

```bash

terraform destroy