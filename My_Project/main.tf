provider "aws" {

  region = var.my_region

}


//Reference the VPC module in your code
module "vpc" {
  source = "./grv_modules/vpc"
  region = var.my_region
}


//creating my only EC2 resource and
//referencing params from vpc module
resource "aws_instance" "my-instance" {
  ami           = module.vpc.ami_id
  subnet_id     = module.vpc.subnet_id
  instance_type = "t2.micro"
}