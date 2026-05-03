variable "aws_region" {
  type    = string
  default = "eu-north-1"
}

variable "project_name" {
  type    = string
  default = "lesson-7"
}

variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "db_username" {
  description = "Database admin username"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "Database admin password"
  type        = string
  sensitive   = true
}