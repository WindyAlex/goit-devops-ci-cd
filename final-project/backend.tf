terraform {
  backend "s3" {
    bucket         = "final-project-537845"
    key            = "final-project/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
