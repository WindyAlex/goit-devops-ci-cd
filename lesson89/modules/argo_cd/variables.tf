variable "namespace" {
  type    = string
  default = "argocd"
}

variable "git_repo_url" {
  type = string
}

variable "git_branch" {
  type = string
}
