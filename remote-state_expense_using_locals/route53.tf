resource "aws_route53_record" "private_and_public_ips" {
    count = length(var.instance_names)
    zone_id = local.zone_id
    records = var.instance_names[count.index] == "frontend" ? [aws_instance.terraform[count.index].public_ip] : [aws_instance.terraform[count.index].private_ip]
    name = var.instance_names[count.index] == "frontend" ? local.domain_name : "${var.instance_names[count.index]}.${local.domain_name}"  #here we used ${} becuase to concatenate or ineterpolate the two variables.
    type = "A"
    ttl = 1
    allow_overwrite = true
    
}


