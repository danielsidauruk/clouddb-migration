
output "database_name" {
  value = google_sql_database.database.name
}

output "user_name" {
  value = google_sql_user.main.name
}

output "database_private_ip" {
  value = google_sql_database_instance.instance.private_ip_address
}

output "database_public_ip" {
  value = google_sql_database_instance.instance.public_ip_address
}