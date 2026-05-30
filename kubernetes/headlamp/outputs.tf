output "release_name" {
  value = helm_release.headlamp.name
}

output "release_status" {
  value = helm_release.headlamp.status
}

output "namespace" {
  value = helm_release.headlamp.namespace
}

output "headlamp_admin_token" {
  value     = kubernetes_secret.headlamp_admin_token.data["token"]
  sensitive = true
}
