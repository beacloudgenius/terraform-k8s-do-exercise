provider "external" {
  version = "~> 1.2"
}

provider "cloudflare" {
  email   = var.cloudflare_email
  token   = var.cloudflare_token
  version = "~> 1.18"
}

provider "kubernetes" {
  host = digitalocean_kubernetes_cluster.cluster.endpoint

  version = "~> 1.11"

  client_certificate = base64decode(
    digitalocean_kubernetes_cluster.cluster.kube_config[0].client_certificate,
  )
  client_key = base64decode(
    digitalocean_kubernetes_cluster.cluster.kube_config[0].client_key,
  )
  cluster_ca_certificate = base64decode(
    digitalocean_kubernetes_cluster.cluster.kube_config[0].cluster_ca_certificate,
  )
}

provider "digitalocean" {
  version = "~> 1.14"
  token   = var.do_token
}

provider "local" {
  version = "~> 1.4"
}

provider "null" {
  version = "~> 2.1"
}

provider "template" {
  version = "~> 2.1"
}
