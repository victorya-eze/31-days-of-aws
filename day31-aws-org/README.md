Day 31 of 31 – AWS Organizations

This project sets up AWS Organizations using Terraform. It creates:

- An AWS Organization with full features enabled
- An Organizational Unit (OU) named "Engineering"
- A new AWS account under the "Engineering" OU

## Usage

```bash
terraform init
terraform apply

# Once finished, clean up
terraform destroy
```
