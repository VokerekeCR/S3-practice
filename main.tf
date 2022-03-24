resource "aws_s3_bucket" "talent-academy-account_id-tfstates-victor" {
    bucket = "victor-talent-academy-686520628199-tfstates"

    lifecycle {
      prevent_destroy = true
    }

    tags = {
        Name = "talent-academy-686520628199-tfstates"
        Environment = "Test"
    }
}

resource "aws_s3_bucket_versioning" "version_my_bucket" {
  bucket = aws_s3_bucket.talent-academy-account_id-tfstates-victor.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_lock_tbl" {
  name           = "terraform-lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags           = {
    Name = "terraform-lock"
  }
}

terraform {
  backend "s3" {
    bucket = "talent-academy-account_id-tfstates-pascal"
    key    = "sprint1/week2/training-terraform/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}