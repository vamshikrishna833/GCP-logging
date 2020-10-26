resource "google_compute_interconnect_attachment" "on_prem" {
  name    = "${var.prefix}-${var.vlan_interconnect_type}"
  router  = google_compute_router.main.id
  type    = var.vlan_interconnect_type
  project = var.project_id
}

resource "google_compute_router" "main" {
  name    = "${var.prefix}-router"
  network = var.vpc_network
  project = var.project_id
  bgp {
    asn               = var.router_asn_bgp
    advertise_mode    = var.advertise_mode
    advertised_groups = var.advertise_groups
    advertised_ip_ranges {
      range = var.advertised_ip_cidr
    }
  }
}


