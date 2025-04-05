resource "aws_s3_bucket_replication_configuration" "replication" {
  bucket = aws_s3_bucket.source.id
  role = aws_iam_role.replication_role.arn
  rule {
    id = "replicate-all-objects"
    status = "Enabled"

    filter {
      prefix = ""
    }
    destination {
      bucket = aws_s3_bucket.destination.id
      storage_class = "STANDARD"
    }
  }
}