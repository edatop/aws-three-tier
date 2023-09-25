terraform {
  backend "s3" {
    bucket = "three-tier-project-eda"
    key    = "path/to/my/key"
    region = "us-east-1"
  }
}
