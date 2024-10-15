variable meta_name {
    description = "Name of the application to be used as selector"
    type        = string
}

variable namespace {
    description = "Kubernetes namespace to deploy into"
    type        = string
}

variable desired_replicas {
    description = "Desired number of replicas"
    type        = number
}
variable image_name {
    description = "Docker Image name and version to pull"
    type        = string
}

variable exposed_port {
    description = "External port service will be accessed on"
    type        = number
}

variable target_port {
    description = "Internal port service will run on"
    type        = number
}

variable transport_protocol {
    description = "Transport layer protocol (TCP/UDP/Etc.)"
    type        = string
}

variable cpu_limit {
    description = "Max limit of CPU resources"
    type        = string
}

variable memory_limit {
    description = "Max limit of memory resources"
    type        = string
}

variable cpu_requests {
    description = "Requested CPU resources"
    type        = string
}

variable memory_requests {
    description = "Requested memory resources"
    type        = string
}

variable livness_probe_path {
    description = "Path to health check endpoint"
    type        = string
}

variable livness_probe_port {
    description = "Port of health check endpoint"
    type        = number
}

variable service_type {
    description = "Kubernetes network service type (e.g. LoadBalancer)"
    type        = string
}

variable ingress_path {
    description = "Path of exposed application"
    type        = string
}

variable ingress_path_type {
    description = "Match type for ingress path"
    type        = string
}