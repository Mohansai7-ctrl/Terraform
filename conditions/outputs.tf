output "host_id" {
    value = aws_instance.terraform.host_id
}

output "id" {   #instance_id
    value = aws_instance.terraform.id 
}

output "instance_lifecycle" {
    value = aws_instance.terraform.instance_lifecycle
}