resource "kubernetes_namespace" "todoapp-namespace" {
  metadata {
    name = "todoapp"
  }

  depends_on = [var.var_depends_on]
}
