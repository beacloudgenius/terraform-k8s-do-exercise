resource "digitalocean_volume" "disk" {
  region                  = "sfo2"
  name                    = "foundation"
  size                    = 200
  initial_filesystem_type = "ext4"
  description             = "the main storage"
}
