resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project_name}/${var.envirnoment}/vpc_id"
  type  = "String"
  value = module.aws_vpc.vpc_info
}

