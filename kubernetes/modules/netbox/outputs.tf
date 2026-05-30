output "release_name" {
  value = helm_release.netbox.name
}

output "release_status" {
  value = helm_release.netbox.status
}

output "namespace" {
  value = helm_release.netbox.namespace
}

output "superuser_password" {
  value     = data.kubernetes_secret.netbox_superuser.data["password"]
  sensitive = true
}
