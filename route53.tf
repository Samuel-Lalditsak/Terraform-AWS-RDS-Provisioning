resource "aws_route53_zone" "primary" {
  name = "stellarbit.io"      # Name of the Route53 DNS zone
}

resource "aws_route53_record" "write1" {
  zone_id = aws_route53_zone.primary.zone_id      # ID of the Route53 DNS zone
  name    = "write1.stellarbit.io"                # Name of the record
  type    = "CNAME"                               # Type of the record
  ttl     = "300"                                 # TTL (Time to Live) for the record
  records = ["dbname.cluster-cnzwhajdndj0.ap-south-1.rds.amazonaws.com"]      # Value of the record (CNAME target)
}

resource "aws_route53_record" "read1" {
  zone_id = aws_route53_zone.primary.zone_id      # ID of the Route53 DNS zone
  name    = "read1.stellarbit.io"                 # Name of the record
  type    = "CNAME"                               # Type of the record
  ttl     = "300"                                 # TTL (Time to Live) for the record
  records = [
    aws_rds_cluster.default.reader_endpoint       # Value of the record (CNAME target referencing the reader endpoint of the RDS cluster)
  ]
}

resource "aws_route53_record" "read_instance1" {
  zone_id = aws_route53_zone.primary.zone_id      # ID of the Route53 DNS zone
  name    = "read_instance1.stellarbit.io"        # Name of the record
  type    = "CNAME"                               # Type of the record
  ttl     = "300"                                 # TTL (Time to Live) for the record
  records = ["dbname.cluster-ro-cnzwhajdndj0.ap-south-1.rds.amazonaws.com"]    # Value of the record (CNAME target)
}

resource "aws_route53_record" "read_instance2" {
  zone_id = aws_route53_zone.primary.zone_id      # ID of the Route53 DNS zone
  name    = "read_instance2.stellarbit.io"        # Name of the record
  type    = "CNAME"                               # Type of the record
  ttl     = "300"                                 # TTL (Time to Live) for the record
  records = ["dbname.cluster-ro-cnzwhajdndj0.ap-south-1.rds.amazonaws.com"]     # Value of the record (CNAME target)
}

resource "aws_route53_record" "read_instance3" {
  zone_id = aws_route53_zone.primary.zone_id      # ID of the Route53 DNS zone
  name    = "read_instance3.stellarbit.io"        # Name of the record
  type    = "CNAME"                               # Type of the record
  ttl     = "300"                                 # TTL (Time to Live) for the record
  records = [
    "dbname.cluster-ro-cnzwhajdndj0.ap-south-1.rds.amazonaws.com"    # Value of the record (CNAME target)
  ]
}
