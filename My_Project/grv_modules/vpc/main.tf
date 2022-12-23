// Defining the provider
provider "aws" {

  region = var.region

}

//Defining the VPC resource
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

}

//Defining the subnet resource
resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
}


//Data block to find the AMI ID
//Remember data block is used to fetch
//data of an already existing resource, in this case ssm_parameter
data "aws_ssm_parameter" "my_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}