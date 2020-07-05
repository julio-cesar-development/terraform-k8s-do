resource "kubernetes_ingress" "todoapp-ingress" {
  metadata {
    name      = "todoapp-ingress"
    namespace = "todoapp"
    annotations = {
      "kubernetes.io/ingress.class"                    = "nginx"
      "nginx.ingress.kubernetes.io/ssl-redirect"       = "false"
      "nginx.ingress.kubernetes.io/force-ssl-redirect" = "false"
    }
  }

  spec {
    rule {
      host = "todoapp.${var.todoapp_subdomain}"
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

    tls {
      hosts       = ["todoapp.${var.todoapp_subdomain}"]
      secret_name = "todoapp-tls-secret"
    }
  }

  wait_for_load_balancer = true

  depends_on = [null_resource.deploy_helm_apps]
}
