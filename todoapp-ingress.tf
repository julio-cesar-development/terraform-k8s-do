resource "kubernetes_ingress" "todoapp-ingress" {
  metadata {
    name      = "todoapp-ingress"
    namespace = "todoapp"
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }

  spec {
    rule {
      host = "todoapp.${var.do_subdomain}"
      http {
        path {
          path = "/"

          backend {
            service_name = "todoapp-service"
            service_port = 80
          }
        }
      }
    }

    # tls {
    #   secret_name = "todoapp-tls-secret"
    # }
  }

  wait_for_load_balancer = true

  depends_on = [null_resource.nginx-ingress-controller, kubernetes_namespace.todoapp-namespace]
}
