terraform {
  backend "s3" {
    bucket  = "important.vimalmenon.com"
    key     = "admin.justbigstore.com/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.18.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "2.2.0"
    }
  }
}
