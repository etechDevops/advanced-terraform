terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
}

locals {
  ec2_sys = [
    {
        ami = "ami-092b43193629811af"
        instance_type = "t2.micro"
    },
    {
        ami = "ami-0ee5c62243ab25259"
        instance_type = "t2.medium"
    }
  ]
}

resource "aws_instance" "web" {
  for_each               = {
    for index, i in local.ec2_sys:
    i.ami => i
  }
  ami                    = each.key
  instance_type          = each.value.instance_type
  #key_name               = "team2-test"
  vpc_security_group_ids = [aws_security_group.team2_ssh.id]

  tags = {
    Name = "team2-${each.key}-test"
  }
}
