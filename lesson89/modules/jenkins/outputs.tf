output "jenkins_url" {
  value = "kubectl port-forward svc/jenkins 8080:8080 -n jenkins"
}
