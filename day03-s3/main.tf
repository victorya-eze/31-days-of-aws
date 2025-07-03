provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "day3-my-aws-bucket-${random_id.bucket_suffix.hex}"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "Day3-S3-Bucket"
    Environment = "Dev"
  }
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}
