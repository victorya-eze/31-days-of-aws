# Day 2 – AWS EC2

This Terraform script creates:
- An EC2 instance (Amazon Linux 2)
- A key pair
- A security group that allows SSH
- A public IP for easy access

## Usage

```bash
terraform init
terraform plan
terraform apply


➡️ Access your EC2 with: ssh -i ec2-key.pem ec2-user@<your-ec2-public-ip>

Remember to chmod 400 ec2-key.pem before connecting.

Remember to terminate the instance

terraform destroy
