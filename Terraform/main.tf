provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "insecure_sg" {
  name        = "devsecops-insecure-sg"
  description = "Intentionally insecure security group for Trivy scan"

  ingress {
    description = "SSH open to the world (intentional vulnerability)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # ❌ SECURITY ISSUE
  }

  ingress {
    description = "Application port"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app_server" {
  ami           = "ami-0f5ee92e2d63afc18" # Amazon Linux 2 (Mumbai)
  instance_type = "t2.micro"
  security_groups = [aws_security_group.insecure_sg.name]

  tags = {
    Name = "DevSecOps-Insecure-EC2"
  }
}
