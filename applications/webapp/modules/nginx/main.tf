resource "kubernetes_deployment" "nginx" {
  metadata {
    name      = "nginx"
    namespace = data.kubernetes_namespace.namespace.id
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "nginx"
      }
    }
    template {
      metadata {
        labels = {
            app = "nginx"
        }
      }
      spec {
        container {
          name  = "nginx"
          image = "nginx:latest"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}