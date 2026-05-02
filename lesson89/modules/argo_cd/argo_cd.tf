resource "kubernetes_namespace" "argocd" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "argo_cd" {
  name       = "argo-cd"
  namespace  = kubernetes_namespace.argocd.metadata[0].name
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "7.7.11"

  values = [
    file("${path.module}/values.yaml")
  ]
}

resource "helm_release" "argo_apps" {
  name      = "argo-apps"
  namespace = kubernetes_namespace.argocd.metadata[0].name
  chart     = "${path.module}/charts/argo-apps"

  values = [
    templatefile("${path.module}/charts/argo-apps/values.yaml", {
      repo_url = var.git_repo_url
      branch   = var.git_branch
    })
  ]

  depends_on = [
    helm_release.argo_cd
  ]
}
