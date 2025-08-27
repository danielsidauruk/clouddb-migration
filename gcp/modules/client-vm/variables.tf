
variable "region" {
  description = "The region where the client VM will be deployed."
  type        = string
}

variable "network_name" {
  description = "The name of the VPC network."
  type        = string
}

variable "public_subnet" {
  description = "The name of the public subnet."
  type        = string
}
