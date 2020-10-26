/*****************************************
 Create the subnets in shared network
*****************************************/

resource "random_id" "id" {
  byte_length = 2
}

resource "google_compute_subnetwork" "subnetwork" {
  region                   = var.region
  project                  = var.host_project_id
  network                  = var.shared_network
  name                     = "${var.shared_subnet_name}-${random_id.id.hex}"
  ip_cidr_range            = var.shared_subnet_cidr
  private_ip_google_access = true
}

