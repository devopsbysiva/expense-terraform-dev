module "aws_vpc" {
    source = "../../terraform_aws_vpc"
    project = var.project_name
    envirnoment = var.envirnoment
    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidr =  var.private_subnet_cidr
    database_subnet_cidr = var.database_subnet_cidr
    # is_peering_requried = true 
 
}