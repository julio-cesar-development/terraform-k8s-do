resource "kubernetes_deployment" "todoapp-deployment" {
  metadata {
    name      = "todoapp-deployment"
    namespace = "todoapp"
    labels = {
      component = "todoapp"
    }
  }

  spec {
    replicas = var.todoapp_replicas

    selector {
      match_labels = {
        component = "todoapp"
      }
    }

    template {
      metadata {
        labels = {
          component = "todoapp"
        }
      }

      spec {
        container {
          image = "${var.todoapp_image_name}:${var.todoapp_image_version}"
          name  = "todoapp-deployment"

          port {
            name           = "todoapp-port"
            container_port = 80
          }

          resources {
            requests {
              memory = "128Mi"
              cpu    = "150m"
            }
            limits {
              memory = "256Mi"
              cpu    = "300m"
            }
          }

          env {
            name  = "NODE_ENV"
            value = "production"
          }

          liveness_probe {
            http_get {
              path = "/"
              port = "todoapp-port"
            }

            initial_delay_seconds = 10
            timeout_seconds       = 30
          }
        }
      }
    }
  }

  depends_on = [kubernetes_namespace.todoapp-namespace]
}
