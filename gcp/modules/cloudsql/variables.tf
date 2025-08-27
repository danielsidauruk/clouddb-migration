
variable "region" {
  description = "The region where the Cloud SQL instance will be deployed."
  type        = string
}

variable "database_user" {
  description = "The name of the database user."
  type        = string
}

variable "network" {
  description = "The name of the VPC network."
  type        = string
}

variable "service_account_email" {
  description = "The email of the service account."
  type        = string
}

variable "database" {
  description = "The name of the database."
  type        = string
}