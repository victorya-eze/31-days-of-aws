# Day 18 of #31DaysOfAWS — AWS ECR

What This Code Does

- Provisions an ECR repository named `my-app-repo`
- Enables image scanning on push
- Sets image tag mutability to `MUTABLE`
- Outputs the full repository URL after creation


## Usage

```bash
terraform init
terraform apply

# Once finished, clean up
terraform destroy
```