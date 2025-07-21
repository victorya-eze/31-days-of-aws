Day 21 of 31 – AWS EKS 



Today, we're diving into **Amazon Elastic Kubernetes Service (EKS)** — a fully managed Kubernetes service by AWS that simplifies running containerized applications at scale.

What You'll Build

With this Terraform module, you'll provision:

-  An EKS Cluster (`v1.30`)
-  A Node Group with EC2 instances (t3.medium)
-  Tagged resources for better organization

## Usage

```bash
terraform init
terraform apply

# Once finished, clean up
terraform destroy
```
