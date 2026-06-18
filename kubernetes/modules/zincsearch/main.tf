resource "kubernetes_namespace" "zincsearch" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_persistent_volume_claim" "zincsearch_data" {
  metadata {
    name      = "${var.release_name}-data"
    namespace = kubernetes_namespace.zincsearch.metadata[0].name
  }

  spec {
    access_modes = ["ReadWriteOnce"]

    resources {
      requests = {
        storage = var.data_size
      }
    }
  }
}

resource "kubernetes_secret" "zincsearch" {
  metadata {
    name      = "${var.release_name}-credentials"
    namespace = kubernetes_namespace.zincsearch.metadata[0].name
  }

  data = {
    ZINC_FIRST_ADMIN_USER     = var.admin_user
    ZINC_FIRST_ADMIN_PASSWORD = var.admin_password
  }
}

resource "kubernetes_deployment" "zincsearch" {
  metadata {
    name      = var.release_name
    namespace = kubernetes_namespace.zincsearch.metadata[0].name

    labels = {
      app = "zincsearch"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "zincsearch"
      }
    }

    template {
      metadata {
        labels = {
          app = "zincsearch"
        }
      }

      spec {
        container {
          name  = "zincsearch"
          image = "public.ecr.aws/zinclabs/zincsearch:${var.image_tag}"

          port {
            container_port = 4080
            name           = "http"
          }

          env_from {
            secret_ref {
              name = kubernetes_secret.zincsearch.metadata[0].name
            }
          }

          env {
            name  = "ZINC_DATA_PATH"
            value = "/data"
          }

          volume_mount {
            name       = "data"
            mount_path = "/data"
          }

          resources {
            requests = {
              cpu    = var.resource_requests_cpu
              memory = var.resource_requests_memory
            }
            limits = {
              cpu    = var.resource_limits_cpu
              memory = var.resource_limits_memory
            }
          }

          liveness_probe {
            http_get {
              path = "/healthz"
              port = 4080
            }
            initial_delay_seconds = 30
            period_seconds        = 10
          }

          readiness_probe {
            http_get {
              path = "/healthz"
              port = 4080
            }
            initial_delay_seconds = 5
            period_seconds        = 5
          }
        }

        volume {
          name = "data"

          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.zincsearch_data.metadata[0].name
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "zincsearch" {
  metadata {
    name      = var.release_name
    namespace = kubernetes_namespace.zincsearch.metadata[0].name
  }

  spec {
    selector = {
      app = "zincsearch"
    }

    port {
      port        = 4080
      target_port = 4080
      protocol    = "TCP"
      name        = "http"
    }

    type = var.service_type
  }
}
