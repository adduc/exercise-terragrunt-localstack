resource "aws_s3_bucket" "test-bucket" {
  bucket = "my-bucket"
}

# enable bucket encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "test-bucket" {
  bucket = aws_s3_bucket.test-bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
    }
  }
}

resource "aws_s3_object" "test-object" {
  bucket  = aws_s3_bucket.test-bucket.bucket
  key     = "test-object"
  content = <<-EOF
    Hello, World
  EOF
}