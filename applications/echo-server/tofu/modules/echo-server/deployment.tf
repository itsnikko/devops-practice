resource "kubernetes_deployment" "echo-server" {
    metadata {
      name      = var.meta_name
      namespace = var.namespace
    }

    spec {
        replicas = var.desired_replicas
        selector {
          match_labels = {
            app = var.meta_name
          }
        }
        template {
          metadata {
            labels = {
                app = var.meta_name
            }
          }
          spec {
            container {
              name  = var.meta_name
              image = var.image_name
              port {
                container_port = var.target_port
                protocol       = var.transport_protocol
              }
              resources {
                limits = {
                  cpu    = var.cpu_limit
                  memory = var.memory_limit
                }
                requests = {
                  cpu    = var.cpu_requests
                  memory = var.memory_requests
                }
              }
              liveness_probe {
                http_get {
                  path = var.livness_probe_path
                  port = var.livness_probe_port
                }
                failure_threshold     = 5
                initial_delay_seconds = 3
                period_seconds        = 3
              }
            }
          }
        }
    }
}