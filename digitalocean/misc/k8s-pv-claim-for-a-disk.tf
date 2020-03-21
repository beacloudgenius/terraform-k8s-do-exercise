resource "kubernetes_persistent_volume_claim" "disk" {
  metadata {
    name = "foundation"
  }

  spec {
    access_modes       = ["ReadWriteOnce"]
    storage_class_name = "do-block-storage"

    resources {
      requests = {
        storage = "200Gi"
      }
    }
  }
}
