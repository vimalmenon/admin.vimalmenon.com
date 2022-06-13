terraform {
  backend "s3" {
    bucket  = "important.vimalmenon.com"
    key     = "admin.justbigstore.com/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    access_key = var.ACCESS_KEY
    secret_key = var.SECRET_KEY
  }
}
