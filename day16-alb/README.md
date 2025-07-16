Day 16 of 31DaysOfAWS – (ALB)


What This Code Does

- Uses default VPC and public subnets (you can customize as needed)
- Creates a security group allowing HTTP (port 80)
- Provisions an ALB in public subnets
- Defines a target group for receiving traffic
- Creates a listener that responds with a fixed HTTP message

## usage

```bash
terraform init
terraform apply

```
and remember to clean up

terraform destroy