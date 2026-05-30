output "release_name" {
  value = helm_release.paperless_ngx.name
}

output "release_status" {
  value = helm_release.paperless_ngx.status
}

output "namespace" {
  value = helm_release.paperless_ngx.namespace
}
