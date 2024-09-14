resource "aws_route53_record" "expense" {
    count = length(var.instance_names)
    records =
    name = 
    type = "A"
    ttl = 1
    allow_overwrite = true
}