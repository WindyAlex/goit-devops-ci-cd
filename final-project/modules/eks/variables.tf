variable "cluster_name" {
  type        = string
  description = "EKS cluster name."
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs for EKS."
}
