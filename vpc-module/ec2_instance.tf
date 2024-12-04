resource "aws_instance" "public_ec2" {
  ami                         = var.ami_image
  instance_type               = var.instance_type
  key_name                    = "alex-terraform-kp"
  availability_zone           = "us-west-1a"
  vpc_security_group_ids      = [aws_security_group.public_security_group.id]
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  user_data                   = <<-EOF
        #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo systemctl enable apache2
        echo "<html><body><h1>Hi there! This is Alex’s public VM</h1></body></html>" > /var/www/html/index.html
        EOF

  tags = {
    Name = "alex-web1_instance"
  }
}

resource "aws_instance" "private_ec2" {
  ami                    = var.ami_image
  instance_type          = var.instance_type
  key_name               = "alex-terraform-kp"
  availability_zone      = "us-west-1c"
  vpc_security_group_ids = [aws_security_group.private_security_group.id]
  subnet_id              = aws_subnet.private_subnet.id
  user_data              = <<-EOF
        #!/bin/bash
         #!/bin/bash
        sudo apt update -y
        sudo apt install apache2 -y
        sudo systemctl start apache2
        sudo systemctl enable apache2
        echo "<html><body><h1>Hi there from Alex's private VM</h1></body></html>" > /var/www/html/index.html
        EOF

  tags = {
    Name = "alex-web2_instance"
  }
}
