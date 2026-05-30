resource "kubernetes_namespace" "navidrome" {
  metadata {
    name = var.namespace
  }
}

locals {
  namespace = kubernetes_namespace.navidrome.metadata[0].name
}

resource "kubernetes_persistent_volume_claim" "config" {
  metadata {
    name      = "${var.release_name}-config"
    namespace = local.namespace
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = var.config_size
      }
    }
  }
  wait_until_bound = false
}

resource "kubernetes_persistent_volume_claim" "music" {
  metadata {
    name      = "${var.release_name}-music"
    namespace = local.namespace
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = var.music_size
      }
    }
  }
  wait_until_bound = false
}

resource "helm_release" "navidrome" {
  name       = var.release_name
  repository = "https://djjudas21.github.io/charts/"
  chart      = "navidrome"
  version    = var.chart_version

  namespace = local.namespace

  depends_on = [
    kubernetes_persistent_volume_claim.config,
    kubernetes_persistent_volume_claim.music,
  ]

  set {
    name  = "env.TZ"
    value = var.timezone
  }

  set {
    name  = "env.ND_LOGLEVEL"
    value = var.log_level
  }

  set {
    name  = "env.ND_MUSICFOLDER"
    value = "/music"
  }

  set {
    name  = "env.ND_SESSIONTIMEOUT"
    value = "24h"
  }

  set {
    name  = "env.ND_ENABLETRANSCODINGCONFIG"
    value = "true"
  }

  set {
    name  = "persistence.config.enabled"
    value = "true"
  }

  set {
    name  = "persistence.config.existingClaim"
    value = kubernetes_persistent_volume_claim.config.metadata[0].name
  }

  set {
    name  = "persistence.music.enabled"
    value = "true"
  }

  set {
    name  = "persistence.music.existingClaim"
    value = kubernetes_persistent_volume_claim.music.metadata[0].name
  }

  set {
    name  = "ingress.main.enabled"
    value = tostring(var.ingress_enabled)
  }

  dynamic "set" {
    for_each = var.ingress_enabled ? [1] : []
    content {
      name  = "ingress.main.hosts[0].host"
      value = var.ingress_host
    }
  }

  dynamic "set" {
    for_each = var.ingress_enabled ? [1] : []
    content {
      name  = "ingress.main.hosts[0].paths[0].path"
      value = "/"
    }
  }
}
