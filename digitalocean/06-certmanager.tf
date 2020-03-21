resource "helm_release" "cm" {
  name      = "cm"
  chart     = "jetstack/cert-manager"
  version   = "v0.14.0"
  namespace = "cert-manager"

  provisioner "local-exec" {
    #command = "kubectl apply --validate=false -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.11/deploy/manifests/00-crds.yaml"
    command = "kubectl apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.14.0/cert-manager.yaml"
  }

  set {
    name  = "ingressShim.defaultIssuerName"
    value = "letsencrypt-prod"
  }

  set {
    name  = "ingressShim.defaultIssuerKind"
    value = "ClusterIssuer"
  }

  set {
    name  = "createCustomResource"
    value = "true"
  }

  depends_on = [digitalocean_kubernetes_cluster.cluster]

}


resource "kubernetes_namespace" "cert-manager" {
  metadata {
    annotations = {
      name = "cert-manager-annotation"
    }

    labels = {
      mylabel = "label-value"
    }

    name = "cert-manager"
  }
}



# kubectl get certificaterequest
# kubectl describe certificaterequest X
# kubectl get order
# kubectl describe order X
# kubectl get challenge
# kubectl describe challenge X
