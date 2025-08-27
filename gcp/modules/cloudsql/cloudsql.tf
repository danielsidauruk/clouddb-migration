
resource "google_sql_database_instance" "instance" {
  name             = "main-instance"
  database_version = "POSTGRES_14"
  region           = var.region

  settings {
    tier = "db-f1-micro"

    ip_configuration {
      ipv4_enabled    = false
      private_network = var.network
    }
  }

  deletion_protection = false
  root_password       = random_password.db_password.result
}


resource "google_sql_database" "database" {
  name     = var.database
  instance = google_sql_database_instance.instance.name
}

resource "google_sql_user" "main" {
  name     = var.database_user
  instance = google_sql_database_instance.instance.name
  password = random_password.user_password.result
}
