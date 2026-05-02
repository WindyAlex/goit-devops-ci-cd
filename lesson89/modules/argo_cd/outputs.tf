output "argo_cd_url" {
  value = "kubectl port-forward svc/argo-cd-argocd-server 8081:443 -n argocd"
}
