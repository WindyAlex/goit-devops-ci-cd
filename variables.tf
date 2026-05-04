variable "aws_region" {
  type        = string
  description = "AWS region for all resources."
}

variable "project_name" {
  type        = string
  description = "Project prefix used for AWS resource names."
}

variable "backend_bucket_name" {
  type        = string
  description = "S3 bucket name used for Terraform remote state."
}

variable "backend_table_name" {
  type        = string
  description = "DynamoDB table name used for Terraform state locking."
}

variable "github_username" {
  type        = string
  description = "GitHub username used by Jenkins credentials."
}

variable "github_token" {
  type        = string
  sensitive   = true
  description = "GitHub PAT used by Jenkins to push Helm chart changes."
}

variable "git_repo_url" {
  type        = string
  description = "GitHub repository URL monitored by Jenkins and Argo CD."
}

variable "git_branch" {
  type        = string
  description = "Git branch for final project."
}

variable "db_username" {
  type        = string
  description = "Database master username."
}

variable "db_password" {
  type        = string
  sensitive   = true
  description = "Database master password."
}

variable "db_name" {
  type        = string
  description = "Application database name."
}

variable "use_aurora" {
  type        = bool
  description = "true creates Aurora cluster, false creates a standard RDS instance."
  default     = false
}

variable "jenkins_admin_password" {
  type        = string
  sensitive   = true
  description = "Jenkins admin password."
}

variable "grafana_admin_password" {
  type      = string
  sensitive = true
  description = "Grafana admin password."
}