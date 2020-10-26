variable "region" {
  description = "Default region, if nothing specified in any module"
  type        = string
}

#Shared VPC

variable "host_project_id" {
  description = "Project ID for host project to host the shared VPC"
  type        = string
}
variable "service_project_id" {
  description = "Project ID for service project"
  type        = string
}
variable "service_project_number" {
  description = "Required to provide service account in service project network user role."
  type        = string
}

variable "enable_apis" {
  description = "Whether to actually enable the APIs. If false, this module is a no-op."
  type        = bool
  default     = "true"

}

variable "activate_apis_service" {
  description = "The list of apis to activate within the project"
  type        = list(string)
  default = [
    "iam.googleapis.com",
    "servicenetworking.googleapis.com",
    "serviceusage.googleapis.com",
  ]
}

variable "activate_apis_host" {
  description = "The list of apis to activate within the project"
  type        = list(string)
  default = [
    "iam.googleapis.com",
    "servicenetworking.googleapis.com",
    "serviceusage.googleapis.com",
  ]
}

#Network VPC

variable "shared_network_name" {
  description = "Name for the Common VPC"
  type        = string
}

variable "shared_subnet_name" {
  description = "Name for subnet to be created"
  type        = string
}

variable "shared_subnet_cidr" {
  description = "CIDR for network VPC"
  type        = string
}

#Development VPC

variable "host_project_id_dev" {
  description = "Project ID for host project to host the shared VPC"
  type        = string
}
variable "service_project_id_dev" {
  description = "Project ID for service project"
  type        = string
}
variable "service_project_number_dev" {
  description = "Required to provide service account in service project network usuer role."
  type        = string
}

variable "shared_network_name_dev" {
  description = "Name for the Development VPC"
  type        = string
}

variable "shared_subnet_name_dev" {
  description = "Name for the subnet to be created"
  type        = string
}

variable "shared_subnet_cidr_dev" {
  description = "CIDR for dev VPC"
  type        = string
}

#Staging VPC

variable "host_project_id_stag" {
  description = "Project ID for host project to host the shared VPC"
  type        = string
}
variable "service_project_id_stag" {
  description = "Project ID for service project"
  type        = string
}
variable "service_project_number_stag" {
  description = "Required to provide service account in service project network usuer role."
  type        = string
}

variable "shared_network_name_stag" {
  description = "Name for the Staging VPC"
  type        = string
}

variable "shared_subnet_name_stag" {
  description = "Name for the subnet to be created"
  type        = string
}

variable "shared_subnet_cidr_stag" {
  description = "CIDR for staging VPC"
  type        = string

}

#Production VPC

variable "host_project_id_prod" {
  description = "Project ID for host project to host the shared VPC"
  type        = string
}
variable "service_project_id_prod" {
  description = "Project ID for service project"
  type        = string
}
variable "service_project_number_prod" {
  description = "Required to provide service account in service project network usuer role."
  type        = string
}

variable "shared_network_name_prod" {
  description = "Name for the Production VPC"
  type        = string
}

variable "shared_subnet_name_prod" {
  description = "Name for the subnet to be created"
  type        = string
}

variable "shared_subnet_cidr_prod" {
  description = "CIDR for production VPC"
  type        = string
}

#Interconnect

variable "asn_bgp" {
  description = <<EOT
Local BGP Autonomous System Number (ASN). 
Must be an RFC6996 private ASN, either 16-bit or 32-bit. 
The value will be fixed for this router resource. 
All VPN tunnels that link to this router will have the same local ASN.
EOT
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


