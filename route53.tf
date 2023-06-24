resource "aws_route53_zone" "primary" {
  name = "stellarbit.io"
}

resource "aws_route53_record" "write1" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "write1.stellarbit.io"
  type    = "CNAME"
  ttl     = "300"
  records = ["dbname.cluster-cnzwhajdndj0.ap-south-1.rds.amazonaws.com"]
}

resource "aws_route53_record" "read1" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "read1.stellarbit.io"
  type    = "CNAME"
  ttl     = "300"
  records = [
    aws_rds_cluster.default.reader_endpoint
  ]
}

resource "aws_route53_record" "read_instance1" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "read_instance1.stellarbit.io"
  type    = "CNAME"
  ttl     = "300"
  records = ["dbname.cluster-ro-cnzwhajdndj0.ap-south-1.rds.amazonaws.com"]
}

resource "aws_route53_record" "read_instance2" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "read_instance2.stellarbit.io"
  type    = "CNAME"
  ttl     = "300"
  records = ["dbname.cluster-ro-cnzwhajdndj0.ap-south-1.rds.amazonaws.com"]
}

resource "aws_route53_record" "read_instance3" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "read_instance3.stellarbit.io"
  type    = "CNAME"
  ttl     = "300"
  records = [
    "dbname.cluster-ro-cnzwhajdndj0.ap-south-1.rds.amazonaws.com"
  ]
}