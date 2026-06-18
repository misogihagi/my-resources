terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = var.kube_config_path
  }
}

provider "kubernetes" {
  config_path = var.kube_config_path
}

module "headlamp" {
  source = "./modules/headlamp"

  release_name  = var.headlamp_release_name
  namespace     = var.headlamp_namespace
  chart_version = var.headlamp_chart_version
}

module "navidrome" {
  source = "./modules/navidrome"

  release_name    = var.navidrome_release_name
  namespace       = var.navidrome_namespace
  chart_version   = var.navidrome_chart_version
  config_size     = var.navidrome_config_size
  music_size      = var.navidrome_music_size
  timezone        = var.navidrome_timezone
  log_level       = var.navidrome_log_level
  ingress_enabled = var.navidrome_ingress_enabled
  ingress_host    = var.navidrome_ingress_host
}

module "netbox" {
  source = "./modules/netbox"

  release_name  = var.netbox_release_name
  namespace     = var.netbox_namespace
  chart_version = var.netbox_chart_version
}

module "paperless_ngx" {
  source = "./modules/paperless-ngx"

  release_name  = var.paperless_ngx_release_name
  namespace     = var.paperless_ngx_namespace
  chart_version = var.paperless_ngx_chart_version
  consume_size  = var.paperless_ngx_consume_size
  export_size   = var.paperless_ngx_export_size
}

module "grafana" {
  source = "./modules/grafana"

  release_name  = var.grafana_release_name
  namespace     = var.grafana_namespace
  chart_version = var.grafana_chart_version
}

module "zincsearch" {
  source = "./modules/zincsearch"

  release_name   = var.zincsearch_release_name
  namespace      = var.zincsearch_namespace
  image_tag      = var.zincsearch_image_tag
  admin_user     = var.zincsearch_admin_user
  admin_password = var.zincsearch_admin_password
  data_size      = var.zincsearch_data_size
}

