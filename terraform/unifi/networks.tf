# Not used yet
resource "unifi_network" "homelab" {
  name    = "homelab"
  vlan_id = 40
  subnet  = "192.168.40.0/24"

  dhcp_dns            = []
  dhcp_enabled        = false
  dhcp_lease          = 0
  dhcp_relay_enabled  = false
  dhcpd_boot_enabled  = false
  igmp_snooping       = true
  multicast_dns       = true
  ipv6_interface_type = "none"
  ipv6_ra_enable      = false
  network_group       = "LAN"
  purpose             = "corporate"
  wan_dns             = []
  wan_egress_qos      = 0
}
