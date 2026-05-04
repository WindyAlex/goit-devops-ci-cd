output "argo_cd_port_forward" {
  value = "kubectl port-forward svc/argocd-server 8081:443 -n argocd"
}
