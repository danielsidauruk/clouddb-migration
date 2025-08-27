
output "database_private_ip" {
  value = module.cloudsql.database_private_ip
}

output "user_name" {
  value = module.cloudsql.user_name
}

output "database_name" {
  value = module.cloudsql.database_name
}
