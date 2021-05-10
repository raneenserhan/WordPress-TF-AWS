

#  web server inctance resource 
resource "aws_instance" "web-server" {
  ami = var.image_id
  instance_type = var.instance_type
  subnet_id= var.subnet_id 
  security_groups = var.security_groups
  key_name = var.key_name
  user_data= var.user_data

  tags = {
    Name = var.instance_name
  }

  
}