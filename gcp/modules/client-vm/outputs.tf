
output "instance_name" {
  value = google_compute_instance.client_vm.name
}

output "service_account_email" {
  value = google_service_account.client_vm.email
}