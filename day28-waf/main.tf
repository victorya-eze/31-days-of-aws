variable "aws_region" {
  default = "us-east-1"
}

variable "waf_name" {
  default = "example-waf"
}

variable "alb_name" {
  default = "my-app-alb"
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}

variable "blocked_ips" {
  type    = list(string)
  default = ["192.0.2.0/24"]
}


provider "aws" {
  region = var.aws_region
}

resource "aws_wafv2_web_acl" "example" {
  name        = var.waf_name
  description = "Example WAFv2 Web ACL"
  scope       = "REGIONAL"

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "example-waf"
    sampled_requests_enabled   = true
  }

  rule {
    name     = "BlockBadIPs"
    priority = 1

    action {
      block {}
    }

    statement {
      ip_set_reference_statement {
        arn = aws_wafv2_ip_set.blocked_ips.arn
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "block-bad-ips"
      sampled_requests_enabled   = true
    }
  }
}

resource "aws_wafv2_ip_set" "blocked_ips" {
  name               = "BlockedIPs"
  description        = "IP addresses to block"
  scope              = "REGIONAL"
  ip_address_version = "IPV4"

  addresses = var.blocked_ips
}

resource "aws_lb" "app_alb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnet_ids
  security_groups    = var.security_group_ids
}

resource "aws_wafv2_web_acl_association" "example_assoc" {
  resource_arn = aws_lb.app_alb.arn
  web_acl_arn  = aws_wafv2_web_acl.example.arn
}
