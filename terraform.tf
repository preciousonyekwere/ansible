terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.71.0"
    }
  }
}
provider "aws" {
 region = "us-east-1"
 default_tags {
     tags = {
     team = "team-a"
 }
}
}
# instance
resource "aws_instance" "ansible" {
  ami = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
tags = {
Name = "Ansible"
}
key_name = "why-key"
}
resource "aws_instance" "host" {
  ami = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"
  key_name = "why-key"
  count = 2
}
output "pub_ip" {
    value = aws_instance.ansible.public_ip
}
