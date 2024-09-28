variable "docker_server" {
  type    = string
  default = "docker.io"
}
variable "docker_username" {
  type = string
}

variable "docker_token" {
  type      = string
  sensitive = true
}