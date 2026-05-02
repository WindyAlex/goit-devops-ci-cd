terraform {
  backend "s3" {
    bucket         = "devops-ci-cd-lesson5"
    key            = "lesson-7/terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
