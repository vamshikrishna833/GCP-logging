variable "prefix" {
  description = "Name prefix for the vlan attachment"
  type        = string
}

variable "vlan_interconnect_type" {
  description = "Vlan Attachment Type."
  type        = string
}

variable "vpc_network" {
  description = "VPN Network Name."
  type        = string
}

variable "project_id" {
  description = "Project id."
  type        = string
}

variable "router_asn_bgp" {
  description = "BGP ASN number."
  type        = string
}

variable "advertise_mode" {
  description = "The mode to use for avertisement, Possible values are DEFAULT AND CUSTOM"
  type        = string
}

variable "advertised_groups" {
  description = "The mode to use for advertisment, Possible values is either ALL_SUBNETS or empty"
  type        = list(string)
}

variable "advertised_ip_cidr" {
  description = "User-specified list of individual IP ranges to advertise"
  type        = string
}




