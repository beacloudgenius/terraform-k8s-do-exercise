# brew install helm
# helm repo add stable https://kubernetes-charts.storage.googleapis.com
# helm repo add jetstack https://charts.jetstack.io
# helm repo update

provider "helm" {
  kubernetes {
    host                   = digitalocean_kubernetes_cluster.cluster.endpoint
    client_certificate     = base64decode(digitalocean_kubernetes_cluster.cluster.kube_config.0.client_certificate)
    client_key             = base64decode(digitalocean_kubernetes_cluster.cluster.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(digitalocean_kubernetes_cluster.cluster.kube_config.0.cluster_ca_certificate)
  }

  version = "~> 1.1"

  #install_tiller  = true
  #service_account = kubernetes_service_account.tiller.metadata.0.name
  #namespace       = kubernetes_service_account.tiller.metadata.0.namespace
  #tiller_image    = "gcr.io/kubernetes-helm/tiller:v2.13.0"
}
