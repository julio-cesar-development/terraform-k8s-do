resource "kubernetes_secret" "todoapp-tls-secret" {
  metadata {
    name      = "todoapp-tls-secret"
    namespace = "default"
  }

  data = {
    "tls.crt" = file("${path.module}/certs/tls.crt")
    "tls.key" = file("${path.module}/certs/tls.key")
  }

  type = "kubernetes.io/tls"
}
