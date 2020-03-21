resource "kubernetes_secret" "cloudflare_credentials" {
  metadata {
    name = "cloudflare-api-key"
  }

  data = {
    EMAIL = "${var.cloudflare_email}"
    api-key   = "${var.cloudflare_token}"
  }
}
