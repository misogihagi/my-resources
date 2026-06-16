resource "kubernetes_namespace" "grafana" {
  metadata {
    name = var.namespace
  }
}

resource "helm_release" "grafana" {
  name       = var.release_name
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  namespace  = kubernetes_namespace.grafana.metadata[0].name
  version    = var.chart_version
}

data "kubernetes_secret" "grafana" {
  metadata {
    name      = var.release_name
    namespace = kubernetes_namespace.grafana.metadata[0].name
  }
  depends_on = [helm_release.grafana]
}
