Day 23 of 31 – AWS KMS Explained

## What is AWS KMS?

AWS Key Management Service (KMS) is a secure and fully managed service that helps you create and control cryptographic keys used to protect your data. It enables encryption and decryption for a wide range of AWS services and applications.

### Key Features
- Centralized key management
- Key rotation and audit
- Seamless integration with AWS services
- Fine-grained access control

This simple Terraform script provisions:

- A KMS Key with a 10-day deletion window  
- Key rotation enabled  
- An alias (`alias/my-key`) for easier reference  

## Usage

```bash
terraform init
terraform apply

# Once finished, clean up
terraform destroy
```