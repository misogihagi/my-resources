output "release_name" {
  value = helm_release.kubernetes_dashboard.name
}

output "release_status" {
  value = helm_release.kubernetes_dashboard.status
}

output "namespace" {
  value = helm_release.kubernetes_dashboard.namespace
}
