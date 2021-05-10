#AWS region
variable "region" {
 type = string
 default = "eu-central-1"
 description = "AWS region"  
}


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
variable "public_subnet_name" {
  type = string
  description = "public vpc subnet name"
}

#DB instance type
variable "db_instance_type"{
  type = string
  description = "DB Server's machine type"
}


#DB instance name
variable "db_instance_name"{
  type = string
  description = "DB server's name"
}

#DB root password
variable "db_root_pwd"{
  type = string
}

#DB username
variable "db_user"{
  type = string
}

#DB user password
variable "db_user_pwd"{
  type = string
}

#DB name
variable "db_name"{
  type = string
}

#web server's machine type
variable "web_instance_type"{
  type = string
}

#web server's name
variable "web_instance_name"{
  type = string
}

#instance's key name
variable "key_name"{
  type = string
}
