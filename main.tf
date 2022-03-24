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
