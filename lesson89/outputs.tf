output "jenkins_url" {
  value = "Use: kubectl port-forward svc/jenkins 8080:8080 -n jenkins"
}

output "argo_cd_url" {
  value = "Use: kubectl port-forward svc/argo-cd-argocd-server 8081:443 -n argocd"
}
