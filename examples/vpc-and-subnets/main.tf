module "vpc-and-subnets" {
  source                                  = "../../"
  network_name                            = "custom-vpc"
  description                             = "custom network"
  project_id                              = "hostproject-372817"
  delete_default_internet_gateway_routes  = true
  mtu                                     = 1460
  subnets = [
    {
      subnet_name   = "subnet-01"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "us-west1"
    },
    {
      subnet_name           = "subnet-02"
      subnet_ip             = "10.10.20.0/24"
      subnet_region         = "us-west1"
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
    },
    {
      subnet_name               = "subnet-03"
      subnet_ip                 = "10.10.30.0/24"
      subnet_region             = "us-west1"
      subnet_flow_logs          = "true"
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
      subnet_flow_logs_sampling = 0.7
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
      subnet_flow_logs_filter   = "false"
    }
  ]

  secondary_ip_ranges   = {
    subnet-02 = [
      {
        range_name    = "subnet-02-range-1"
        ip_cidr_range = "192.168.64.0/24"
      },
      {
        range_name    = "subnet-02-range-2"
        ip_cidr_range = "192.168.65.0/24"
      }
    ]
  }
}