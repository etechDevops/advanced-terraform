resource "aws_security_group" "team2_ssh" {
  name        = "team2-ssh"
  description = "Allow ssh connection to instance"

  ingress {
    description = "allow ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    #cidr_blocks = [aws_vpc.main.cidr_block]
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}