packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
    ansible = {
      version = "~> 1"
      source = "github.com/hashicorp/ansible"
    }
  }
}

source "docker" "alpine" {
  image  = "alpine:latest"
  commit = true
}

build {
  name = "docker-alpine-demo"
  sources = [
    "source.docker.alpine"
  ]

  # provisioner "shell" {
  #   script = "../scripts/ansible.sh"
  # }

  provisioner "ansible" {
    playbook_file = "./applications/echo-server/ansible/playbook.yaml"
  }

  # provisioner "shell" {
  #   script = "../scripts/cleanup.sh"
  # }

  post-processors {
    post-processor "docker-tag" {
      repository = "itsnikko/docker-alpine-demo"
      tags       = ["latest"]
    }
    post-processor "docker-push" {
      login          = true
      login_username = var.docker_username
      login_password = var.docker_token
    }
  }
}