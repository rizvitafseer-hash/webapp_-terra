
module "platform" {
  source = "../../modules/platform"

  project_id      = var.project_id
  region          = var.region
  network_name    = "dev-vpc"
  subnet_name     = "dev-subnet"
  subnet_cidr     = "10.10.1.0/24"
  app_bucket_name = var.app_bucket_name
  secret_id       = "dev-app-secret"
  kms_key_name    = null
}

module "compute" {
  source = "../../modules/compute"

  project_id            = var.project_id
  zone                  = var.zone
  instance_name         = "dev-apache-vm"
  machine_type          = "e2-micro"
  subnet_id             = module.platform.subnet_id
  service_account_email = module.platform.vm_service_account_email
}
