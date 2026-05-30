output "release_name" {
  value = helm_release.navidrome.name
}

output "release_status" {
  value = helm_release.navidrome.status
}

output "namespace" {
  value = helm_release.navidrome.namespace
}
