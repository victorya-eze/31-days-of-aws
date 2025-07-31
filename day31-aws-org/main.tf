provider "aws" {
  region = "us-east-1"
}


variable "region" {
  default = "us-east-1"
}


resource "aws_organizations_organization" "org" {
  feature_set = "ALL"
}

resource "aws_organizations_organizational_unit" "engineering" {
  name      = "Engineering"
  parent_id = aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_account" "dev_account" {
  name      = "DevAccount"
  email     = "dev-team+aws@example.com"
  role_name = "OrganizationAccountAccessRole"
  parent_id = aws_organizations_organizational_unit.engineering.id
}

output "organization_id" {
  value = aws_organizations_organization.org.id
}

output "organizational_unit_id" {
  value = aws_organizations_organizational_unit.engineering.id
}

output "new_account_id" {
  value = aws_organizations_account.dev_account.id
}
