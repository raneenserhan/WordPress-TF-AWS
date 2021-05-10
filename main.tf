terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
      
    }
  }
}

# Configure the AWS Provider
provider "aws" {
    
  region = var.region
  #access_key = "-----access key is requried ---------"
  #secret_key = "-----secret key is requried ---------"
}

#Create Vpc
module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.cidr_block
  vpc_name = var.vpc_name
  public_subnet_cidr = var.public_subnet_cidr
  public_vpc_name = var.public_subnet_name

}

// security group 
resource "aws_security_group" "allow_traffic" {
  name = "allow_traffic"
  description = "Allow inbound web traffic"
  vpc_id = module.vpc.vpc_id

  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = ["::/0"]
    description = "HTTP"
    from_port = 80
    to_port = 80
    protocol = "tcp"
  }

  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = ["::/0"]
    description = "HTTPS"
    from_port = 443
    to_port = 443
    protocol = "tcp"
  }

  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = ["::/0"]
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
  }
  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = ["::/0"]
    description = "All networks allowed"
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
  egress  {
    cidr_blocks = [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = ["::/0"]
    description = "All networks allowed"
    from_port = 0
    to_port = 0
    protocol = "-1"
  }

  tags = {
    "Name" = "homework4-sg"
  }

}


#Create mysql db instance
module "DB_server"{
  source = "./modules/DB_server"
  image_id = data.aws_ami.ubuntu.id
  key_name = var.key_name
  instance_type = var.db_instance_type
  subnet_id = module.vpc.public_subnet_id 
  security_groups =  [aws_security_group.allow_traffic.id]
  instance_name = var.db_instance_name
  user_data= data.template_file.db.rendered 

}

# renders a template from mysql_docker script
data "template_file" "db" {
  template = "${file("mysql_docker.sh")}"
  #vars to pass in the scrips
  vars = {
   db_root_pwd = var.db_root_pwd
   db_name = var.db_name
   db_user = var.db_user
   db_user_pwd = var.db_user_pwd
  }

}

# renders a template from web_docker script
data "template_file" "web" {
  template = "${file("wp_docker.sh")}"
  
  #vars to pass in the scrips
  vars = {
   db_ip = module.DB_server.db_server_private_id
   db_name = var.db_name
   db_user = var.db_user
   db_user_pwd = var.db_user_pwd
 }
}

#Create wordpress web instance
module "web_server"{
  source = "./modules/web_server"
  image_id = data.aws_ami.ubuntu.id
  instance_type = var.web_instance_type
  key_name = var.key_name
  subnet_id = module.vpc.public_subnet_id 
  security_groups =  [aws_security_group.allow_traffic.id] 
  instance_name = var.web_instance_name
  user_data= data.template_file.web.rendered

}




