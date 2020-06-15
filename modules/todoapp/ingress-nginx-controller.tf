resource "local_file" "cluster-kubeconfig" {
  filename          = "${path.root}/kubeconfig.yaml"
  sensitive_content = var.kube_config_raw_config
}

resource "null_resource" "nginx-ingress-controller" {
  provisioner "local-exec" {
    command = <<EOF
# download and install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.16.0/bin/linux/amd64/kubectl
chmod +x ./kubectl && mv kubectl /usr/local/bin

# download and install helm
curl -LO https://get.helm.sh/helm-v3.2.0-linux-amd64.tar.gz
tar -zxvf ./helm-v3.2.0-linux-amd64.tar.gz && \
  mv ./linux-amd64/helm /usr/local/bin/helm && \
  rm -rf ./linux-amd64/ && rm -f ./helm-v3.2.0-linux-amd64.tar.gz

INGRESS_INSTALLED=$(helm ls --all -n ingress-nginx 2> /dev/null | grep -ic "deployed")

if [ $INGRESS_INSTALLED -eq 0 ]; then
  # add ingress controller repo
  helm repo add nginx-stable https://helm.nginx.com/stable
  echo "repo added"

  # install ingress controller
  helm install ingress-nginx \
    -n ingress-nginx \
    --set controller.name="ingress-nginx" \
    --set controller.kind=deployment \
    --set controller.service.name=ingress-nginx \
    nginx-stable/nginx-ingress
  echo "release installed"
fi

# check if ingress controller is up and running
while [ $(kubectl get pods -n ingress-nginx -l app=ingress-nginx | grep -ic "running") -eq 0 ]; do
  echo "waiting for ingress controller pod to be running"
  sleep 2
done

echo "ingress controller done"
EOF

    environment = {
      KUBECONFIG = local_file.cluster-kubeconfig.filename
    }
  }

  depends_on = [kubernetes_namespace.ingress-nginx-namespace]
}
