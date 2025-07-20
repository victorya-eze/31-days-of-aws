 Day 20 of 31 – AWS ECS Fargate with Terraform

This Terraform configuration sets up an ECS Fargate service using the `nginx` image. It's perfect for deploying containerized applications without needing to manage servers.

What You'll Create
- An ECS cluster
- IAM Role with permissions for ECS task execution
- Fargate Task Definition running NGINX
- Fargate Service with networking

Requirements
- VPC with at least one public subnet
- A security group that allows port 80 inbound
- Terraform installed
- AWS CLI configured

1. Replace "<your-subnet-id>" and "<your-sg-id>" with actual subnet and security group IDs. You can point the container to a custom Docker image instead of nginx.
2. **Initialize Terraform**


## Usage

```bash
terraform init
terraform apply

# Once finished, clean up
terraform destroy
```

