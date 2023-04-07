


######################################################################################
                        # CREATING JENKINS SECURITY GROUP
######################################################################################



resource "aws_security_group" "jenkins_sg" {
  name        = "${var.component_name}-jenkins-sg"
  description = "Allow access jenkins ingress access"
  vpc_id      = local.vpc_id

  tags = {
    Name = "${var.component_name}-jenkins-sg"
  }
}


resource "aws_vpc_security_group_ingress_rule" "access_on_http" {
  security_group_id = aws_security_group.jenkins_sg.id
  from_port   = 8080
  ip_protocol = "tcp"
  to_port     = 8080
  cidr_ipv4  = "0.0.0.0/0"
}


resource "aws_vpc_security_group_egress_rule" "egress_access_from_everywhere" {
  security_group_id = aws_security_group.jenkins_sg.id
  from_port   = 0
  ip_protocol = "-1"
  to_port     = 0
  cidr_ipv4  = "0.0.0.0/0"
}




######################################################################################
                        # CREATING SONARQUBE SECURITY GROUP
######################################################################################

resource "aws_security_group" "sonarqube_sg" {
  name        = "${var.component_name}-sonarqube-sg"
  description = "Allow access sonarqube ingress access"
  vpc_id      = local.vpc_id

  tags = {
    Name = "${var.component_name}-sonarqube-sg"
  }
}


resource "aws_vpc_security_group_ingress_rule" "ingress_sonarqube_access_on_http" {
  security_group_id = aws_security_group.sonarqube_sg.id
  from_port   = 9000
  ip_protocol = "tcp"
  to_port     = 9000
  cidr_ipv4  = "0.0.0.0/0"
}


resource "aws_vpc_security_group_egress_rule" "egress_access_sonarqube_from_everywhere" {
  security_group_id = aws_security_group.sonarqube_sg.id
  from_port   = 0
  ip_protocol = "-1"
  to_port     = 0
  cidr_ipv4   = "0.0.0.0/0"
}
