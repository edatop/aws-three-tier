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

variable "allocated_storage" {
  type        = number
  default     = 20
  description = "Please provide a value"
}

variable "engine" {
  type        = string
  default     = ""
  description = "Please provide a value"
}

variable "engine_version" {
  type        = string
  default     = ""
  description = "Please provide a value"
}

variable "instance_class" {
  type        = string
  default     = ""
  description = "Please provide a value"
}

variable "db_name" {
  type        = string
  default     = "mydb" #why I can not leave as default? It created earlier when it was default..
  description = "Please provide a value"
}

variable "username" {
  type        = string
  default     = ""
  description = "Please provide a value"
}

variable "password" {
  type        = string
  default     = ""
  description = "Please provide a value"
}

variable "publicly_accessible" {
  type        = bool
  default     = false
  description = "Please provide a value"
}

variable "db_subnet_group_name" {
  type        = string
  description = "Name of the DB subnet group"
  default     = ""
}

variable "db_instance_identifier" {
  description = "The identifier for the RDS instance"
  type        = string
}