region               = "us-east-1"
allocated_storage    = 20
db_name              = "mydb"
engine               = "mysql"
engine_version       = "5.7"
instance_class       = "db.t3.medium"
username             = "foo"
password             = "foobarbaz"
publicly_accessible  = true
db_subnet_group_name = "my-db-subnet" # Replace with your actual subnet group name
db_instance_identifier = "my-db-instance"

tags = {
  Name = "main"
}
