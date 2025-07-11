provider "aws" {
  region = "us-east-1"
}

# Create SNS Topic
resource "aws_sns_topic" "app_alerts" {
  name = "app-alerts-topic"
}

# Email subscription (please change this emal path to your real email)
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.app_alerts.arn
  protocol  = "email"
  endpoint  = "victory.eze@example.com"  # Replace this to your email!
}

# Output topic ARN
output "sns_topic_arn" {
  value = aws_sns_topic.app_alerts.arn
}

# Send test message (runs locally after apply)
resource "null_resource" "sns_test_publish" {
  provisioner "local-exec" {
    command = <<EOT
      aws sns publish \
        --topic-arn ${aws_sns_topic.app_alerts.arn} \
        --message "🚀 Test message from Day 11 of #31DaysOfAWS!" \
        --subject "SNS Test from Terraform"
    EOT
  }

  # Ensure this runs after subscription is created
  depends_on = [aws_sns_topic_subscription.email_subscription]
}
