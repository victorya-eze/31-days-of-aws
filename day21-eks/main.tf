provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "demo-eks-cluster"
  cluster_version = "1.30"
  subnet_ids      = ["subnet-abc123", "subnet-def456"] # Replace with your subnet IDs
  vpc_id          = "vpc-xxxxxx"                       # Replace with your VPC ID

  node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_types = ["t3.medium"]
      capacity_type  = "ON_DEMAND"
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
