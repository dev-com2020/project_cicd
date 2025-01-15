provider "aws" {
  region = var.region
}

resource "aws_instance" "app" {
  ami           = var.ami_id
  instance_type = "t2.micro"

  tags = {
    Name = "PythonAppInstance_2025"
  }
}

variable "region" {
  default = "us-east-1"
}

variable "ami_id" {
  default = "ami-0453ec754f44f9a4a" # AMI z Linux
}
