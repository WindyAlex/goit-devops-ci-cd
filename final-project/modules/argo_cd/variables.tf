variable "namespace" {
  type        = string
  description = "Argo CD namespace."
  default     = "argocd"
}

variable "git_repo_url" {
  type        = string
  description = "Git repository URL for Argo CD."
}

variable "git_branch" {
  type        = string
  description = "Git target revision."
}

variable "chart_path" {
  type        = string
  description = "Path to Helm chart in repository."
}
