
resource "google_compute_network" "main" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public" {
  name                     = "public-subnet"
  ip_cidr_range            = var.public_subnet_cidr
  network                  = google_compute_network.main.self_link
  region                   = var.region
  private_ip_google_access = false
}

resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = google_compute_network.main.self_link
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}

resource "google_compute_global_address" "private_ip_address" {
  name          = "psc-range"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.main.self_link
}
