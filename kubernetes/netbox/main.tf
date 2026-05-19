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

resource "kubernetes_namespace" "netbox" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "netbox" {
  name      = var.release_name
  namespace = kubernetes_namespace.netbox.metadata[0].name
  chart     = "oci://ghcr.io/netbox-community/netbox-chart/netbox"
  version   = var.chart_version
}

data "kubernetes_secret" "netbox_superuser" {
  metadata {
    name      = "${var.release_name}-netbox-superuser"
    namespace = kubernetes_namespace.netbox.metadata[0].name
  }
  depends_on = [helm_release.netbox]
}
