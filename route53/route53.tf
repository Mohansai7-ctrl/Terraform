resource "aws_route53_record" "expense" {
    zone_id = var.zone_id
    count = length(var.instance_names)
    records = [aws_instance.expense[count.index].private_ip]
    name = "${var.instance_names[count.index]}.${var.domain_name}"
    allow_overwrite = true
    type = "A"
    ttl = 1
}

resource "aws_route53_record" "public_ip" {
    zone_id = var.zone_id
    type = "A"
    ttl = 1
    count = length(var.instance_names)
    records = [aws_instance.expense[2].public_ip]
    name = var.domain_name
    allow_overwrite = true
}