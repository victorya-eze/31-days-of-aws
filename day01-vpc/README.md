# Day 1 – AWS VPC

This Terraform script provisions:

- 1 VPC (`10.0.0.0/16`)
- 2 Public Subnets (with auto public IP)
- 2 Private Subnets
- 1 Internet Gateway
- Routing for public subnets

## How to Use

```bash
terraform init
terraform apply

Note: Make sure you have your AWS credentials configured (aws configure) or exported as environment variables.