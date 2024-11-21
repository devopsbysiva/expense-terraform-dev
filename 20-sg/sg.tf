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
  source_security_group_id = [<backend_sg_id>]
  security_group_id = "<mysql_sg_id>"
}


