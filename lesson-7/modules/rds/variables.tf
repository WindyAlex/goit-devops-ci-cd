variable "project_name" {
  description = "Project name used as a prefix for database resources"
  type        = string
}

variable "use_aurora" {
  description = "If true, creates an Aurora cluster. If false, creates a standard RDS instance"
  type        = bool
  default     = false
}

variable "vpc_id" {
  description = "VPC ID where the database security group will be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the DB subnet group"
  type        = list(string)
}

variable "engine" {
  description = "Database engine. Example: postgres or mysql"
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
  default     = "15"
}

variable "instance_class" {
  description = "Database instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "appdb"
}

variable "username" {
  description = "Database admin username"
  type        = string
  default     = "postgres"
}

variable "password" {
  description = "Database admin password"
  type        = string
  sensitive   = true
}

variable "multi_az" {
  description = "Enable Multi-AZ deployment for standard RDS"
  type        = bool
  default     = false
}

variable "db_port" {
  description = "Database port"
  type        = number
  default     = 5432
}

variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed to connect to the database"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "allocated_storage" {
  description = "Allocated storage size for standard RDS in GB"
  type        = number
  default     = 20
}

variable "skip_final_snapshot" {
  description = "Whether to skip final snapshot when deleting the database"
  type        = bool
  default     = true
}