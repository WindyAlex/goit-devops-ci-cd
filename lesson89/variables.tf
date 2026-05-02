variable "github_username" {
  type        = string
  description = "GitHub username for Jenkins"
}

variable "github_token" {
  type        = string
  description = "GitHub PAT for Jenkins"
  sensitive   = true
}
