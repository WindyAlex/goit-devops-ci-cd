module "vpc" {
  source = "./modules/vpc"

  project_name       = var.project_name
  vpc_cidr_block     = "10.0.0.0/16"
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets    = ["10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24"]
  availability_zones = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
  region             = var.aws_region
}

module "ecr" {
  source = "./modules/ecr"

  repository_name = "${var.project_name}-django"
}

module "eks" {
  source = "./modules/eks"

  cluster_name       = "${var.project_name}-eks"
  private_subnet_ids = module.vpc.private_subnet_ids

  depends_on = [module.vpc]
}

module "rds" {
  source = "./modules/rds"

  project_name = var.project_name
  use_aurora   = var.use_aurora

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids

  engine         = var.use_aurora ? "aurora-postgresql" : "postgres"
  engine_version = var.use_aurora ? "15.4" : "15"
  instance_class = var.use_aurora ? "db.t3.medium" : "db.t3.micro"

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password
  multi_az = false

  allowed_cidr_blocks     = [module.vpc.vpc_cidr_block]
  backup_retention_period = 1

  depends_on = [module.vpc]
}

module "jenkins" {
  source = "./modules/jenkins"

  cluster_name           = module.eks.cluster_name
  oidc_provider_arn      = aws_iam_openid_connect_provider.oidc.arn
  oidc_provider_url      = aws_iam_openid_connect_provider.oidc.url
  github_username        = var.github_username
  github_token           = var.github_token
  git_repo_url           = var.git_repo_url
  git_branch             = var.git_branch
  ecr_repository_url     = module.ecr.repository_url
  aws_region             = var.aws_region
  jenkins_admin_password = var.jenkins_admin_password

  depends_on = [module.eks, aws_iam_openid_connect_provider.oidc]
}

module "argo_cd" {
  source = "./modules/argo_cd"

  git_repo_url = var.git_repo_url
  git_branch   = var.git_branch
  chart_path   = "charts/django-app"

  depends_on = [module.eks]
}

module "monitoring" {
  source = "./modules/monitoring"

  grafana_admin_password = var.grafana_admin_password
  depends_on             = [module.eks]
}