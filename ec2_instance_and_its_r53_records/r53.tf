resource "aws_route53_record" "expense" {
    count = length(var.instance_names)
    zone_id = "Z01771702MEQ3I9CTODSQ"
    records = [aws_instance.terraform[count.index].private_ip]   #as using interpolation .  we need to give as []
    name = "${var.instance_names[count.index]}.${var.domain_name}"
    type = "A"
    ttl = 1
    allow_overwrite = true
}

resource "aws_route53_record" "public_ip" {
    #count = length(var.instance_names)
    zone_id = "Z01771702MEQ3I9CTODSQ"
    records = [aws_instance.terraform[2].public_ip]   #as using interpolation .  we need to give as []
    name = var.domain_name
    type = "A"
    ttl = 1
    allow_overwrite = true
}

# another way of getting both private ip of all instances and public ip of frontend instance
# records = aws_instance.terraform[count.index] == "frontend" ? aws.instance.terraform.public_ip : aws_instance.terraform[count.index].private_ip