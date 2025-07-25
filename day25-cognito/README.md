Day 25 of 31 – AWS cognito Explained

in this terraform script, we:

Creates a Cognito User Pool named day25-user-pool

Enforces a password policy

Auto-verifies email addresses

Sets up a User Pool Client that allows common auth flows

## Usage

```bash
terraform init
terraform apply

# Once finished, clean up
terraform destroy
```