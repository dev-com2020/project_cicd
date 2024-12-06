provider "aws" {
  region = var.region
}

resource "aws_instance" "app" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  key_name = "python_app.pem"

  tags = {
    Name = "PythonAppInstance"
  }
  connection {
    type = "ssh"
    host = self.public_ip
    user = "ec2-user"
    private_key = file("python_app.pem")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y", # Dostosuj do systemu operacyjnego
      "sudo yum install -y docker", # Instalacja Dockera (dla Amazon Linux)
      "sudo service docker start", # Uruchomienie Dockera
      "docker run -d -p 80:80 python-app"
    ]
  }
}

variable "region" {
  default = "us-east-1"
}

variable "ami_id" {
  default = "ami-0453ec754f44f9a4a" # AMI z Linux
}
