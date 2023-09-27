variable "region" {
  description = "Please provide a region name"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Please provide a tag for resource"
  type        = map(any)
  default     = {}
}

variable "name_prefix" {
  description = "Please create a template"
  type        = string
  default     = "ex-"
}

variable "image_id" {
  description = " Please provide an id"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = " Please provide an instance type"
  type        = string
  default     = ""
}

variable "desired_capacity" {
  description = " Please provide an instance type"
  type        = string
  default     = ""
}

variable "max_size" {
  description = " Please provide an instance type"
  type        = string
  default     = ""
}

variable "min_size" {
  description = " Please provide an instance type"
  type        = string
  default     = ""
}

# variable "subnets" {
#   description = " Please provide list of subnets"
#   type        = list(any)
#   default     = []
# }

variable "public_subnet1_cidr" {
  description = "CIDR block for public subnet 1"
  type        = string
  default     = ""
}

variable "public_subnet2_cidr" {
  description = "CIDR block for public subnet 2"
  type        = string
  default     = ""
}

# variable "user_data" {
#   description = "User data script for EC2 instances"
#   type        = string
#   default     = <<-EOF
#     #!/bin/bash

#     echo Installing Telnet
#     sudo yum update -y
#     sudo yum install telnet -y
#     sudo yum install httpd -y
#     sudo yum install php -y
#     sudo yum install php-mysql -y
#     sudo systemctl restart httpd
#     sudo systemctl enable httpd
#     sudo yum install wget -y
#     sudo wget https://wordpress.org/wordpress-4.0.32.tar.gz
#     sudo tar -xf wordpress-4.0.32.tar.gz -C /var/www/html/
#     sudo mv /var/www/html/wordpress/* /var/www/html/
#     sudo echo "<?php phpinfo();?>" > /var/www/html/phpinfo.php 
#     sudo chown -R apache:apache /var/www/html/
#     sudo systemctl restart httpd
#     EOF
# }

# variable "user_data" {
#   description = "User data script for launch template"
#   type        = string
#   default     = ""
# }

