output "private_network" {
  value       = google_compute_network.shared_network.id
  description = "Network ID"
}

output "private_network_name" {
  value       = google_compute_network.shared_network.name
  description = "Name of the network"
}

output "host_project_id" {
  value       = google_compute_network.shared_network.project
  description = "Host Project of shared VPC"
}

