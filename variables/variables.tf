variable "sg_name" {
    default = "allow-ssh"
    type = string
    description = "security gropup name"
}

variable "sg_description" {
    type = string
    default = "This is to create secruity_group name"
}

variable "from_port" {
    default = "22"
    type = number
}

variable "to_port" {
    type = number
    default = 22

}

variable "protocol" {
    type = string
    default = "tcp"
}

variable "cidr_blocks" {
    type = list(string)
    default = ["0.0.0.0/0"]
}


#now related to ec2_instance


variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
}

variable "tags" {
    type = map
    default = {
        Name = "server"
        Project = "expense"
        Component = "backend"
        Environment = "DEV"
        Terraform = true

    }
}

#preference of variables are:
# 1)command line arguments  terraform apply -var "instance_type=t3.small"
# 2)terraform.tfvars
# 3)Environment variables (export TF_VAR_VAR_NAME and unset)   
# to set  --> export TF_VAR_instance_type="t3.micro"
# to unset --> unset TF_VAR_instance_type

# 4)Default , in this case variables.tfvars
# 5)If above 4 are not there, then finally terraform will ask by prompt, just give value of the variable


variable "instance_type" {
    type = string
    #default = "t3.micro"
}


variable "common_tags" {
    type = map
    sensitive = false
    default = {
        Project = "expense"
        Environment = "dev"
        Terraform = true
    }
}