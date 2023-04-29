data "unifi_ap_group" "all" {
  name = "All APs"
}

data "unifi_ap_group" "outdoor" {
  name = "Outdoor"
}

data "unifi_user_group" "default" {
}

data "onepassword_vault" "Homelab" {
  name = "Homelab"
}

data "onepassword_item" "iot_wifi" {
  vault = data.onepassword_vault.Homelab.uuid
  title = "Unifi IoT"
}

locals {
  iot_section          = data.onepassword_item.iot_wifi.section[index(data.onepassword_item.iot_wifi.section.*.label, "Wifi")]
  iot_ssid_field       = local.iot_section.field[index(local.iot_section.field.*.label, "ssid")]
  iot_passphrase_field = local.iot_section.field[index(local.iot_section.field.*.label, "passphrase")]
}

resource "unifi_wlan" "IoT" {
  name       = local.iot_ssid_field.value
  passphrase = local.iot_passphrase_field.value
  security   = "wpapsk"

  network_id    = unifi_network.iot.id
  ap_group_ids  = [data.unifi_ap_group.all.id]
  user_group_id = data.unifi_user_group.default.id

  hide_ssid = true
  wlan_band = "2g"
}

