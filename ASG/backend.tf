data "terraform_remote_state" "main" {
  backend = "s3"
  config = {
    bucket = "my-project-bucket-aws"
    key    = "path/to/my/key"
    region = "us-east-1"
    #dynamodb_table = "terraform-prod-lock"
  }
}