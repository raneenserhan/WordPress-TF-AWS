
#web server's public id
output "web_server_ip" {
  value  =  aws_instance.web-server.public_ip
  description = "web instance's public id"

}
