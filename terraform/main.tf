terraform {
  backend "s3" {
    bucket  = "important.vimalmenon.com"
    key     = "admin.justbigstore.com/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

#Action

# Create S3 bucket
# Make S3 public
