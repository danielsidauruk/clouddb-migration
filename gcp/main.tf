
module "google_services" {
  source = "./modules/google-services"
}

module "vpc" {

  source = "./modules/vpc"

  region              = var.region
  vpc_name            = var.vpc_name
  private_subnet_cidr = var.private_subnet_cidr
  public_subnet_cidr  = var.public_subnet_cidr

  depends_on = [module.google_services]

}

module "client_vm" {

  source = "./modules/client-vm"

  region        = var.region
  network_name  = var.vpc_name
  public_subnet = module.vpc.public_subnet_name

  depends_on = [
    module.google_services,
    module.vpc,
  ]

}

module "cloudsql" {

  source = "./modules/cloudsql"

  region                = var.region
  database_user         = var.database_user
  database              = var.database
  network               = module.vpc.network_self_link
  service_account_email = module.client_vm.service_account_email

  depends_on = [
    module.google_services,
    module.vpc,
  ]

}
