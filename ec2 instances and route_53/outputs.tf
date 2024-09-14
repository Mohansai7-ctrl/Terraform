# output "instances_info" {
#     value = aws_instance.server #should not give in quoted
#     sensitive = false
# }

output "instances_info" {
    value = aws_instance.expense
}

