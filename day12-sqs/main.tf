provider "aws" {
  region = "us-east-1"
}

resource "aws_sqs_queue" "standard_queue" {
  name                      = "my-standard-queue"
  delay_seconds            = 0
  visibility_timeout_seconds = 30
  message_retention_seconds = 86400  # 1 day
}


output "queue_url" {
  value = aws_sqs_queue.standard_queue.id
}

output "queue_arn" {
  value = aws_sqs_queue.standard_queue.arn
}