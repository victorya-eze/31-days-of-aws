provider "aws" {
  region = "us-east-1"
}

resource "aws_secretsmanager_secret" "app_secret" {
  name        = "my-app-secret"
  description = "Secret for my application credentials"
}

resource "aws_secretsmanager_secret_version" "app_secret_version" {
  secret_id     = aws_secretsmanager_secret.app_secret.id
  secret_string = jsonencode({
    username = "myadmin"
    password = "MySecureP@ssw0rd!"
  })
}

output "secret_arn" {
  value = aws_secretsmanager_secret.app_secret.arn
}
