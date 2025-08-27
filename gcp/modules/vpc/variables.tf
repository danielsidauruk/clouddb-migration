
variable "vpc_name" {
  description = "The name of the VPC network"
  type        = string
}

variable "region" {
  description = "The region where the network and subnets will be created"
  type        = string
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
  type        = string
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  type        = string
}
