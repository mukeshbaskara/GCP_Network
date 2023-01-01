module "vpc" {
  source                                  = "./modules/vpc"
  network_name                            = var.network_name
  auto_create_subnetworks                 = var.auto_create_subnets
  routing_mode                            = var.routing_mode
  project_id                              = var.project_id
  description                             = var.description
  delete_default_internet_gateway_routes  = var.delete_default_internet_gateway_routes
  mtu                                     = var.mtu
}

module "subnet" {
  source = "./modules/subnet"
  subnets = var.subnets
  secondary_ip_ranges = var.secondary_ip_ranges
  network_name  = var.network_name
  project_id = var.project_id
  depends_on = [module.vpc]
}