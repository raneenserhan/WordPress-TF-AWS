#instance image id 
variable "image_id" {
  type = string
  description = "Server's image id"
}

#instance type
variable "instance_type"{
    type = string
    default = "t2.micro"
    description = "Server's machine type"
}


#instance's name
variable "instance_name"{
    type = string
    description = "Server's name"
}

#public subnet id
variable "subnet_id"{
  type =string
  description = "Server's subnet id"

}

#db instance user data
variable "user_data"{
  type = any
  description = "Server's user data"
}

#instance's key name
variable "key_name"{
  type = any
  description = "Server's key pair name"
}

#db instance security group list
variable "security_groups"{
  type = list(string)
  description = "Server's security group list"
}