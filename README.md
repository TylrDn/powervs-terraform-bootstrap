# powervs-terraform-bootstrap

Bootstrap IBM Power Virtual Server labs with Terraform. Creates a resource group, network and two LPARs for quick experimentation.

![Architecture](docs/architecture.png)

## Quickstart
```bash
git clone https://github.com/TylrDn/powervs-terraform-bootstrap.git
cd powervs-terraform-bootstrap
cp examples/simple/terraform.tfvars.example terraform.tfvars
terraform init
terraform apply
```

## State & Backends
Local state is default. To use IBM Cloud Object Storage with locking:
```bash
terraform init -backend-config=backend.hcl
```
`backend.hcl`:
```hcl
bucket = "powervs-${env}"
key    = "${env}/terraform.tfstate"
region = "us-south"
endpoint = "s3.direct.us-south.cloud-object-storage.appdomain.cloud"
skip_region_validation      = true
skip_credentials_validation = true
```
Migrate from local:
```bash
terraform state push -force terraform.tfstate
```

## Secrets
Set `IBMCLOUD_API_KEY` via environment or `.env` file:
```bash
export IBMCLOUD_API_KEY=xxxxxxxx
# or
cp .env.example .env
```
GitHub Actions should store it in repo secrets.

## Security
`checkov` and `tfsec` run in CI. Public networks are opt-in in examples.

## Inputs / Outputs

<!-- BEGIN_TF_DOCS -->
### Inputs
| Name | Description | Type | Default |
|------|-------------|------|---------|
| ibmcloud_api_key | IBM Cloud API key | string | n/a |
| region | IBM Cloud region | string | n/a |
| zone | PowerVS zone | string | n/a |
| powervs_service_instance_id | PowerVS service instance identifier | string | n/a |
| resource_group | Resource group name | string | powervs-lab |
| ssh_key_name | Existing SSH key name in the PowerVS workspace | string | n/a |
| aix_image_name | AIX image name | string | AIX 7.3 TLx |
| linux_image_name | Linux image name | string | RHEL 9 for Power |
| aix_profile | AIX instance profile | string | bx2-4x16 |
| linux_profile | Linux instance profile | string | bx2-4x16 |
| owner | Owner tag | string | unknown |
| environment | Environment tag | string | dev |
| cost_center | Cost center tag | string | unknown |
| project | Project tag | string | powervs-bootstrap |

### Outputs
| Name | Description |
|------|-------------|
| aix_instance_id | ID of the AIX LPAR |
| linux_instance_id | ID of the Linux LPAR |
| network_id | ID of the created network |
| aix_ip | IP address of the AIX LPAR if available |
| linux_ip | IP address of the Linux LPAR if available |
<!-- END_TF_DOCS -->

## Contributing
See [CONTRIBUTING.md](CONTRIBUTING.md).

## License
[Apache-2.0](LICENSE)
