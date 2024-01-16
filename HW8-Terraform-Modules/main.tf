terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
  
  backend "s3" {
    bucket = "hillel-practice-terraform-state"
    key    = "hillel/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Project     = "Hillel"
      Chapter     = "HW8"
      Environment = "Test"
    }
  }
}

module "ec2" {
  source                = "./ec2"
  public-instance-ami   = "ami-0c7217cdde317cfec"
  private-instance-ami  = "ami-0c7217cdde317cfec"
  public-instance-type  = "t2.micro"
  private-instance-type = "t2.micro"
  public-subnet-id      = module.networking.public-subnet-id
  private-subnet-id     = module.networking.private-subnet-id
}

module "networking" {
  source              = "./networking"
  vpc-cidr            = "10.0.0.0/16"
  private-subnet-cidr = "10.0.101.0/24"
  public-subnet-cidr = "10.0.1.0/24"
}