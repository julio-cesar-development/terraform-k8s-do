output "kube_config_raw_config" {
  value = digitalocean_kubernetes_cluster.k8s-cluster.kube_config.0.raw_config
}

output "kube_config_cluster_ca_certificate" {
  value = digitalocean_kubernetes_cluster.k8s-cluster.kube_config.0.cluster_ca_certificate
}

output "kube_config_token" {
  value = digitalocean_kubernetes_cluster.k8s-cluster.kube_config.0.token
}

output "endpoint" {
  value = digitalocean_kubernetes_cluster.k8s-cluster.endpoint
}

output "lb_ingress_ip" {
  value = kubernetes_ingress.todoapp-ingress.load_balancer_ingress.0.ip
}

output "lb_ingress_hostname" {
  value = kubernetes_ingress.todoapp-ingress.load_balancer_ingress.0.hostname
}
