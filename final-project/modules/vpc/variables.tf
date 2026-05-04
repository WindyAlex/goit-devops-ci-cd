variable "project_name" {
  type        = string
  description = "Project prefix."
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR block."
}

variable "public_subnets" {
  type        = list(string)
  description = "Public subnet CIDR blocks."
}

variable "private_subnets" {
  type        = list(string)
  description = "Private subnet CIDR blocks."
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability zones."
}

variable "region" {
  type        = string
  description = "AWS region."
}
