terraform {
  backend "s3" {
    bucket         = "etechteam5-state"
    key            = "demo-exp/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "team5-state-lock"
  }
}