output "headlamp_release_name" {
  value = module.headlamp.release_name
}

output "headlamp_namespace" {
  value = module.headlamp.namespace
}

output "headlamp_admin_token" {
  value     = module.headlamp.headlamp_admin_token
  sensitive = true
}

output "navidrome_release_name" {
  value = module.navidrome.release_name
}

output "navidrome_namespace" {
  value = module.navidrome.namespace
}

output "netbox_release_name" {
  value = module.netbox.release_name
}

output "netbox_namespace" {
  value = module.netbox.namespace
}

output "netbox_superuser_password" {
  value     = module.netbox.superuser_password
  sensitive = true
}

output "paperless_ngx_release_name" {
  value = module.paperless_ngx.release_name
}

output "paperless_ngx_namespace" {
  value = module.paperless_ngx.namespace
}

output "grafana_release_name" {
  value = module.grafana.release_name
}

output "grafana_namespace" {
  value = module.grafana.namespace
}

output "grafana_admin_password" {
  value     = module.grafana.admin_password
  sensitive = true
}

output "zincsearch_release_name" {
  value = module.zincsearch.release_name
}

output "zincsearch_namespace" {
  value = module.zincsearch.namespace
}

output "zincsearch_service_url" {
  value = module.zincsearch.service_url
}
