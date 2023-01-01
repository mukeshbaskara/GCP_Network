variable "network_name" {
  type  = string
  description = "Name of the VPC network"
}

variable "auto_create_subnets" {
  type  = bool
  default = "false"
  description = "if it is true, subnets will be created in all regions automatically"
}

variable "routing_mode" {
  type  = string
  default = "GLOBAL"
  description = "The network routing mode. default is GLOBAL"
}

variable "project_id" {
  type  = string
  description = "The name of the GCP project where network needs to be created"
}

variable "description" {
  type  = string
  description = "The description of the network being created"
}

variable "delete_default_internet_gateway_routes" {
  type  = bool
  description = "If set, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted"
  default = "false"
}

variable "mtu" {
  type  = number
  description = "The network MTU (If set to 0, meaning MTU is unset - defaults to '1460'). Recommended values: 1460 (default for historic reasons), 1500 (Internet default), or 8896 (for Jumbo packets). Allowed are all values in the range 1300 to 8896, inclusively."
  default = 0
}

variable "subnets" {
  type  = list(map(string))
  description = "list of subnets to be created inside vpc network"
}

variable "secondary_ip_ranges" {
  type  = map(list(string))
  description = "The IP range for secondary CIDR"
}