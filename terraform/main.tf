terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "0.0.15"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
  }
}

provider "kind" {}

resource "kind_cluster" "default" {
  name           = "kindcluster"
  node_image     = "kindest/node:v1.25.2"
  wait_for_ready = true

  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"
    }

    node {
      role = "worker"
    }
    node {
      role = "worker"
    }
    node {
      role = "worker"
    }
  }
}

provider "kubectl" {
  config_path = "/root/.kube/config"
}
resource "kubectl_manifest" "test" {
  yaml_body = file("../manifest/cluster.yml")
}
