resource kubernetes_ingress_v1 echo-server-ingress {
    metadata {
      name = var.meta_name
    }

    spec {
      default_backend {
        service {
          name = var.meta_name
          port {
            number = var.exposed_port
          }
        }
      }

      rule {
        http {
          path {
            backend {
              service {
                name = var.meta_name
                port {
                  number = var.exposed_port
                }
              }
            }
            path      = var.ingress_path
            path_type = var.ingress_path_type
          }
        }
      }
    }
}