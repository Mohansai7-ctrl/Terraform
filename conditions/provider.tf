terraform {
    required_providers {
        aws = {                #values of source and version should be provided in quoted
            source = "hashicorp/aws"
            version = "5.66.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}


