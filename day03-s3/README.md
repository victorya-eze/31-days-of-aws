# Day 3 – AWS S3

This example creates:
- A private S3 bucket
- Versioning enabled
- Unique name using `random_id`

## How to Use

```bash
terraform init
terraform apply

Also, you can try uploading objects to you bucket using aws cli

Use the AWS console or CLI to test uploads:

aws s3 cp myfile.txt s3://<bucket-name>

myfile.txt is the name of the file you wish to upload existing on your computer and in the path.

PS: always never forget to destroy

terraform destroy
```
