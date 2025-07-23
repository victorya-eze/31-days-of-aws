provider "aws" {
  region = "us-east-1"
}

resource "aws_kms_key" "my_key" {
  description             = "My customer-managed KMS key"
  deletion_window_in_days = 10
  enable_key_rotation     = true
}

resource "aws_kms_alias" "my_key_alias" {
  name          = "alias/my-key"
  target_key_id = aws_kms_key.my_key.key_id
}
