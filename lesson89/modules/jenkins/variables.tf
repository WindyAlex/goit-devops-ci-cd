variable "namespace" {
  type    = string
  default = "jenkins"
}

variable "cluster_name" {
  type = string
}

variable "oidc_provider_arn" {
  type = string
}

variable "oidc_provider_url" {
  type = string
}

variable "github_username" {
  type = string
}

variable "github_token" {
  type      = string
  sensitive = true
}

variable "git_repo_url" {
  type = string
}

variable "git_branch" {
  type = string
}
