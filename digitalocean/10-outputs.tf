output "kubernetes_host" {
  description = "The hostname of the API server for the cluster"
  value       = digitalocean_kubernetes_cluster.cluster.endpoint
}

#output "nfs_ip" {
#  description = "The hostname of the API server for the cluster"
#  value       = kubernetes_service.nfs-server.spec[0].cluster_ip
#}
