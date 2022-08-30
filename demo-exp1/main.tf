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
  ec2_ami = ["ami-092b43193629811af", "ami-0ee5c62243ab25259"]
}

resource "aws_instance" "web" {
  for_each      = toset(local.ec2_ami)
  ami           = each.key
  instance_type = var.instance_type
  #key_name               = "team2-test"
  vpc_security_group_ids = [aws_security_group.team2_ssh.id]

  tags = {
    Name = "team2-${each.key}-test"
  }
}

# output "public_ip" {
#   value = aws_instance.web[each.key].public_ip
# }

# output "private_ip" {
#   value = aws_instance.web[each.key].private_ip
# }
