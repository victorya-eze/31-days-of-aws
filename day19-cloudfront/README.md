Day 19 of #31DaysOfAWS — AWS CloudFront + S3 Static Site

This project uses Terraform to deploy a simple static website hosted on **Amazon S3** and delivered globally via **Amazon CloudFront** (CDN).

---

## 🧾 What It Does

- Creates an S3 bucket configured for static website hosting
- Sets a public read policy for the bucket
- Provisions a CloudFront distribution that points to the S3 website
- Outputs the CloudFront domain name to access your site


## Usage

```bash
terraform init
terraform apply

# Once finished, clean up
terraform destroy
```