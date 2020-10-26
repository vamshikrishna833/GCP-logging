data "google_compute_network" "vpc-1" {
  name    = var.vpc1_network_name
  project = var.vpc1_project_id
}
data "google_compute_network" "vpc-2" {
  name    = var.vpc2_network_name
  project = var.vpc2_project_id
}

resource "google_compute_network_peering" "vpc1-vpc2-peering" {
  name         = "${data.google_compute_network.vpc-1.name}-${data.google_compute_network.vpc-2.name}-peering"
  network      = data.google_compute_network.vpc-1.self_link
  peer_network = data.google_compute_network.vpc-2.self_link
}

resource "google_compute_network_peering" "vpc2-vpc1-project" {
  name         = "${data.google_compute_network.vpc-2.name}-${data.google_compute_network.vpc-1.name}-peering"
  network      = data.google_compute_network.vpc-2.self_link
  peer_network = data.google_compute_network.vpc-1.self_link
}

