#aws provider
region="eu-central-1"

#vpc
cidr_block="10.88.0.0/16"
public_subnet_cidr="10.88.1.0/24"
public_subnet_name= "wp"
vpc_name = "wp"
image_id="ami-031b673f443c2172c"

#key pair
key_name="wp"

#db server
db_instance_type="t2.micro"
db_instance_name="MYSQL"
db_root_pwd="rootpassword"
db_user="wordpress"
db_user_pwd="wordpress"
db_name="wordpress"

#web server
web_instance_type="t2.micro"
web_instance_name="WordPress"
