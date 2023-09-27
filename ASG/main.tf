resource "aws_launch_template" "foobar" {
  name_prefix            = var.name_prefix
  image_id               = var.image_id
  instance_type          = var.instance_type
  user_data              = base64encode(file("user_data.sh"))
  vpc_security_group_ids = [data.terraform_remote_state.main.outputs.web_server_security_group]
}


resource "aws_lb_target_group" "server" {
  name        = "server-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = data.terraform_remote_state.main.outputs.vpc_id
  target_type = "instance"

  health_check {
    path                = "/health-check"
    protocol            = "HTTP"
    port                = "traffic-port"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 6
    interval            = 30
  }
}

# resource "aws_security_group" "web_server_security_group" {
#   name        = "web-server-security-group"
#   description = "Security group for web servers"
#   vpc_id      = data.terraform_remote_state.main.outputs.vpc_id

#   // Define your ingress rules here, allowing incoming HTTP traffic
#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"] # Allow incoming HTTP traffic from anywhere (adjust as needed)
#   }
# }


resource "aws_autoscaling_group" "bar" {
  vpc_zone_identifier = [
    data.terraform_remote_state.main.outputs.public_subnet1,
    data.terraform_remote_state.main.outputs.public_subnet2,
    data.terraform_remote_state.main.outputs.public_subnet3
  ]
  desired_capacity = var.desired_capacity
  max_size         = var.max_size
  min_size         = var.min_size

  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }
}

resource "aws_lb" "bar" {
  name               = "bar-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.terraform_remote_state.main.outputs.web_server_security_group]
  subnets = [data.terraform_remote_state.main.outputs.public_subnet1,
    data.terraform_remote_state.main.outputs.public_subnet3
  ]

  enable_deletion_protection = false

  tags = {
    Name = "main"
  }
}

# resource "aws_elb" "bar" {
#   name            = "foobar-terraform-elb"
#   security_groups = [data.terraform_remote_state.main.outputs.web_server_security_group]
#   subnets         = [data.terraform_remote_state.main.outputs.public_subnet1]
#   listener {
#     instance_port     = 8000
#     instance_protocol = "http"
#     lb_port           = 80
#     lb_protocol       = "http"
#   }


#   health_check {
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#     timeout             = 3
#     target              = "HTTP:8000/"
#     interval            = 30
#   }

#   cross_zone_load_balancing   = true
#   idle_timeout                = 400
#   connection_draining         = true
#   connection_draining_timeout = 400
# }

# resource "aws_security_group" "web_server_security_group" {
#   name        = "web-server-security-group"
#   description = "Security group for web servers"
#   vpc_id      = data.terraform_remote_state.main.outputs.vpc_id
#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"] # Allow incoming HTTP traffic from anywhere (adjust as needed)
#   }
# }

# resource "aws_autoscaling_attachment" "asg_attachment_bar" {
#   autoscaling_group_name = aws_autoscaling_group.bar.id
#   elb                    = aws_elb.bar.id
# }


