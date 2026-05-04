output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "ecr_repository_url" {
  value = module.ecr.repository_url
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "rds_endpoint" {
  value = module.rds.db_endpoint
}

output "rds_port" {
  value = module.rds.db_port
}

output "jenkins_port_forward" {
  value = "kubectl port-forward svc/jenkins 8080:8080 -n jenkins"
}

output "argocd_port_forward" {
  value = "kubectl port-forward svc/argocd-server 8081:443 -n argocd"
}

output "grafana_port_forward" {
  value = "kubectl port-forward svc/grafana 3000:80 -n monitoring"
}

output "prometheus_port_forward" {
  value = "kubectl port-forward svc/prometheus-server 9090:80 -n monitoring"
}
