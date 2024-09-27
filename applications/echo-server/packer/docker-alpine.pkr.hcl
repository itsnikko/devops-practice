packer {
  required_plugins {
    docker = {
      version = ">= 1.0.8"
      source  = "github.com/hashicorp/docker"
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

  provisioner "shell" {
    script = "../scripts/ansible.sh"
  }

  provisioner "ansible-local" {
    playbook_file = "../ansible/playbook.yaml"
  }

  provisioner "shell" {
    script = "../scripts/cleanup.sh"
  }

  post-processors {
    post-processor "docker-tag" {
      repository = "itsnikko/docker-alpine-demo"
      tags       = ["v1"]
    }
    post-processor "docker-push" {
        login          = true
        login_username = "itsnikko"
        login_password = var.dockerpwd
    }
  }
}