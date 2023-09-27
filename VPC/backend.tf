terraform {
  backend "s3" {
    bucket = "my-project-bucket-aws"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}