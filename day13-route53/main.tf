provider "aws" {
  region = "us-east-1"
}

# variables

variable "domain_name" {
  description = "The domain name to register"
  default     = "example.com"
}

variable "record_ip" {
  description = "The IP address for the A record"
  default     = "15.1.13.153"
}


# Create a hosted zone
resource "aws_route53_zone" "main" {
  name = var.domain_name
}

resource "aws_route53_record" "web" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www.${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = [var.record_ip]
}




output "zone_name" {
  value = aws_route53_zone.main.name
}

output "record_fqdn" {
  value = aws_route53_record.web.fqdn
}
