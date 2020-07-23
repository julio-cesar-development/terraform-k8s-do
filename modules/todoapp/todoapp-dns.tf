# AWS records
resource "aws_route53_record" "todoapp-ns-record" {
  allow_overwrite = false
  name            = "todoapp.ondo.${var.todoapp_domain}"
  ttl             = 30
  type            = "NS"
  zone_id         = var.aws_hosted_zone_id

  records = [
    "ns3.digitalocean.com.",
    "ns2.digitalocean.com.",
    "ns1.digitalocean.com.",
  ]

  depends_on = [kubernetes_ingress.todoapp-ingress]
}

# Digital Ocean records
resource "digitalocean_domain" "todoapp-domain-record" {
  name = "todoapp.ondo.${var.todoapp_domain}"

  depends_on = [kubernetes_ingress.todoapp-ingress]
}

resource "digitalocean_record" "todoapp-a-record" {
  domain = digitalocean_domain.todoapp-domain-record.name
  type   = "A"
  name   = "@"
  value  = kubernetes_ingress.todoapp-ingress.load_balancer_ingress.0.ip

  depends_on = [digitalocean_domain.todoapp-domain-record]
}
