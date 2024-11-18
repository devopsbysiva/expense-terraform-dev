module "aws_sg" {
    source = "../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    sg_name = var.sg_name   
}