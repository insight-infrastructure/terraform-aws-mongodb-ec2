
variable "id" {
  description = "The id to give to rds db, falls back to name"
  type        = string
  default     = ""
}

variable "name" {
  description = "A unique name to give all the resources"
  type        = string
  default     = "superset"
}

variable "tags" {
  description = "Tags to attach to all resources"
  type        = map(string)
  default     = {}
}

variable "create_efs" {
  description = "Boolean to create EFS file system"
  type        = bool
  default     = true
}


######
# Data
######
variable "vpc_id" {
  description = "The vpc to deploy into"
  type        = string
}

variable "subnet_ids" {
  description = "The id of the subnet"
  type        = list(string)
}

variable "vpc_security_group_ids" {
  description = "List of security groups"
  type        = list(string)
}

#####
# ec2
#####
variable "key_name" {
  description = "The key pair to import"
  type        = string
  default     = ""
}

variable "root_volume_size" {
  description = "Root volume size"
  type        = string
  default     = 8
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.medium"
}

variable "public_key_path" {
  description = "The path to the public ssh key"
  type        = string
}

variable "private_key_path" {
  description = "The path to the private ssh key"
  type        = string
}

#########
# mongodb
#########
variable "playbook_vars" {
  description = "Extra vars to include, can be hcl or json"
  type        = any
  default     = {}
}

variable "playbook_vars_file" {
  description = "json or yaml to run"
  type        = string
  default     = ""
}
