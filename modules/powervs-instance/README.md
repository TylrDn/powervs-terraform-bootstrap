# powervs-instance module

Simple module to create a PowerVS instance with standard tagging.

<!-- BEGIN_TF_DOCS -->
### Inputs
| Name | Description | Type | Default |
|------|-------------|------|---------|
| service_instance_id | PowerVS service instance ID | string | n/a |
| instance_name | Instance name | string | n/a |
| proc_type | Processor type | string | "shared" |
| processors | Number of processors | number | n/a |
| memory_mb | Memory in MB | number | n/a |
| sys_type | System type | string | "s922" |
| image_name | Image name (exact match) | string | null |
| image_regex | Image name regex used when image_name is unset | string | null |
| ssh_key_name | SSH key name | string | n/a |
| network_ids | Network IDs to attach (must be non-empty) | list(string) | n/a |
| tags | Tags to apply | list(string) | [] |

### Outputs
| Name | Description |
|------|-------------|
| instance_id | Instance ID |
| instance_name | Instance name |
| private_ip | Private IP address |
| public_ip | Public IP address |
| console_url | Console URL |
| network_ids | Network IDs |
| image | Image used |
| profile | System type |
<!-- END_TF_DOCS -->
