resource "aws_db_instance" "day7_rds" {
  identifier             = "day7-mysql-db"
  allocated_storage      = 20
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  name                   = "mydb"
  username               = "admin"
  password               = "StrongPassword123!"
  parameter_group_name   = "default.mysql8.0"
  skip_final_snapshot    = true
  publicly_accessible    = true
  vpc_security_group_ids = ["sg-xxxxxxxxxxxxxx"] # Replace with your SG

  tags = {
    Name = "day7-rds"
  }
}
