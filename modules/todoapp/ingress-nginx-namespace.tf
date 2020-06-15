resource "kubernetes_namespace" "ingress-nginx-namespace" {
  metadata {
    name = "ingress-nginx"
  }

  depends_on = [var.var_depends_on]
}
