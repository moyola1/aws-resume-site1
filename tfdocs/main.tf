resource "aws_s3_bucket" "myresume" {
  bucket = var.bucket_name
}
resource "aws_s3_bucket_website_configuration" "myresume_config" {
  bucket = aws_s3_bucket.myresume.id

  index_document {
    suffix = "index.html"
  }
}
resource "aws_s3_bucket_policy" "myresume_policy" {
  bucket = aws_s3_bucket.myresume.id
  policy = jsoencode({
    version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "{aws_s3_bucket.myresume.arn}/*"
      }
    ]
  })
}
resource "aws_s3_bucket_public_access_block" "myresume_access" {
  bucket                  = aws_s3_bucket.myresume.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
