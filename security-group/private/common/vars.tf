variable "project_name" { default = "Demo" }
variable "project_env" { default = "Production" }
variable "project_env_short" { default = "prd" }

variable "aws_region" { default = "us-west-2" }
variable "aws_profile" { default = "default" }

variable "name" { default = "security-group" }
variable "description" { default = "This is a common security group" }
variable "vpc_name" { default = "default" }

variable "source_sg_id" { default = "" }
variable "source_sg_tags" { default = { Type = "Bastion" } }


variable "ingress_with_cidr_blocks" { default = [] }
variable "ingress_with_ipv6_cidr_blocks" { default = [] }
variable "ingress_with_self" { 
default = [
  {
    from_port   = "-1"
    to_port     = "-1"
    protocol    = "-1"
    description = "Itself"
  }
  ]
}

variable "egress_cidr_blocks" { default = ["0.0.0.0/0"] }
variable "egress_ipv6_cidr_blocks" { default = ["::/0"] }
variable "egress_rules" { default = ["all-all"] }
variable "egress_with_cidr_blocks" { default = [] }
variable "egress_with_ipv6_cidr_blocks" { default = [] }

variable "rules" {
  description = "Map of known security group rules (define as 'name' = ['from port', 'to port', 'protocol', 'description'])"
  type        = "map"
  default = {
    common-port-01 = [22, 22, "tcp", "Bastion SSH"]
    common-port-02 = [9273, 9273, "tcp", "Bastion Prometheus"]
    all-all        = [-1, -1, "-1", "All protocols"]
    _              = ["", "", ""]
  }
}

variable "common_rule1_desc" { default = "Bastion SSH" }
variable "common_rule2_desc" { default = "Bastion Prometheus" }

variable "tags" {
  default = {}
}
