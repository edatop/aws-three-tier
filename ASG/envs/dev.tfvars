region           = "us-east-1"
name_prefix      = "foobar"
image_id         = "ami-00c6177f250e07ec1"
instance_type    = "t3.micro"
desired_capacity = 2
max_size         = 99
min_size         = 1
# subnets             = [data.terraform_remote_state.main.outputs.public_subnet1, data.terraform_remote_state.main.outputs.public_subnet2]
tags = {
  Name = "main"
}
