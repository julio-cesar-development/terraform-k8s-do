resource "kubernetes_secret" "todoapp-tls-secret" {
  metadata {
    name      = "todoapp-tls-secret"
    namespace = "todoapp"
  }

  data = {
    "tls.crt" = file("${path.root}/certs/tls.crt")
    "tls.key" = file("${path.root}/certs/tls.key")
  }

  type = "kubernetes.io/tls"

  depends_on = [kubernetes_namespace.todoapp-namespace]
}
