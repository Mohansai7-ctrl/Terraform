variable "instance_type" {
    type = map(string)
    default = {
        mysql = "t3.micro"
        backend = "t2.micro"
        frontend = "t2.micro"
    }
}

variable "domain_name" {
    type = string
    default = "mohansai.online"
}

variable "ingress_info" {
    
    default = [
        {
            from_port = 0  #All traffic
            to_port = 0
            protocol = "-1"
            cidr_blocks = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
        },

        {
            from_port = 22  #ssh
            to_port = 22
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
        },

        {
            from_port = 80  #http
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
        },

        {
            from_port = 8080  #nodejs
            to_port = 8080
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
        }
    
    ]

    
}