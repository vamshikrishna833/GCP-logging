module "shared_vpc" {
  source = "./modules/shared-vpc/"

  host_project_id        = var.host_project_id
  service_project_id     = var.service_project_id
  service_project_number = var.service_project_number
  activate_apis_host     = var.activate_apis_host
  activate_apis_service  = var.activate_apis_service
  shared_network_name    = var.shared_network_name
}

module "shared_vpc_subnet1" {
  source = "./modules/shared-subnet/"

  host_project_id    = module.shared_vpc.host_project_id
  shared_network     = module.shared_vpc.private_network_name
  shared_subnet_name = var.shared_subnet_name
  shared_subnet_cidr = var.shared_subnet_cidr
  region             = var.region
}

module "shared_vpc_dev" {
  source = "./modules/shared-vpc/"

  enable_apis            = "false"
  host_project_id        = var.host_project_id_dev
  service_project_id     = var.service_project_id_dev
  service_project_number = var.service_project_number_dev
  shared_network_name    = var.shared_network_name_dev
}

module "shared_vpc_dev_subnet1" {
  source = "./modules/shared-subnet/"

  host_project_id    = module.shared_vpc_dev.host_project_id
  shared_network     = module.shared_vpc_dev.private_network_name
  shared_subnet_name = var.shared_subnet_name_dev
  shared_subnet_cidr = var.shared_subnet_cidr_dev
  region             = var.region
}

module "shared_vpc_stag" {
  source = "./modules/shared-vpc/"

  enable_apis            = "false"
  host_project_id        = var.host_project_id_stag
  service_project_id     = var.service_project_id_stag
  service_project_number = var.service_project_number_stag
  shared_network_name    = var.shared_network_name_stag
}

module "shared_vpc_stag_subnet1" {
  source = "./modules/shared-subnet/"

  host_project_id    = module.shared_vpc_stag.host_project_id
  shared_network     = module.shared_vpc_stag.private_network_name
  shared_subnet_name = var.shared_subnet_name_stag
  shared_subnet_cidr = var.shared_subnet_cidr_stag
  region             = var.region
}

module "shared_vpc_prod" {
  source = "./modules/shared-vpc/"

  enable_apis            = "false"
  host_project_id        = var.host_project_id_prod
  service_project_id     = var.service_project_id_prod
  service_project_number = var.service_project_number_prod
  shared_network_name    = var.shared_network_name_prod
}

module "shared_vpc_prod_subnet1" {
  source = "./modules/shared-subnet/"

  host_project_id    = module.shared_vpc_prod.host_project_id
  shared_network     = module.shared_vpc_prod.private_network_name
  shared_subnet_name = var.shared_subnet_name_prod
  shared_subnet_cidr = var.shared_subnet_cidr_prod
  region             = var.region
}

module "vpc-peering-dev" {
  source = "./modules/network-peering/"

  vpc1_project_id       = module.shared_vpc.host_project_id
  vpc1_network_name     = module.shared_vpc.private_network_name
  vpc2_project_id       = module.shared_vpc_dev.host_project_id
  vpc2_network_name     = module.shared_vpc_dev.private_network_name
  depends_on_connection = "module.shared_vpc.private_network_name"
}

module "vpc-peering-stag" {
  source = "./modules/network-peering/"

  vpc1_project_id       = module.shared_vpc.host_project_id
  vpc1_network_name     = module.shared_vpc.private_network_name
  vpc2_project_id       = module.shared_vpc_stag.host_project_id
  vpc2_network_name     = module.shared_vpc_stag.private_network_name
  depends_on_connection = module.vpc-peering-dev.vpc_name
}

module "vpc-peering-prod" {
  source = "./modules/network-peering/"

  vpc1_project_id       = module.shared_vpc.host_project_id
  vpc1_network_name     = module.shared_vpc.private_network_name
  vpc2_project_id       = module.shared_vpc_prod.host_project_id
  vpc2_network_name     = module.shared_vpc_prod.private_network_name
  depends_on_connection = module.vpc-peering-stag.vpc_name
}

module "onprem_vlan_attachment" {
  source = "./modules/vlan-attachment/"

  vlan_interconnect_type = "PARTNER"
  router_asn_bgp         = var.asn_bgp
  vpc_network            = module.shared_vpc.private_network_name
  project_id             = module.shared_vpc.host_project_id
  advertise_mode         = var.advertised_mode
  advertise_groups       = var.advertised_groups
  advertised_ip_cidr     = var.advertised_ip_cidr
}

#NOTE: Shared VPC uses host_project_id for VPC creation hence revered it in Module

