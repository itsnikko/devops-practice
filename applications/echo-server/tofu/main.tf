module echo-server {
    source    = "./modules/echo-server"
    namespace = local.namespace

    meta_name          = local.meta_name
    desired_replicas   = local.desired_replicas
    image_name         = local.image_name
    exposed_port       = local.exposed_port
    target_port        = local.target_port
    transport_protocol = local.transport_protocol
    cpu_limit          = local.cpu_limit
    memory_limit       = local.memory_limit
    cpu_requests       = local.cpu_requests
    memory_requests    = local.memory_requests
    livness_probe_path = local.livness_probe_path
    livness_probe_port = local.livness_probe_port
    service_type       = local.service_type
    ingress_path       = local.ingress_path
    ingress_path_type  = local.ingress_path_type
}