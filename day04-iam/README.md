# Day 4 – AWS IAM

This example provisions a simple IAM setup:
- an IAM user and group
- a custom policy granting read-only access to S3
- the policy attached to the group the user belongs to
- a role for Lambda functions with the basic execution policy attached

## Usage

```bash
terraform init
terraform apply

# Once finished, clean up
terraform destroy
```
