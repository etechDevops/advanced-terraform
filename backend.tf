terraform {
  backend "s3" {
    bucket         = "team4-state"
    key            = "demo-exp1/terraform.tfstate"
    dynamodb_table = "team4-state-lock"
    region         = "us-west-2"
  }
}