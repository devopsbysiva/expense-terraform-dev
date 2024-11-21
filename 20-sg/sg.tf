module "mysql_sg" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = local.vpc_id
    sg_name = "mysql"   
}

module "backend_sg" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = local.vpc_id
    sg_name = "backend"   
}

module "frontend_sg" {
    source = "../../terraform-aws-security-group"
    project_name = var.project_name
    environment = var.environment
    vpc_id = local.vpc_id
    sg_name = "frontend"   
}

#  to allow connection between mysql to backend.
#  the port 3306 to be enabled . port 8080 for backend. and port 80 for frontend. 
#  to accept connections.
#  these are to added in inbound rules.

resource "aws_security_group_rule" "mysql_backend" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id = module.backend_sg.id
  security_group_id = module.mysql_sg.id
#   source_security_group_id = [data.aws_ssm_parameter.backend_sg_id.value]
#   security_group_id = data.aws_ssm_parameter.mysql_sg_id.value
}

resource "aws_security_group_rule" "backend_frontend" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = module.frontend_sg.id
  security_group_id = module.backend_sg.id


resource "aws_security_group_rule" "frontend_public" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = module.frontend_sg.id

