variable "aws_region" {
  type    = string
  default = "eu-north-1"
}

variable "project_name" {
  type    = string
  default = "lesson-7"
}

variable "vpc_id" {
  type    = string
  default = "vpc-0fa606959bf216928"
}

variable "private_subnet_ids" {
  type = list(string)
}
