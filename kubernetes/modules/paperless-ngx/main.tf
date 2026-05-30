resource "kubernetes_namespace" "paperless_ngx" {
  metadata {
    name = var.namespace
  }
}

locals {
  namespace = kubernetes_namespace.paperless_ngx.metadata[0].name
}

resource "kubernetes_persistent_volume_claim" "consume" {
  metadata {
    name      = "${var.release_name}-consume"
    namespace = local.namespace
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = var.consume_size
      }
    }
  }
  wait_until_bound = false
}

resource "kubernetes_persistent_volume_claim" "export" {
  metadata {
    name      = "${var.release_name}-export"
    namespace = local.namespace
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = var.export_size
      }
    }
  }
  wait_until_bound = false
}

resource "helm_release" "paperless_ngx" {
  name       = var.release_name
  repository = "https://charts.gabe565.com"
  chart      = "paperless-ngx"
  version    = var.chart_version

  namespace = local.namespace

  depends_on = [
    kubernetes_persistent_volume_claim.consume,
    kubernetes_persistent_volume_claim.export,
  ]

  set {
    name  = "persistence.consume.existingClaim"
    value = kubernetes_persistent_volume_claim.consume.metadata[0].name
  }

  set {
    name  = "persistence.export.existingClaim"
    value = kubernetes_persistent_volume_claim.export.metadata[0].name
  }

  set {
    name  = "redis.image.repository"
    value = "redis"
  } 

  set {
    name  = "redis.image.tag"
    value = "7.4.2"
  }
}
