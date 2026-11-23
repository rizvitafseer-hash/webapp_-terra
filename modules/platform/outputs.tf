
output "subnet_id" {
  value = module.network.subnet_id
}

output "vm_service_account_email" {
  value = google_service_account.vm_sa.email
}

output "network_id" {
  value = module.network.network_id
}
