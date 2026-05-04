variable "project_name" {
  type        = string
  description = "Project prefix."
}

variable "use_aurora" {
  type        = bool
  description = "Create Aurora when true, standard RDS when false."
  default     = false
}

variable "vpc_id" {
  type        = string
  description = "VPC ID."
}

variable "subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for DB subnet group."
}

variable "engine" {
  type        = string
  description = "Database engine. Use postgres/mysql for RDS or aurora-postgresql/aurora-mysql for Aurora."
}

variable "engine_version" {
  type        = string
  description = "Database engine version."
}

variable "instance_class" {
  type        = string
  description = "Database instance class."
}

variable "db_name" {
  type        = string
  description = "Database name."
}

variable "username" {
  type        = string
  description = "Master username."
}

variable "password" {
  type        = string
  sensitive   = true
  description = "Master password."
}

variable "multi_az" {
  type        = bool
  description = "Enable Multi-AZ for standard RDS."
  default     = false
}

variable "db_port" {
  type        = number
  description = "Database port."
  default     = 5432
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Skip final snapshot on destroy for lab cleanup."
  default     = true
}

variable "backup_retention_period" {
  type        = number
  description = "Backup retention period in days."
  default     = 1
}

variable "allowed_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks allowed to connect to the database."
  default     = ["10.0.0.0/16"]
}