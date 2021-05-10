
#DB server private id from dbs erver data
output "db_server_private_id"{
   value = data.aws_instances.db_server_data.private_ips[0]
}