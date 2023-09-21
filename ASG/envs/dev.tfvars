region           = "us-east-1"
name_prefix      = "foobar"
image_id         = "ami-03a6eaae9938c858c"
instance_type    = "t2.micro"
desired_capacity = 2
max_size         = 99
min_size         = 1
subnets = ["subnet-050da0894e6fd6464"]

tags = {
  Name = "main"
}