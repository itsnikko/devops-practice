resource kubernetes_service echo-server-service {
    metadata {
      name = var.meta_name
    }

    spec {
      port {
        port        = var.exposed_port
        target_port = var.target_port
      }
      type = var.service_type
    }
}