output "release_name" {
  value = helm_release.grafana.name
}

output "namespace" {
  value = kubernetes_namespace.grafana.metadata[0].name
}

output "admin_password" {
  value     = data.kubernetes_secret.grafana.data["admin-password"]
  sensitive = true
}
