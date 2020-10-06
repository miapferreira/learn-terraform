resource "aws_s3_bucket" "estudos" {
  bucket = "estudos-terraform"
  acl    = "private"

  tags = {
    Name        = "ESTUDOS"
    Environment = "Dev"
  }
}