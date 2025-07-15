Day 15 of 31DaysOfAWS — Auto Scaling Group with Terraform

Today’s AWS resource is the powerful **Auto Scaling Group (ASG)**.

This Terraform configuration sets up a highly available and fault-tolerant infrastructure that automatically scales EC2 instances based on capacity settings.


What This Deploys

- A new **VPC**
- Two **public subnets** in different availability zones
- An **Internet Gateway** and public **Route Table**
- A **Security Group** for HTTP and SSH access
- A **Launch Template** that:
  - Uses the latest Amazon Linux 2 AMI
  - Installs and serves a basic Apache web page
- An **Auto Scaling Group** that:
  - Maintains 2 EC2 instances (min: 1, max: 3)
  - Replaces unhealthy instances automatically

## Usage

```bash
terraform init
terraform apply

# Once finished, clean up
terraform destroy
```
