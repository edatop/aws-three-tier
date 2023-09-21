resource "aws_launch_template" "foobar" {
  name_prefix   = var.name_prefix
  image_id      = var.image_id
  instance_type = var.instance_type
}



resource "aws_autoscaling_group" "bar" {
  vpc_zone_identifier = var.subnets # Ensure this matches the availability zone with a default subnet
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size

  launch_template {
    id      = aws_launch_template.foobar.id
    version = "$Latest"
  }
}



resource "aws_elb" "bar" {
  name               = "foobar-terraform-elb"
  subnets            = var.subnets  #availability_zones = ["us-east-1e"]
  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }


  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
}

resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.bar.id
  elb                    = aws_elb.bar.id
}