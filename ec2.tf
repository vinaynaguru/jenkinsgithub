resource "aws_instance" "web" {
  ami                    = "ami-080e1f13689e07408"  # Ubuntu 22.04 AMI (us-east-1)
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  user_data = file("userdata.sh")

  tags = {
    Name = "JenkinsWebServer01"
  }
}
