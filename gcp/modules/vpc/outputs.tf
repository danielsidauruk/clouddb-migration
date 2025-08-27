
output "network_self_link" {
  value = google_compute_network.main.self_link
}

output "public_subnet_name" {
  value = google_compute_subnetwork.public.name
}
