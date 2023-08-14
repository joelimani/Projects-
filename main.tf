/*terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.66.0"
    }
  }

  required_version = ">= 1.2.0"
}*/

provider "aws" {
  region  = "us-east-1"
  access_key = "AKIA6PYGQCZYQT7HBYUR"
  secret_key = "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"
}
resource "aws_instance" "app_server" {
  ami           = "ami-0ee3dd41c47751fe6"
  instance_type = "t2.micro"

  tags = {
    Name = "TestServerInstance"
  }
}
