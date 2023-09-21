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

variable "subnets" {
  description = " Please provide list of subnets"
  type        = list
  default     = []
}