# Day 12 of 31 – AWS SQS Explained

This Terraform creates a **Standard SQS Queue**.

What it does

- Creates an SQS queue called `my-standard-queue`
- Sets a 30-second visibility timeout
- Keeps messages for 1 day

## Usage

```bash
terraform init
terraform apply

# Once finished, clean up
terraform destroy
```


To send a test message using AWS CLI:

``` bash

aws sqs send-message \
  --queue-url $(terraform output -raw queue_url) \ (the output url you got from the terraform apply)
  --message-body "Hello from Day 12 of 31DaysOfAWS!"