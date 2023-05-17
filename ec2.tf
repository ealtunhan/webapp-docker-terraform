terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.58"
    }
  }
}

resource "aws_iam_role" "aws_access" {
  name = "awsrole-${var.user}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess", "arn:aws:iam::aws:policy/AmazonEC2FullAccess", "arn:aws:iam::aws:policy/IAMFullAccess", "arn:aws:iam::aws:policy/AmazonS3FullAccess"]

}

resource "aws_iam_instance_profile" "ec2-profile" {
  name = "web-project-profile-${var.user}"
  role = aws_iam_role.aws_access.name
}

resource "aws_instance" "web" {
  ami           = var.myami
  instance_type = var.instance_type
  key_name      = var.mykey
  vpc_security_group_ids = [aws_security_group.tf-web-sec-gr.id]
  iam_instance_profile = aws_iam_instance_profile.ec2-profile.name
  
user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install docker -y
              sudo service docker start

              sudo groupadd -f docker
              sudo usermod -aG docker $USER
              newgrp docker
              groups
              
              # Docker Compose yükleme
              sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
              sudo chmod +x /usr/local/bin/docker-compose

              # Uygulama dosyalarını EC2 instance'a kopyala
              sudo mkdir -p /var/www/html
              sudo chmod 777 /var/www/html
              sudo yum install -y git
              sudo git clone https://github.com/ealtunhan/webapp-docker-terraform.git /var/www/html

              # Docker Compose ile uygulamayı çalıştırma
              cd /var/www/html
              sudo docker-compose up -d
              EOF

  tags = {
    Name = var.tag
  }
}

resource "aws_security_group" "tf-web-sec-gr" {
  name = "${var.web-sg}-${var.user}"
  tags = {
    Name = var.web-sg
  }

ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8000
    protocol    = "tcp"
    to_port     = 8000
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = -1
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "web-server" {
  value = "http://${aws_instance.web.public_dns}:8000"
}