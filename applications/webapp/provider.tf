terraform {
  required_providers {
    opentofu = {
        source  = "opentofu/kubernetes"
        version = "2.32.0"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}