variable "namespace" {
  type        = string
  description = "Jenkins namespace."
  default     = "jenkins"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name."
}

variable "oidc_provider_arn" {
  type        = string
  description = "OIDC provider ARN."
}

variable "oidc_provider_url" {
  type        = string
  description = "OIDC provider URL."
}

variable "github_username" {
  type        = string
  description = "GitHub username."
}

variable "github_token" {
  type        = string
  sensitive   = true
  description = "GitHub token."
}

variable "git_repo_url" {
  type        = string
  description = "GitHub repository URL."
}

variable "git_branch" {
  type        = string
  description = "Git branch."
}

variable "ecr_repository_url" {
  type        = string
  description = "ECR repository URL."
}

variable "aws_region" {
  type        = string
  description = "AWS region."
}

variable "jenkins_admin_password" {
  type        = string
  sensitive   = true
  description = "Jenkins admin password."
}