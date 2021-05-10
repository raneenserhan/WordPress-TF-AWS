# WORDPRESS-AWS-TERRAFORM <br/>

## About <br/><br/>
This is to deploy WordPress Application using AWS infrastructure, using terraform to provision infrastructure.<br/>
##### uses and creates following aws services:<br/>
* VPC and it's components
* Subnets, Route Tables, Internet Gateway.
* EC2 instances(web+db)
* Security Groups to access both EC2 instances

------------------------------------------------------------------------------------------------<br/>
## Pre-requisite:<br/><br/>
create an IAM user and create security credentials(AccessKey, SecretKey) and update in the "aws" provider in the main.tf file 

![image](https://user-images.githubusercontent.com/82150368/117599520-a34b7c80-b152-11eb-9c43-325851fcac66.png)


<br/>
jhjh
