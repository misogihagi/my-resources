resource "helm_release" "headlamp" {
  name       = var.release_name
  repository = "https://kubernetes-sigs.github.io/headlamp/"
  chart      = "headlamp"
  namespace  = var.namespace
  version    = var.chart_version
}

resource "kubernetes_service_account" "headlamp_admin" {
  metadata {
    name      = "headlamp-admin"
    namespace = var.namespace
  }
}

resource "kubernetes_cluster_role_binding" "headlamp_admin" {
  metadata {
    name = "headlamp-admin"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }
  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.headlamp_admin.metadata[0].name
    namespace = kubernetes_service_account.headlamp_admin.metadata[0].namespace
  }
}

resource "kubernetes_secret" "headlamp_admin_token" {
  metadata {
    name      = "headlamp-admin-token"
    namespace = var.namespace
    annotations = {
      "kubernetes.io/service-account.name" = kubernetes_service_account.headlamp_admin.metadata[0].name
    }
  }
  type = "kubernetes.io/service-account-token"
}
