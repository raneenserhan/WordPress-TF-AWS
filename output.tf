#vpc detailes information
output "vpc_details" {
  description = "vpc detailes"
  value = module.vpc
}

#db server private id
output "db_server_private_id" {
  value = module.DB_server.db_server_private_id
}

#web server public id
output "web_server_ip" {
  value  = module.web_server.web_server_ip
  description = "web server public ip address"
}





