# Day 5 – AWS Security Groups

This Terraform config includes:

- Inbound rules:
  - SSH (port 22) from your computer ip
  - HTTP (port 80) from 0.0.0.0/0
- Outbound:
  - All traffic allowed


## Usage

```bash
terraform init
terraform apply

# Once finished, clean up
terraform destroy
```
