# Day 9 – AWS API Gateway + Lambda

This example sets up:
- An HTTP API Gateway
- A route: GET /hello
- A Lambda function triggered by that route

## Steps

1. Write your Lambda handler in `index.js`
2. Zip it: `zip lambda_function_payload.zip index.js`
3. Deploy with Terraform


terraform init
terraform apply

PS: don't forget to always cleanup

terraform destroy