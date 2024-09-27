variable "docker_username" {
    type = string
}

variable "docker_token" {
    type      = string
    sensitive = true
}