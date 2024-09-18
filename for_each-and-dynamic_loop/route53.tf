resource "aws_route53_record" "r53_info" {
    for_each = aws_instance.expense
    zone_id = "Z01771702MEQ3I9CTODSQ"
    records = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
    name = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
    type = "A"
    ttl = 1
    allow_overwrite = true

}