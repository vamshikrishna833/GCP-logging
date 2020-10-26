variable "host_project_id" {
  description = "Project ID for host project to host the shared VPC"
  type        = string
}

variable "service_project_id" {
  description = "Project ID for service project"
  type        = string
}

variable "service_project_number" {
  description = "Required to provide service account in service project network usuer role."
  type        = string
}

variable "region" {
  description = "Default region, if nothing specified in any module"
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
  default     = []
}

variable "activate_apis_host" {
  description = "The list of apis to activate within the project"
  type        = list(string)
  default     = []
}

variable "disable_services_on_destroy" {
  description = "Whether project services will be disabled when the resources are destroyed. https://www.terraform.io/docs/providers/google/r/google_project_service.html#disable_on_destroy"
  default     = "true"
  type        = string
}

variable "disable_dependent_services" {
  description = "Whether services that are enabled and which depend on this service should also be disabled when this service is destroyed. https://www.terraform.io/docs/providers/google/r/google_project_service.html#disable_dependent_services"
  default     = "true"
  type        = string
}

variable "shared_network_name" {
  description = "VPC name for the network"
  type        = string
}

variable "shared_subnet_name" {
  description = "Subnet name for the network"
  type        = string
}

variable "shared_subnet_cidr" {
  description = "Subnet CIdr for the network"
  type        = string
}

