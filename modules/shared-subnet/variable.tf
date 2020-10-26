variable "host_project_id" {
  description = "Project ID for host project to host the shared VPC."
  type        = string
}
variable "region" {
  description = "Pass the Region value for the network."
  type        = string
}
variable "shared_network" {
  description = "Required to provide Network Name."
  type        = string
}
variable "shared_subnet_name" {
  description = "Required to provide Subnet Name."
  type        = string
}
variable "shared_subnet_cidr" {
  description = "Required to provide Subnet CIDR."
  type        = string
}

