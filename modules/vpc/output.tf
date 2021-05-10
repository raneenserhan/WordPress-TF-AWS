#vpc cidr block
output "vpc_cidr_block" {
  description = "vpc cidr block"
  value = aws_vpc.vpc.cidr_block
}

#public vpc subnet cidr block
output "public_subnet_cidr" {
  description = "public vpc cidr block"
  value = aws_subnet.public.cidr_block
}

# vpc id
output "vpc_id" {
  value = aws_vpc.vpc.id
}

#public vpc subnet id
output "public_subnet_id" {
  value =aws_subnet.public.id
}
