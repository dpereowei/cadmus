variable "region" {
    description = "The AWS region to create resources in"
    type        = string
    default     = "eu-north-1"
}
variable "vpc_name" {
    description = "The name of the VPC"
    type        = string 
}
variable "vpc_cidr" {
    description = "The CIDR block for the VPC"
    type        = string  
}
variable "public_subnets" {
    description = "A list of public subnet CIDR blocks"
    type        = list(string)
}
variable "azs" {
    description = "A list of availability zones"
    type        = list(string)
}