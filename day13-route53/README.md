# Day 13 of 31 — AWS Route 53 with Terraform

Update variables
 - In `variables`, change `domain_name` and `record_ip` to your own domain name and ip of your ec2 instance.

 if you don't have a domain name, never mind just use the example as in the script just that you cannot access it.

 ## Usage

```bash
terraform init
terraform apply

# Once finished, clean up
terraform destroy
```