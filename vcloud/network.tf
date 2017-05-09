resource "vcd_network" "docker" {
  name         = "docker-internal"
  edge_gateway = "${var.edge_gw}"
  gateway      = "172.17.0.1"

  dhcp_pool {
    start_address = "172.17.0.2"
    end_address   = "172.17.0.9"
  }

  static_ip_pool {
    start_address = "172.17.0.10"
    end_address   = "172.17.0.254"
  }
}

resource "vcd_snat" "outbound" {
  edge_gateway = "${var.edge_gw}"
  external_ip  = "199.119.86.26"
  internal_ip  = "172.17.0.0/24"
}

