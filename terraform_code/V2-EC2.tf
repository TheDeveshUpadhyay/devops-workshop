provider "aws" {
 region = "ap-southeast-1"
}

resource "aws_instance" "demo-server" {
    ami = "ami-0d07675d294f17973"
    instance_type = "t2.micro"
    key_name = "valaxykey"
    security_groups = [ "demo-sg" ]
} 


resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "SSH Access"

  ingress {
    description = "Ssh access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere (for demo purposes; restrict in production)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic
  }

  tags = {
    Name = "ssh-port"
  }
}


