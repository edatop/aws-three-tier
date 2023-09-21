resource "random_password" "password" {
  length           = 16
  special          = false
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_ssm_parameter" "fdbpass" {
  name  = var.db_name
  type  = "SecureString"
  value = random_password.password.result
}

resource "aws_db_instance" "default" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  db_name              = var.db_name
  username             = var.username
  password             = random_password.password.result
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  publicly_accessible  = var.publicly_accessible
  db_subnet_group_name = "my-db-subnet" # Use the same DB subnet group name as in aws_db_subnet_group
}

resource "aws_db_subnet_group" "example" {
  name        = "my-db-subnet" # Use the same DB subnet group name as in aws_db_instance
  description = "Custom DB subnet group description"

  subnet_ids = ["subnet-073c828416bb62b7f", "subnet-070ed811fe1cbb72a"] # Replace with your actual subnet IDs
}

resource "aws_security_group" "rds_security_group" {
  name        = "my-rds-security-group"
  description = "Security group for RDS instance"

  # Define ingress rules to allow incoming MySQL traffic from specific sources
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # You can restrict this to specific IP ranges
  }
}