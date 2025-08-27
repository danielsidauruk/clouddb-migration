
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = var.network_name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh-allowed"]
}

resource "google_service_account" "client_vm" {
  account_id   = "client-vm-sa"
  display_name = "Client VM Service Account"
}

resource "google_compute_instance" "client_vm" {
  name         = "client-vm"
  machine_type = "f1-micro"
  zone         = "${var.region}-a"
  tags         = ["ssh-allowed"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork = var.public_subnet
    network    = var.network_name

    access_config {
      // Ephemeral IP
    }
  }

  service_account {
    email  = google_service_account.client_vm.email
    scopes = ["cloud-platform"]
  }

  metadata_startup_script = <<-EOF
    #!/bin/bash
    # Install necessary packages
    apt-get update
    apt-get install -y postgresql-client
  EOF
}
