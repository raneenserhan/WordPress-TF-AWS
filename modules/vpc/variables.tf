# VPC cidr block
variable "cidr_block" {
  type = string
  description = "VPC CIDR Block"
}

#VPC Name
variable "vpc_name" {
  type = string
  description = "vpc name"
}

# Public VPC cider block
variable "public_subnet_cidr" {
  type = string
  description = "public VPC subnet CIDR Block"
}


#public VPC Name
variable "public_vpc_name" {
  type = string
  description = "public vpc subnet name"
}