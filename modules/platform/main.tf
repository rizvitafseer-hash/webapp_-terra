
resource "google_project_service" "apis" {
  for_each = toset([
    "compute.googleapis.com",
    "iam.googleapis.com",
    "storage.googleapis.com",
    "secretmanager.googleapis.com",
    "cloudresourcemanager.googleapis.com"
  ])

  project            = var.project_id
  service            = each.value
  disable_on_destroy = false
}

resource "google_service_account" "vm_sa" {
  project      = var.project_id
  account_id   = "apache-vm-sa"
  display_name = "Apache VM Service Account"

  depends_on = [
    google_project_service.apis
  ]
}

module "network" {
  source = "../network"

  network_name = var.network_name
  subnet_name  = var.subnet_name
  region       = var.region
  subnet_cidr  = var.subnet_cidr

  depends_on = [
    google_project_service.apis
  ]
}

module "storage" {
  source = "../storage"

  project_id  = var.project_id
  bucket_name = var.app_bucket_name
  region      = var.region
  kms_key_name = var.kms_key_name

  depends_on = [
    google_project_service.apis
  ]
}
