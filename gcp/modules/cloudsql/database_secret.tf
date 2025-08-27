
resource "random_password" "db_password" {
  length           = 16
  special          = true
  override_special = "!#&*()-_+[]{}<>"
}

resource "google_secret_manager_secret" "db_password_secret" {
  secret_id = "db-password"

  replication {
    user_managed {
      replicas {
        location = var.region
      }
    }
  }
}

resource "google_secret_manager_secret_version" "db_password_secret_version" {
  secret      = google_secret_manager_secret.db_password_secret.id
  secret_data = random_password.db_password.result
}

# resource "google_secret_manager_secret_iam_member" "db_secret_access" {
#   secret_id = google_secret_manager_secret.db_password_secret.id
#   role      = "roles/secretmanager.secretAccessor"
#   member    = "serviceAccount:${var.service_account_email}"
# }
