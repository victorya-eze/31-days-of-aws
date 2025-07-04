variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "user_name" {
  description = "IAM user name"
  default     = "dev-user"
}

variable "group_name" {
  description = "IAM group name"
  default     = "dev-group"
}

provider "aws" {
  region = var.region
}

resource "aws_iam_group" "dev_group" {
  name = var.group_name
}

resource "aws_iam_user" "dev_user" {
  name = var.user_name
}

resource "aws_iam_group_membership" "dev_membership" {
  name  = "${var.group_name}-membership"
  users = [aws_iam_user.dev_user.name]
  group = aws_iam_group.dev_group.name
}

data "aws_iam_policy_document" "s3_read" {
  statement {
    actions   = ["s3:Get*", "s3:List*"]
    resources = ["*"]
    effect    = "Allow"
  }
}

resource "aws_iam_policy" "s3_read_policy" {
  name        = "S3ReadOnly"
  description = "Allow read-only access to S3"
  policy      = data.aws_iam_policy_document.s3_read.json
}

resource "aws_iam_group_policy_attachment" "attach_s3_read" {
  group      = aws_iam_group.dev_group.name
  policy_arn = aws_iam_policy.s3_read_policy.arn
}

data "aws_iam_policy_document" "lambda_assume" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda_exec_role" {
  name               = "lambda-exec-role"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume.json
}

resource "aws_iam_role_policy_attachment" "lambda_basic" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
