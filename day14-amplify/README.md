# Day 14 of 31 – AWS Amplify

This project demonstrates how to deploy a web application using AWS Amplify


What is AWS Amplify?

AWS Amplify is a fully managed service that enables developers to build, deploy, and host full-stack web and mobile applications. It supports popular frontend frameworks like:

- React
- Angular
- Vue
- Next.js
- Gatsby
- Static HTML/CSS/JS websites

Amplify also supports backend services 

 What This Code Does

This Terraform code:
- Creates an **Amplify app** connected to your GitHub repository
- Configures a **build spec** to build and deploy your app
- Creates an **IAM role** that Amplify uses to manage deployment
- Automatically triggers deployments when code is pushed to the main branch

---

Requirements

Before using this Terraform code, make sure you have the following:

 1. A GitHub Repository

Your GitHub repository should contain a supported web application project. Examples include:
- A React app created with `create-react-app`
- A Vue or Angular app scaffolded via CLI
- A static website with an `index.html` in the root folder or in a `build/` directory

A GitHub Personal Access Token

Your token must have the following scopes:
- `repo`
- `admin:repo_hook`

 **Do not hardcode your token!** Use `.tfvars` or environment variables for sensitive values.

## Usage

```bash
terraform init
terraform apply

# Once finished, clean up
terraform destroy
```