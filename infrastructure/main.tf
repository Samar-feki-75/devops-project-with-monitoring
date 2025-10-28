terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = ">= 2.16.0"
    }
  }
}

provider "docker" {}

resource "docker_network" "appnet" {
  name = "local_appnet"
}

resource "docker_volume" "db_data" {
  name = "local_db_data"
}
resource "docker_volume" "grafana_data" {
  name = "local_grafana_data"
}
