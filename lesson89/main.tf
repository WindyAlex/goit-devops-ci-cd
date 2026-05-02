module "jenkins" {
  source = "./modules/jenkins"

  cluster_name      = "lesson-7-eks"
  oidc_provider_arn = aws_iam_openid_connect_provider.oidc.arn
  oidc_provider_url = aws_iam_openid_connect_provider.oidc.url

  github_username = var.github_username
  github_token    = var.github_token

  git_repo_url = "https://github.com/WindyAlex/goit-devops-ci-cd.git"
  git_branch   = "lesson-8-9"
}

module "argo_cd" {
  source = "./modules/argo_cd"

  git_repo_url = "https://github.com/WindyAlex/goit-devops-ci-cd.git"
  git_branch   = "lesson-8-9"
}
