terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-09ac7e749b0a8d2a1"
#  ami           = "ami-0e2e9c570f999a4c8"
  instance_type = "t2.micro"

  tags = {
#    Name = "ExampleAppServerInstance"
     Name = var.instance_name
  }
}
