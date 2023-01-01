variable "subnets" {
  type  = list(map(string))
  description = "The list of subnets being created"
}

variable "secondary_ip_ranges" {
  type  = map(list(object({range_name=string,ip_cidr_range = string})))
  description = "The IP range for secondary CIDR"
}

variable "network_name" {
  type  = string
  description = "The name of the VPC network where subnets will be created"
}

variable "project_id" {
  type  = string
  description = "project ID where subnets will be created"
}