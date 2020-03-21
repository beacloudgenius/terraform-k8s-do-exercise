resource "helm_release" "ng" {
  name    = "ng"
  chart   = "stable/nginx-ingress"
  version = "1.33.4"

  set {
    name  = "rbac.create"
    value = "true"
  }

  set {
    name  = "controller.image.repository"
    value = "quay.io/kubernetes-ingress-controller/nginx-ingress-controller"
  }

  set {
    name  = "controller.image.tag"
    value = "0.30.0"
  }

  set_string {
    name  = "controller.config.proxy-body-size"
    value = "50m"
  }

  set {
    name  = "controller.service.externalTrafficPolicy"
    value = "Cluster"
  }

  depends_on = [digitalocean_kubernetes_cluster.cluster]

}
