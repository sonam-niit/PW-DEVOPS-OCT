provider "aws" {
  region = var.region
}
resource "aws_s3_bucket" "static_site" {
  bucket = var.bucket_name
  force_destroy = true #to delete non-empty bucket
}
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.static_site.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.static_site.id
  block_public_acls = true
  block_public_policy = false
  ignore_public_acls = true
  restrict_public_buckets = false
}
resource "aws_s3_bucket_website_configuration" "site_config" {
  bucket = aws_s3_bucket.static_site.bucket
  index_document {
    suffix = "index.html"
  }
}
resource "aws_s3_bucket_policy" "policy" {
  bucket = aws_s3_bucket.static_site.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
        {
            Sid = "AllowReadonly Access",
            Action = [ "s3:Getobject"],
            Effect = "Allow",
            Principal = "*",
            Resource = "${aws_s3_bucket.static_site.arn}/*"
        }
    ]
  })
  depends_on = [ aws_s3_bucket_public_access_block.block ]
}
resource "aws_s3_object" "static_files" {
  for_each = fileset("${path.module}/MyProject","*")
  bucket =  aws_s3_bucket.static_site.bucket
  key = each.value
  source = "${path.module}/Myproject/${each.value}"
  content_type = lookup({
    html = "text/html"
    css = "text/css"
    js = "application/javascript"
  }, split(".",each.value)[1],"text/plain")
}