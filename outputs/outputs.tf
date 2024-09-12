# output "private_ip" {   #getting private ip of created ec2_instance
#     value = aws_instance.terraform.private_ip
#     sensitive = false
#     description = "getting output of private ip address of created ec2_instance"
# }

# output "public_ip" { #getting public ip of created ec2_instance
#     value = aws_instance.terraform.public_ip
#     sensitive = false
# }

# output "public_dns" {  #getting public_dns of created ec2_instance
#     sensitive = true  #It wont show in output as we gave sensitive as true
#     value = aws_instance.terraform.public_dns
# }

# output "private_dns" {
#     sensitive = false
#     value = aws_instance.terraform.private_dns
# }

# # output "owner_id" {
# #     sensitive = false
# #     value = aws_instance.terraform.owner_id
# # }


# output "subnet_id" {
#     sensitive = false
#     value = aws_instance.terraform.subnet_id
# }


# output "ami_id" {
#     sensitive = false
#     value = aws_instance.terraform.ami
# }


output "instances_info" {
    value = aws_instance.terraform
}