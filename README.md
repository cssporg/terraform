Project Title
=====================
Terraform is used to provision and manage IT Infrastructure

Pre-Requisites
============================
$git clone https://github.com/containerrepos/custom-ami.git

$cd custom-ami/packer/

$/usr/bin/packer build builders.json

Execution Flow
=====================

# source cluster

$git clone https://github.com/cssporg/infra_manager.git

$cd infra_manager

$vi config.json

myamiid : ""

$terraform init .

$terraform validate -var-file=config.json

$terraform apply -var-file=config.json






# Destination cluster

$git clone https://github.com/cssporg/infra_manager.git

$cd infra_manager

$vi config.json

myamiid : ""


$ vi modules/computing/ec2/instances.tf

variable "wrpilwsn" {

type = "list"

default = [

"10.0.20.52,0",

"10.0.20.86,1"

]

}


#subnet_id = "${var.enable_user_defined_ips ? element(var.appsubnet, element(split(":", element(var.appserver_pa_ips, count.index)),1)) : element(var.appsubnet, count.index)}"

#private_ip = "${var.enable_user_defined_ips ? element(split(":", element(var.appserver_pa_ips, count.index),0)) : ""}"

subnet_id = "${element(var.appsubnet, element(split(",", element(var.wrpilwsn, count.index)), 1))}"

private_ip = "${element(split(",", element(var.wrpilwsn, count.index)), 0)}"


$terraform init .

$terraform validate -var-file=config.json

$terraform apply -var-file=config.json

