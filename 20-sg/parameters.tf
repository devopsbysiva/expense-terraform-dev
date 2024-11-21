resource "aws_ssm_parameter" "mysql_sg_id" {
  name  = "/${var.project_name}/${var.envirnoment}/mysql_sg_id"
  type  = "String"
  value = module.mysql_sg.id
}

resource "aws_ssm_parameter" "backend_sg_id" {
  name  = "/${var.project_name}/${var.envirnoment}/backend_sg_id"
  type  = "String"
  value = module.backend_sg.id
}

resource "aws_ssm_parameter" "frontend_sg_id" {
  name  = "/${var.project_name}/${var.envirnoment}/frontend_sg_id"
  type  = "String"
  value = module.frontend_sg.id
}


