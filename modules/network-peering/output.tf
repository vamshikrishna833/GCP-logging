output "vpc_name" {
  value       = data.google_compute_network.vpc-1.self_link
  description = "Name of the VPC"
}

