resource "aws_s3_bucket" "source" {
  bucket = "sonam-source-123"
}
resource "aws_s3_bucket_versioning" "source_versioning" {
  bucket = aws_s3_bucket.source.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket" "destination" {
  bucket = "sonam-destination-123"
}
resource "aws_s3_bucket_versioning" "destination_versioning" {
  bucket = aws_s3_bucket.destination.id
  versioning_configuration {
    status = "Enabled"
  }
}