resource "random_password" "password" {
  length           = 16
  special          = false
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_ssm_parameter" "dbpass" {
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
  vpc_security_group_ids  = [data.terraform_remote_state.main.outputs.mysql_security_group]
}

resource "aws_db_subnet_group" "example" {
  name        = "my-db-subnet" # Use the same DB subnet group name as in aws_db_instance
  description = "Custom DB subnet group description"

  subnet_ids = [data.terraform_remote_state.main.outputs.private_subnet1,
  data.terraform_remote_state.main.outputs.private_subnet2] # Replace with your actual subnet IDs
}
