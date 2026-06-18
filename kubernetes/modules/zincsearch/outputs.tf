output "release_name" {
  value = kubernetes_deployment.zincsearch.metadata[0].name
}

output "namespace" {
  value = kubernetes_namespace.zincsearch.metadata[0].name
}

output "service_url" {
  description = "Internal service URL for ZincSearch"
  value       = "http://${kubernetes_service.zincsearch.metadata[0].name}.${kubernetes_namespace.zincsearch.metadata[0].name}.svc.cluster.local:4080"
}
