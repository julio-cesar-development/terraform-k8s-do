resource "kubernetes_namespace" "todoapp-namespace" {
  metadata {
    name = "todoapp"
  }

  depends_on = [var.var_depends_on]
}

resource "kubernetes_namespace" "ingress-nginx-namespace" {
  metadata {
    name = "ingress-nginx"
  }

  depends_on = [var.var_depends_on]
}

resource "kubernetes_namespace" "cert-manager-namespace" {
  metadata {
    name = "cert-manager"

    labels = {
      "certmanager.k8s.io/disable-validation" = "true"
    }
  }

  depends_on = [var.var_depends_on]
}
