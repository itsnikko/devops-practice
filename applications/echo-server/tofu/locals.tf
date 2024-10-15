locals {
  namespace          = "dev"
  meta_name          = "echo-server"
  desired_replicas   = 2
  image_name         = "itsnikko/docker-alpine-demo:latest"

  exposed_port       = 80
  target_port        = 3333
  transport_protocol = "TCP"
  
  cpu_limit          = "0.5"
  memory_limit       = "512Mi"
  cpu_requests       = "250m"
  memory_requests    = "50Mi"
  
  livness_probe_path = "/v1/health"
  livness_probe_port = 80

  service_type       = "NodePort"
  ingress_path       = "/"
  ingress_path_type  = "Exact"
}