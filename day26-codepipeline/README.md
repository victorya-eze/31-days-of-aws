Day 23 of 31 - AWS CodePipeline

This Terraform configuration sets up an automated CI/CD pipeline using **AWS CodePipeline**, integrated with **GitHub (via CodeStar Connection)**, **CodeBuild**, and **CloudFormation** for deployment.

What This Deploys

- An S3 bucket for artifact storage (with public access blocked)
- A CodeStar connection to GitHub
- A multi-stage CodePipeline: Source → Build → Deploy
- IAM roles and policies for CodePipeline access
- Optional encryption with KMS

Prerequisites

Before applying this Terraform config, ensure the following:

- You have a GitHub repository with source code
- You’ve created a CodeBuild project with buildspec
- A valid KMS key exists with alias `alias/myKmsKey` *(or update it via `kms_alias_name` variable)*
- GitHub connection via CodeStar has been created (Terraform will create it but you need to authorize it from AWS Console)

## Usage

```bash
terraform init
terraform apply

# Once finished, clean up
terraform destroy
```