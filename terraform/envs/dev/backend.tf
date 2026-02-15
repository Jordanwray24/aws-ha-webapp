terraform {
  backend "s3" {
    bucket         = "jordan-aws-tfstate-20260215-001"
    key            = "aws-ha-webapp/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-locks"
    encrypt        = true
  }
}