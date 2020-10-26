output "shared_network" {
  value       = module.shared_vpc.private_network
  description = "Shared network for Central VPC"
}

output "shared_network_dev" {
  value       = module.shared_vpc_dev.private_network
  description = "Shared network for Development VPC"
}

output "shared_network_stag" {
  value       = module.shared_vpc_stag.private_network
  description = "Shared network for Staging VPC"
}

output "shared_network_prod" {
  value       = module.shared_vpc_prod.private_network
  description = "Shared network for Production VPC"
}

