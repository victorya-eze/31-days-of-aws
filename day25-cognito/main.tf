provider "aws" {
  region = "us-east-1"
}

resource "aws_cognito_user_pool" "user_pool" {
  name = "day25-user-pool"

  auto_verified_attributes = ["email"]

  password_policy {
    minimum_length    = 8
    require_lowercase = true
    require_uppercase = true
    require_numbers   = true
    require_symbols   = false
  }

  tags = {
    Name = "Day25CognitoUserPool"
  }
}

resource "aws_cognito_user_pool_client" "user_pool_client" {
  name         = "day25-user-pool-client"
  user_pool_id = aws_cognito_user_pool.user_pool.id
  generate_secret = false

  explicit_auth_flows = [
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_SRP_AUTH",
    "ALLOW_CUSTOM_AUTH"
  ]
}
