resource "kubernetes_service" "todoapp-service" {
  metadata {
    name      = "todoapp-service"
    namespace = "todoapp"
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

  depends_on = [kubernetes_namespace.todoapp-namespace, kubernetes_deployment.todoapp-deployment]
}
