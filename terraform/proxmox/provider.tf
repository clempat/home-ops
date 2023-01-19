provider "proxmox" {

  pm_api_url = var.proxmox_url

  # (Optional) Skip TLS Verification
  pm_tls_insecure = true

  # Debbuging
  # pm_log_enable = true
  # pm_log_file = "terraform-plugin-proxmox.log"
  # pm_debug = true
  # pm_log_levels = {
  #   _default = "debug"
  #   _capturelog = ""
  #  }


}
