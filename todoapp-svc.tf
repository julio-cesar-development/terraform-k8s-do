resource "kubernetes_service" "todoapp-service" {
  metadata {
    name      = "todoapp-service"
    namespace = "default"
  }

  spec {
    selector = {
      component = "todoapp"
    }

    port {
      port        = 80
      target_port = "todoapp-port"
      protocol    = "TCP"
    }

    type = "ClusterIP"
  }

  depends_on = [digitalocean_kubernetes_cluster.k8s-cluster]
}
