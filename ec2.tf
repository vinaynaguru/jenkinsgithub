resource "aws_instance" "web" {
  ami                    = "ami-0c55b159cbfafe1f0"  # Ubuntu 22.04 AMI
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = file("userdata.sh")

  tags = {
    Name = "Jenkins-WebServer"
  }
}
