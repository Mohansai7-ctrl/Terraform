variable "sg_name" {
    type = string
    sensitive = false
    default = "allow-ssh"
}

variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "from_port" {
    type = number
    default = 22

}

variable "to_port" {
    type = number
    default = 22
}

variable "cidr_blocks" {
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "zone_id" {
    default = "Z01771702MEQ3I9CTODSQ"
}

variable "domain_name" {
    type = string
    default = "mohansai.online"
}

variable "instance_names" {
    type = list(string)
    default = ["mysql","backend","frontend"]
}