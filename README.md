Project Title
=====================
Terraform is used to provision and manage IT Infrastructure

Pre-Requisites
============================



Execution Flow
=====================

$git clone https://github.com/cssporg/infra_manager.git

$cd infra_manager

$terraform init .

$terraform validate -var-file=config.json

$terraform apply -var-file=config.json
