resource "digitalocean_kubernetes_cluster" "cluster" {
  name    = var.cluster_name
  region  = var.do_region
  version = var.cluster_version
  tags    = var.cluster_tags

  node_pool {
    name       = var.cluster_name
    tags       = var.pool_default_node_tags

    size       = var.pool_default_node_size

    node_count = var.pool_default_node_count
    min_nodes  = var.pool_default_min_nodes
    max_nodes  = var.pool_default_max_nodes

    auto_scale = true

  }
}
