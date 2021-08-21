provider "aws" {
  region = "ap-northeast-1"

  s3_force_path_style         = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    iam      = "http://localstack:4566"
    kinesis  = "http://localstack:4566"
    lambda   = "http://localstack:4566"
    s3       = "http://localstack:4566"
  }
}

resource "aws_s3_bucket" "local_archive" {
  bucket = "local-archive"
  versioning {
    enabled = true
  }
}
