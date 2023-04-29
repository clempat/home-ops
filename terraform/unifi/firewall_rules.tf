resource "unifi_firewall_rule" "accept_established" {
  enabled = false
  name    = "accept established"
  action  = "accept"
  ruleset = "LAN_IN"

  rule_index = 2011

  protocol = "all"

  state_established = true
  state_related     = true
}

resource "unifi_firewall_rule" "accept_home_assistant" {
  name    = "Accept Home Assistant"
  action  = "accept"
  ruleset = "LAN_IN"

  rule_index = 2012

  protocol = "tcp"

  dst_address = "192.168.40.5"
}

resource "unifi_firewall_rule" "accept_dns" {
  name    = "Accept DNS"
  action  = "accept"
  ruleset = "LAN_IN"

  rule_index = 2013

  protocol = "udp"

  dst_port = "53"
}

resource "unifi_firewall_rule" "accept_shield_to_mediacenter" {
  name    = "Accept Shield to Mediacenter"
  action  = "accept"
  ruleset = "LAN_IN"

  rule_index = 2014

  src_address = "192.168.20.6"
  dst_address = "192.168.30.4"
}

resource "unifi_firewall_rule" "drop_iot_to_local" {
  name    = "Drop IoT to local"
  action  = "drop"
  ruleset = "LAN_LOCAL"

  rule_index = 2020

  protocol = "all"

  src_network_id = resource.unifi_network.iot.id
}

resource "unifi_firewall_rule" "drop_iot_to_lan" {
  name    = "Drop IoT to LAN"
  action  = "drop"
  ruleset = "LAN_IN"

  rule_index = 2021

  protocol = "all"

  src_network_id = resource.unifi_network.iot.id
  dst_address    = "192.168.0.0/16"
}
