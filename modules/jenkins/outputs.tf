output "jenkins_port_forward" {
  value = "kubectl port-forward svc/jenkins 8080:8080 -n jenkins"
}
