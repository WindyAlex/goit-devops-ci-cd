module "eks" {
  source = "./modules/eks"

  cluster_name       = "${var.project_name}-eks"
  private_subnet_ids = var.private_subnet_ids
}

module "ecr" {
  source = "./modules/ecr"

  repository_name = "${var.project_name}-ecr"
}

module "rds" {
  source = "./modules/rds"

  project_name = var.project_name

  use_aurora = false

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnet_ids

  engine         = "postgres"
  engine_version = "15"
  instance_class = "db.t3.micro"

  db_name  = "appdb"
  username = var.db_username
  password = var.db_password

  multi_az = false
}