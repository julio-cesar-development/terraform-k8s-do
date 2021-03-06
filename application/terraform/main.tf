terraform {
  required_version = "~> 0.12.26"

  required_providers {
    null = "~> 3.0.0"
    aws  = "~> 2.69"
  }
}

resource "local_file" "cluster_kubeconfig" {
  sensitive_content = var.kubeconfig_content
  filename          = "${path.module}/kubeconfig"
}

resource "null_resource" "deployment" {
  triggers = {
    build_number = timestamp()
  }

  provisioner "local-exec" {
    command = <<EOF
set -e

# set kubeconfig var
export KUBECONFIG=$PWD/$KUBECONFIG_FILENAME

# helm plugins
if [ $(helm plugin list | grep "secrets" | wc -l) -eq 0 ]; then
  helm plugin install https://github.com/zendesk/helm-secrets --version v2.0.2 1> /dev/null 2>&1
fi

# deploy (references to module folder)
cd ../
helmfile --log-level=debug --environment $ENVIRONMENT sync
EOF

    environment = {
      KUBECONFIG_FILENAME = local_file.cluster_kubeconfig.filename
      ENVIRONMENT         = var.env
      APP_VERSION         = var.app_version
    }
  }
}
