resource "aws_s3_bucket" "pickachu" {
  bucket = "my-pickachu-bucket"
  tags = {
    Name = "My pickachu Bucket"
  }
}

resource "aws_s3_bucket_acl" "pickachu" {
  bucket = aws_s3_bucket.pickachu.id
  acl    = "private"
}

resource "aws_s3_bucket_ownership_controls" "pickachu" {
  bucket = aws_s3_bucket.pickachu.id

  rule {
    object_ownership = "ObjectWriter"  # Allows objects to be owned by other AWS accounts
  }
}


resource "aws_cloudfront_distribution" "pickachu" {
  origin {
    domain_name = aws_s3_bucket.pickachu.bucket_regional_domain_name
    origin_id   = "S3-my-pickachu-bucket"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.pickachu.cloudfront_access_identity_path
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "My CloudFront Distribution"
  default_root_object = "index.html"

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-my-pickachu-bucket"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_100"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = {
    Name = "My CloudFront Distribution"
  }
}

resource "aws_cloudfront_origin_access_identity" "pickachu" {
  comment = "pickachu Origin Access Identity"
}

