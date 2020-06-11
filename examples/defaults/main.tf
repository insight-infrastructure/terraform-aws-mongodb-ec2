variable "aws_region" {
  default = "us-east-1"
}

provider "aws" {
  region = var.aws_region
}

variable "private_key_path" {}
variable "public_key_path" {}

module "default_vpc" {
  source = "github.com/insight-infrastructure/terraform-aws-default-vpc.git?ref=v0.1.0"
}

resource "aws_security_group" "this" {
  vpc_id = module.default_vpc.vpc_id

  dynamic "ingress" {
    for_each = [
      22,    # ssh
      27017, # The default port for mongod and mongos instances. You can change this port with port or --port.
      27018, # The default port for mongod when running with --shardsvr command-line option or the shardsvr value for the clusterRole setting in a configuration file.
      27019, # The default port for mongod when running with --configsvr command-line option or the configsvr value for the clusterRole setting in a configuration file.
      9100,  # node exporter
    ]

    content {
      from_port = ingress.value
      to_port   = ingress.value
      protocol  = "tcp"
      cidr_blocks = [
      "0.0.0.0/0"]
    }
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
    "0.0.0.0/0"]
  }
}


module "defaults" {
  source = "../.."

  private_key_path = var.private_key_path
  public_key_path  = var.public_key_path

  vpc_id                 = module.default_vpc.vpc_id
  subnet_ids             = module.default_vpc.subnet_ids
  vpc_security_group_ids = [aws_security_group.this.id]

  playbook_vars_file = "${path.cwd}/mongodb.yaml"
}

output "public_ip" {
  value = module.defaults.public_ip
}