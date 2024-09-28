packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
    }
    ansible = {
      version = "~> 1"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

source "docker" "alpine" {
  image        = "golang:alpine"
  commit       = true
  ssh_username = "root"
}

build {
  name = "docker-alpine-demo"
  sources = [
    "source.docker.alpine"
  ]

  provisioner "shell" {
    inline = [
      "apk update",
      "apk add --no-cache python3",
      "apk add --no-cache ansible"
    ]
  }

  provisioner "ansible-local" {
    playbook_file = "./applications/echo-server/ansible/playbook.yaml"
  }

  provisioner "shell" {
    inline = [
      "apk del ansible",
      "apk del python3"
    ]
  }

  post-processors {
    post-processor "docker-tag" {
      repository = "itsnikko/docker-alpine-demo"
      tags       = ["latest"]
    }
    post-processor "docker-push" {
      login          = true
      login_server   = var.docker_server
      login_username = "${var.docker_username}"
      login_password = "${var.docker_token}"
    }
  }
}