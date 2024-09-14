locals {
    instance_type = var.environment == "prod" ? "t3.medium" : "t3.micro"
    domain_name = "mohansai.online"
    zone_id = "Z01771702MEQ3I9CTODSQ"
}