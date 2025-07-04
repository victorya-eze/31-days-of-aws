provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "dev_user" {
  name = "dev-user"
}

resource "aws_iam_policy" "s3_read_policy" {
  name        = "S3ReadOnly"
  description = "Allow read-only access to S3"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = [
        "s3:Get*",
        "s3:List*"
      ]
      Effect   = "Allow"
      Resource = "*"
    }]
  })
}

resource "aws_iam_user_policy_attachment" "attach_s3_read" {
  user       = aws_iam_user.dev_user.name
  policy_arn = aws_iam_policy.s3_read_policy.arn
}

resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda-exec-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}
