data "aws_ami" "environment" {
    most_recent = true
    owners = ["973714476881"]

    filter {
        name = "name"
        values = ["RHEL-9-DevOps-Practice"]   #always give in [" "]
    }

    filter {
        name = "root-device-type"
        values = ["ebs"]

    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
}