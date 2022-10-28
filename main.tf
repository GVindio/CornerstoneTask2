#Create a Jenkins Server using Terraform
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }


}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "jenkins_server" {
  ami             = "ami-09d3b3274b6c5d4aa"
  instance_type   = "t2.micro"
  key_name        = "testpem"
  security_groups = ["launch-wizard-1"]
  user_data       = file("jenkins.sh")


  tags = {
    Name = "CornerStoneTask2"
  }
}
