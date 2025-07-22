Day 22 of 31 – AWS CloudTrail
This Terraform setup enables AWS CloudTrail, which helps you monitor and log activity across your AWS infrastructure. All logs are stored in an S3 bucket for easy access and auditing.

📦 What This Terraform Code Does
Creates an S3 bucket for CloudTrail logs

Applies the required bucket policy to allow CloudTrail to write logs

Logs both read and write events, including management events

Enables log file validation

## Usage

```bash
terraform init
terraform apply

# Once finished, clean up
terraform destroy
```

