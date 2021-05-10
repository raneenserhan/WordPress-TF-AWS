# Create a VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  
  tags = {
    Name = "${var.vpc_name}-vpc"
  }
}

# Create a public vpc subnet
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.public_vpc_name}-pub-subnet"
  }
  
}

# Create a internet_gateway
resource "aws_internet_gateway" "public_internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
  Name = "${var.public_vpc_name}-igw"
  
  }
}


# Create a route table
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public_internet_gateway.id
  }

  tags = {
    Name = "${var.public_vpc_name}-rt"
   
  }
}

# Create a table association
resource "aws_route_table_association" "a" {
  subnet_id = aws_subnet.public.id
  route_table_id = aws_route_table.public-rt.id
}