variable "myamiid"{
type = "string"
}
 
variable "vpc_cidr" {
  default = "192.168.0.0/16"
}

variable "vpc_cidr_lbsubnet" {
  default = "192.168.10.0/24"
}

variable "vpc_cidr_appsubnet" {
  default = "192.168.20.0/24"
}

variable "azs" {
  type = "map"
  default = {
    us-east-1 = "us-east-1a,us-east-1b,us-east-1c,us-east-1d"
}
}

variable "rds_azs" {
  type = "map"
  default = {
    us-east-1 = "us-east-1e,us-east-1f"
}
}

variable "rds_mysql_db" {
type = "map"
}
