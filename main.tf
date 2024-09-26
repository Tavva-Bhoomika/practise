provider "aws" {
  region = "ap-south-1"  # Change the region as needed
}

# Create a VPC
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/29"

  tags = {
    Name = "VPC"
  }
}

# Create a public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.0.0/30"
  availability_zone = "ap-south-1"  # Change as needed

  tags = {
    Name = "PublicSubnet"
  }
}

# Create a private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.0.4/30"
  availability_zone = "ap-south-1"  # Change as needed

  tags = {
    Name = "PrivateSubnet"
  }
}

# Create an Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "InternetGateway"
  }
}

