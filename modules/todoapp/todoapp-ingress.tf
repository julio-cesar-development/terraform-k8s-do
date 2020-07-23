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
      host = "todoapp.ondo.${var.todoapp_domain}"
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
      hosts       = ["todoapp.ondo.${var.todoapp_domain}"]
      secret_name = "todoapp-tls-secret"
    }
  }

  wait_for_load_balancer = true

  depends_on = [null_resource.deploy_helm_apps]
}
