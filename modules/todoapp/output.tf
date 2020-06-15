output "lb_ingress_ip" {
  value = kubernetes_ingress.todoapp-ingress.load_balancer_ingress.0.ip
}

output "lb_ingress_hostname" {
  value = kubernetes_ingress.todoapp-ingress.load_balancer_ingress.0.hostname
}
