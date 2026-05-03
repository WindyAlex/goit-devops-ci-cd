module "eks" {
  source = "./modules/eks"

  cluster_name       = "${var.project_name}-eks"
  private_subnet_ids = var.private_subnet_ids
}

module "ecr" {
  source = "./modules/ecr"

  repository_name = "${var.project_name}-ecr"
}