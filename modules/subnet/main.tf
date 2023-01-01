resource "google_compute_subnetwork" "subnet"{
	for_each					= var.subnets
	name						= each.value.subnet_name
	ip_cidr_range				= each.value.subnet_ip
	region						= each.value.subnet_region
	private_ip_google_access	= lookup(each.value, "subnet_private_access", "false")
	dynamic "log_config" {
		for_each = lookup(each.value, "subnet_flow_logs", "false") ? [{
				aggregation_interval = lookup(each.value, "subnet_flow_logs_interval", "INTERVAL_5_SEC")
				flow_sampling = lookup(each.value, "subnet_flow_logs_sampling", "0.5")
				metadata = lookup(each.value, "subnet_flow_logs_metadata", "INCLUDE_ALL_METADATA")
				filter_expr = lookup(each.value, "subnet_flow_logs_filter", "true")
			}] : []
		content {
			aggregation_interval = log_config.value.aggregation
			flow_sampling = log_config.value.flow_sampling
			metadata = log_config.value.metadata
			filter_expr = log_config.value.filter_expr
		}
	}
	dynamic "secondary_ip_range" {
		for_each = lookup(each.value, "secondary_ip_ranges", [])
		content {
			range_name = secondary_ip_range.value.range_name
			ip_cidr_range = secondary_ip_range.value.ip_cidr_range
		}
	}
	network		= var.network_name
	project 	= var.project_id
	description = lookup(each.value, "description", null)
	purpose 	= lookup(each.value, "purpose", null)
	role 		= lookup(each.value, "role", null)
}