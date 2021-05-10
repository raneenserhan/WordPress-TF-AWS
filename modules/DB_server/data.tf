#get db server detailes
data "aws_instances" "db_server_data"{
  filter{
    name = "instance-id"
    values = [aws_instance.db-server.id]
   
  }
   instance_state_names=["running","stopped"]
}