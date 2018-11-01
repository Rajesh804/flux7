terraform {
  backend "s3" {
    bucket                  = "terraform-rreddy"
    region                  = "us-east-1"
    key                     = "terraform.tfstate"
    encrypt 		    = true
  }
}

