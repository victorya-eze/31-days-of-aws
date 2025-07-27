provider "aws" {
  region = "us-east-1"
}

# IAM Role for SSM access
resource "aws_iam_role" "ssm_role" {
  name = "ssm_ec2_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_core_attach" {
  role       = aws_iam_role.ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# Instance profile
resource "aws_iam_instance_profile" "ssm_profile" {
  name = "ssm_instance_profile"
  role = aws_iam_role.ssm_role.name
}

# EC2 instance with SSM enabled
resource "aws_instance" "ssm_instance" {
  ami                    = "ami-0c02fb55956c7d316" # Amazon Linux 2 (adjust as needed)
  instance_type          = "t2.micro"
  iam_instance_profile   = aws_iam_instance_profile.ssm_profile.name

  tags = {
    Name = "SSM-Managed-Instance"
  }
}

# SSM Document to run a custom shell script
resource "aws_ssm_document" "shell_script" {
  name          = "RunShellScriptCustom"
  document_type = "Command"

  content = jsonencode({
    schemaVersion = "2.2",
    description   = "Run a simple shell script",
    mainSteps = [
      {
        action = "aws:runShellScript",
        name   = "runShellScript",
        inputs = {
          runCommand = [
            "echo Hello from SSM",
            "uptime"
          ]
        }
      }
    ]
  })
}
