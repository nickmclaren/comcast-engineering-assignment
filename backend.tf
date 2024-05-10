terraform {
  backend "s3" {
    bucket         = "terraform-state-file-bucket-nm"
    key            = "comcast-engineering-assignment/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-state-locking-table"
    encrypt        = true
  }
}