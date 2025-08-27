variable "project_id" {
  description = "The ID of the project to deploy to."
  type        = string
}

variable "region" {
  description = "The region to deploy to."
  type        = string
}

variable "private_subnet_cidr" {
  description = "The Private Subnet CIDR"
  type        = string
}

variable "public_subnet_cidr" {
  description = "The Public Subnet CIDR"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "database_user" {
  description = "The database user for the Cloud SQL database."
  type        = string
}

variable "database" {
  type        = string
  description = "The database name for the Cloud SQL database."
}
