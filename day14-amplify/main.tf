provider "aws" {
  region = "us-east-1"
}

resource "aws_amplify_app" "my_amplify_app" {
  name                = "my-amplify-app"
  repository          = "https://github.com/YOUR_GITHUB_USERNAME/YOUR_REPO_NAME"
  access_token        = var.github_token
  iam_service_role_arn = aws_iam_role.amplify_service.arn

  build_spec = <<EOT
version: 1.0
frontend:
  phases:
    preBuild:
      commands:
        - npm install
    build:
      commands:
        - npm run build
  artifacts:
    baseDirectory: build
    files:
      - '**/*'
  cache:
    paths:
      - node_modules/**/*
EOT
}

resource "aws_iam_role" "amplify_service" {
  name = "amplify-service-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "amplify.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "amplify_attach" {
  role       = aws_iam_role.amplify_service.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess-Amplify"
}
