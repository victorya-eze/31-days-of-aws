Day 23 of 31 - AWS Systems Manager with EC2 and Custom SSM Document

This Terraform project sets up an EC2 instance configured to work with AWS Systems Manager (SSM), and deploys a custom SSM Document that can run a simple shell script on the instance.

---

What It Deploys

- An **EC2 instance** (Amazon Linux 2)
- An **IAM Role & Instance Profile** with `AmazonSSMManagedInstanceCore` permission
- A **custom SSM Document** (`RunShellScriptCustom`) that:
  - Prints a greeting message
  - Shows the system uptime


## Usage

```bash
terraform init
terraform apply

# Once finished, clean up
terraform destroy
```
