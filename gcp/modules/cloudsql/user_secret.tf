
resource "random_password" "user_password" {
  length           = 16
  special          = true
  override_special = "!#&*()-_+[]{}<>"
}

resource "google_secret_manager_secret" "user_password_secret" {
  secret_id = "user-password"

  replication {
    user_managed {
      replicas {
        location = var.region
      }
    }
  }
}

resource "google_secret_manager_secret_version" "user_password_secret_version" {
  secret      = google_secret_manager_secret.user_password_secret.id
  secret_data = random_password.user_password.result
}
