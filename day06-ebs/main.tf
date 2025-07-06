provider "aws" {
  region = "us-east-1"
}

resource "aws_ebs_volume" "app_volume" {
  availability_zone = "us-east-1a"
  size              = 10
  type              = "gp3"
  tags = {
    Name = "day6-ebs-volume"
  }
}

resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.app_volume.id
  instance_id = "i-xxxxxxxxxxxxxxxxx"  # Replace with your EC2 instance ID
  force_detach = true
}
