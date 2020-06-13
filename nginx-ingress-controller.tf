# resource "local_file" "cluster-kubeconfig" {
#   filename          = "${path.module}/kubeconfig.yaml"
#   sensitive_content = digitalocean_kubernetes_cluster.k8s-cluster.kube_config.0.raw_config
# }

# locals {
#   nginx-ingress-manifest-body = chomp(file("${path.module}/nginx-ingress-controller.yaml"))
# }

# output "nginx-ingress-manifest" {
#   value = local.nginx-ingress-manifest-body
# }

# resource "null_resource" "nginx-ingress-controller" {
#   provisioner "local-exec" {
#     command = <<EOF
# curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.16.0/bin/linux/amd64/kubectl
# chmod +x ./kubectl && mv kubectl /usr/local/bin
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-0.32.0/deploy/static/provider/aws/deploy.yaml
# EOF

#     environment = {
#       KUBECONFIG = local_file.cluster-kubeconfig.filename
#     }
#   }

#   depends_on = [digitalocean_kubernetes_cluster.k8s-cluster]
# }

# kubectl get pods,deploy,svc --all-namespaces -l app.kubernetes.io/name=ingress-nginx
