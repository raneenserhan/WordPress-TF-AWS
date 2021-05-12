# WORDPRESS-AWS-TERRAFORM <br/>

## About <br/><br/>
This is to Run nginx using AWS infrastructure, using ansible to provision infrastructure.<br/>
##### uses and creates following aws services:<br/>
* VPC and it's components
* Subnet, Route Table, Internet Gateway.
* EC2 instance(ubuntu)
* Kaypair
* Security Groups to access EC2 instance

------------------------------------------------------------------------------------------------<br/>
## Pre-requisite:<br/><br/>
* create an IAM user and create security credentials(AccessKey, SecretKey) and update in the in the vars.yml file 

  ![image](https://user-images.githubusercontent.com/82150368/118038314-a2476480-b377-11eb-8709-099f2f59909d.png)

* install pythonby by entering the following:
  sudo apt update
  sudo apt install python3.8  
  * Allow the process to complete and verify the Python version was installed sucessfully:
  python3 ––version
* install ansible
  apt install -y ansible
* install Community AWS Collection
  ansible-galaxy collection install community.aws
  
------------------------------------------------------------------------------------------------<br/>

## Usage:<br/>
### provisioning :<br/>
* git clone https://github.com/raneenserhan/WordPress-TF-AWS.git
* in the cmd enter: ansible-playbook -e @vars.yml main.yml
* open browser with url = http://{instance.public.ip}
  * example
 

------------------------------------------------------------------------------------------------<br/>
### Versions:
python 3.8.5
ansible 2.10.9

