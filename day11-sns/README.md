Day 11 – Amazon SNS with Terraform
This Terraform configuration sets up an Amazon Simple Notification Service (SNS) topic with an email subscription and sends a test message using the AWS CLI.

What It Does
Provisions an SNS Topic named app-alerts-topic

Subscribes your email to the topic

Publishes a test message after subscription using a local exec block

## Usage

```bash
terraform init
terraform apply

# Once finished, clean up
terraform destroy
```
