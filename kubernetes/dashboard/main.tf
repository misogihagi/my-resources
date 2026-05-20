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

resource "kubernetes_namespace" "dashboard" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "kubernetes_dashboard" {
  name       = var.release_name
  repository = "https://kubernetes.github.io/dashboard/"
  chart      = "kubernetes-dashboard"
  namespace  = kubernetes_namespace.dashboard.metadata[0].name
  version    = var.chart_version
}
