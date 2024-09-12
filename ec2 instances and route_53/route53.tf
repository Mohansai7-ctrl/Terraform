#getting private ip of all 3 created ec2 instances or servers
resource "aws_route53_record" "private_ip" {
    count = length(var.instance_names)
    zone_id = "Z01771702MEQ3I9CTODSQ"
    #domain_id = "mohansai.online"
    records = [aws_instance.server[count.index].private_ip]
    name = "${var.instance_names[count.index]}.${var.domain_id}"
    type = "A"
    ttl = 1
    allow_overwrite = true

}


#getting public ip of frontend server for https request
resource "aws_route53_record" "public_ip" {
    type = "A"
    ttl = 1
    zone_id = "Z01771702MEQ3I9CTODSQ"
    #domain_id = "mohansai.online"
    name = var.domain_id
    records = [aws_instance.server[2].public_ip]
    allow_overwrite = true

}