provider "aws" {
  region = "us-east-1"  # Change as needed
}

# Create the S3 bucket
resource "aws_s3_bucket" "static_site" {
  bucket = "my-static-website-bucket-unique-name"  # Change to a unique name
}

# Configure the S3 bucket as a static website
resource "aws_s3_bucket_website_configuration" "static_site" {
  bucket = aws_s3_bucket.static_site.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

# Add a bucket policy to allow public read access
resource "aws_s3_bucket_policy" "static_site_policy" {
  bucket = aws_s3_bucket.static_site.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "${aws_s3_bucket.static_site.arn}/*"
    }
  ]
}
POLICY
}