
terraform {
  backend "gcs" {
    bucket = "rizvi-nic-tf-state-2026"
    prefix = "environments/dev"
  }
}
