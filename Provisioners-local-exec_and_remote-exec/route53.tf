resource "aws_route53_record" "r53_info" {
    zone_id = "Z01771702MEQ3I9CTODSQ"
    for_each = var.instance_type
    records = each.key == "frontend" ? [aws_instance.expense[each.key].public_ip] : [aws_instance.expense[each.key].private_ip]
    name = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
    type = "A"
    ttl = 1
    allow_overwrite = true
}