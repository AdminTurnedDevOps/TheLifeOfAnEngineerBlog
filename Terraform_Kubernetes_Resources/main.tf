provider "azurerm" {
  version = "=1.38.0"
}

resource "kubernetes_deployment" "Redis" {
  metadata {
    name = var.name
    labels = {
      test = var.name
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        test = var.name
      }
    }

    template {
      metadata {
        labels = {
          test = var.name
        }
      }

      spec {
        container {
          image = var.image_id
          name  = var.name
          }
        }
      }
    }
  }