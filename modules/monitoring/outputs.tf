output "grafana_port_forward" {
  value = "kubectl port-forward svc/grafana 3000:80 -n monitoring"
}

output "prometheus_port_forward" {
  value = "kubectl port-forward svc/prometheus-server 9090:80 -n monitoring"
}
