Day 17 of 31 – AWS Secrets Manager

AWS Secrets Manager is a fully managed service that enables you to securely store, retrieve, rotate, and manage secrets like:

- Database credentials
- API keys
- Passwords
- Any other sensitive information

What This Terraform Code Does

- Create a Secrets Manager secret named `my-app-secret`
- Store a version with a `username` and `password` in JSON format
- Output the ARN of the secret so you can reference it in other modules (e.g., Lambda, ECS, EC2, etc.)

## Usage

```bash
terraform init
terraform apply

# Once finished, clean up
terraform destroy
```

