#asking aws for a ubuntu's ami 
data "aws_ami" "ubuntu" {

  most_recent = true

  filter {
    name   = "name"
    #we can find it at AMI name atrribute at ec2 inctance's atrributes
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical company's id
}
